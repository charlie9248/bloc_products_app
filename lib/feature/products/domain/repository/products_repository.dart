import 'package:products_app/core/data_state.dart';
import 'package:products_app/feature/products/data/models/product_reponse.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';

abstract class ProductRepository  {
  Future<DataState<ProductResponse>> geProducts();

  Future<void> saveProduct(Product product);

  Future<void> deleteProduct(Product product);

  Future<List<Product>> getProducts();

}