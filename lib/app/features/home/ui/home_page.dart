import 'package:asp/asp.dart';

import 'package:fake_store_app/app/features/home/interactor/atoms/product_atom.dart';
import 'package:flutter/material.dart';

import '../interactor/entities/product_entity.dart';
import '../interactor/actions/product_actions.dart';

import '../interactor/selectors/product_selectors.dart';
import 'widgets/cart_widget.dart';
import 'widgets/product_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HookStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ScaffoldState get scaffoldState => scaffoldKey.currentState!;

  @override
  void initState() {
    super.initState();
    fetchProductsAction();
  }

  final categories = ["Eletrônicos", "Joias", "Roupas masculinas", "Roupas femininas"];

  @override
  Widget build(BuildContext context) {
    final productsState = useAtomState(productsSelector);

    final products = productsState['products'] as List<ProductEntity>;
    final isLoading = productsState['isLoading'] as bool;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Fake Store",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 35,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      useAtomState(cartAtom).values.fold(0, (sum, quantity) => sum + quantity).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () => scaffoldState.openEndDrawer(),
          ),
        ],
      ),
      endDrawer: const CartWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  final isSelected = useAtomState(selectedCategoryAtom) == category;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        changeCategoryAction(selected ? category : null);
                      },
                      selectedColor: Colors.blue,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    itemCount: products.length,
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.62,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCardWidget(product: product);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
