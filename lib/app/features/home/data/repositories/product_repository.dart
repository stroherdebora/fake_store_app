import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../core/constants/app_constants.dart';
import '../../interactor/entities/product_entity.dart';
import '../../interactor/dtos/product_dto.dart';
import 'i_product_repository.dart';

class ProductRepository implements IProductRepository {
  @override
  Future<List<ProductEntity>> fetchProducts() async {
    final url = Uri.parse("${AppConstants.baseUrl}/products");

    try {
      final response = await http.get(url);

      log("Request to: $url");
      log("Response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        log("Response data: $data");

        return data.map((item) => ProductDTO.fromJson(item).toEntity()).toList();
      } else {
        throw Exception("Failed to load products. Status code: ${response.statusCode}");
      }
    } catch (e, stackTrace) {
      log("Error fetching products: $e", stackTrace: stackTrace);
      rethrow;
    }
  }
}
