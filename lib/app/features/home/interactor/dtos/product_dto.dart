import '../entities/product_entity.dart';

class ProductDTO {
  final int id;
  final String title;
  final String category;
  final String image;
  final double price;

  ProductDTO({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
    required this.price,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'image': image,
      'price': price,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      category: category,
      image: image,
      price: price,
    );
  }

  static ProductDTO fromEntity(ProductEntity entity) {
    return ProductDTO(
      id: entity.id,
      title: entity.title,
      category: entity.category,
      image: entity.image,
      price: entity.price,
    );
  }
}
