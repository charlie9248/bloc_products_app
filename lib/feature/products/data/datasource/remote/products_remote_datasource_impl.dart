
import 'package:products_app/feature/products/data/datasource/remote/products_remote_datasource.dart';
import 'package:products_app/feature/products/data/models/product_reponse.dart';
import 'package:products_app/shared/network_service.dart';

class ProductsRemoteDataSourceImpl extends  ProductsRemoteDataSource {


  final NetworkService  _networkService;

  ProductsRemoteDataSourceImpl(this._networkService);

  @override
  Future<ProductResponse> getProducts() async {

    try{
      var response  =  await _networkService.get("products");
      if(response.statusCode == 200){
        var data = response.data;
        ProductResponse result = ProductResponse.fromJson(data as Map<String, dynamic>);
        return result;
      }else{
        throw Error();
      }
    }
    catch(e){
      rethrow;
    }
  }
}