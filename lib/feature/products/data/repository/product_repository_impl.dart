
import 'package:dio/dio.dart';
import 'package:products_app/core/data_state.dart';
import 'package:products_app/feature/products/data/datasource/database/app_database.dart';
import 'package:products_app/feature/products/data/datasource/remote/products_remote_datasource.dart';
import 'package:products_app/feature/products/data/models/product_reponse.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';
import 'package:products_app/feature/products/domain/repository/products_repository.dart';

class ProductRepositoryImpl extends ProductRepository {

  final ProductsRemoteDataSource _productsRemoteDataSource;
  final AppDatabase _appDatabase;

  ProductRepositoryImpl(this._productsRemoteDataSource , this._appDatabase);

  @override
  Future<DataState<ProductResponse>> geProducts() async {
    try{
      var result = await _productsRemoteDataSource.getProducts() ;
      return DataSuccess(result);
    } on DioException catch(error) {
      return DataFailure(error);
    }
  }

  @override
  Future<void> deleteProduct(Product product) {
    return _appDatabase.productDAO.deleteArticle(product);
  }

  @override
  Future<void> saveProduct(Product product) {
    return _appDatabase.productDAO.insertProduct(product);
  }

  @override
  Future<List<Product>> getProducts() {
    return _appDatabase.productDAO.getProducts();
  }

}