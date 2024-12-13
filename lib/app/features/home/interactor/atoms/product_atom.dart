import 'package:asp/asp.dart';
import 'package:fake_store_app/app/features/home/interactor/entities/product_entity.dart';

final productAtom = atom<List<ProductEntity>>(
  key: 'productAtom',
  [],
);

final productLoadingAtom = atom<bool>(
  key: 'productLoadingAtom',
  false,
);

final selectedCategoryAtom = atom<String?>(
  key: 'selectedCategoryAtom',
  null,
);

final cartAtom = atom<Map<ProductEntity, int>>(
  key: 'cartAtom',
  {},
);
