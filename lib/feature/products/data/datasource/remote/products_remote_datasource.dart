import 'package:products_app/feature/products/data/models/product_reponse.dart';

abstract class ProductsRemoteDataSource  {
  Future<ProductResponse> getProducts();
}