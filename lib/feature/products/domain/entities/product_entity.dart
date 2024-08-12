import 'package:products_app/feature/products/domain/entities/product.dart';

class ProductEntity {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      products: List<Product>.from(json['products'].map((x) => Product.fromJson(x))),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': List<dynamic>.from(products.map((x) => x.toJson())),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  @override
  String toString() {
    return 'ProductEntity(products: $products, total: $total, skip: $skip, limit: $limit)';
  }
}