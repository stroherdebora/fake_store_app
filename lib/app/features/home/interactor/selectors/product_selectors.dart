import 'package:asp/asp.dart';

import '../atoms/product_atom.dart';

final productsSelector = selector<Map<String, dynamic>>(
  key: 'productsSelector',
  (get) {
    final products = get(productAtom);
    final selectedCategory = get(selectedCategoryAtom);
    final isLoading = get(productLoadingAtom);

    const categoryMap = {
      "Eletrônicos": "electronics",
      "Joias": "jewelery",
      "Roupas masculinas": "men's clothing",
      "Roupas femininas": "women's clothing",
    };

    final apiCategory = categoryMap[selectedCategory];
    final filteredProducts = apiCategory != null ? products.where((p) => p.category == apiCategory).toList() : products;

    return {
      'products': filteredProducts,
      'isLoading': isLoading,
    };
  },
);

final totalValueAtom = selector<double>(
  key: 'totalValueAtom',
  (get) {
    final cartItems = get(cartAtom);
    return cartItems.entries.fold(0.0, (sum, item) => sum + item.key.price * item.value);
  },
);
