import '../../domain/entities/product_entity.dart';

class ProductModel {
  final int id;
  final String title;
  final String price;
  final String status;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      status: json['status'],
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      status: entity.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'price': price, 'status': status};
  }

  ProductEntity toEntity() {
    return ProductEntity(id: id, title: title, price: price, status: status);
  }
}
