import 'package:asp/asp.dart';
import 'package:fake_store_app/app/features/home/interactor/atoms/product_atom.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/repositories/i_product_repository.dart';
import '../entities/product_entity.dart';

final fetchProductsAction = atomAction(
  key: 'fetchProductsAction',
  (set) async {
    set(productLoadingAtom, true);

    final service = Modular.get<IProductRepository>();
    try {
      final result = await service.fetchProducts();
      set(productAtom, result);
    } catch (e) {
      set(productAtom, []);
    } finally {
      set(productLoadingAtom, false);
    }
  },
);

final changeCategoryAction = atomAction1<String?>(
  key: 'changeCategoryAction',
  (set, category) {
    set(selectedCategoryAtom, category);
  },
);

final addProductAction = atomAction1<ProductEntity>(
  key: 'addProductAction',
  (set, product) {
    final cartItems = Map<ProductEntity, int>.from(cartAtom.state);
    cartItems.update(product, (quantity) => quantity + 1, ifAbsent: () => 1);
    set(cartAtom, cartItems);
  },
);

final removeProductAction = atomAction1<ProductEntity>(
  key: 'removeProductAction',
  (set, product) {
    final cartItems = Map<ProductEntity, int>.from(cartAtom.state);
    if (cartItems.containsKey(product)) {
      cartItems.update(product, (quantity) => quantity - 1);
      if (cartItems[product]! <= 0) cartItems.remove(product);
    }
    set(cartAtom, cartItems);
  },
);

final clearCartAction = atomAction(
  key: 'clearCartAction',
  (set) {
    set(cartAtom, <ProductEntity, int>{});
  },
);
