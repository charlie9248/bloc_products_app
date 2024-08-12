
import 'package:products_app/core/data_state.dart';
import 'package:products_app/feature/products/data/models/product_reponse.dart';
import 'package:products_app/feature/products/domain/repository/products_repository.dart';
import 'package:products_app/feature/products/domain/usecases/base_usecase.dart';

class GetProductUseCase extends BaseUseCase<DataState<ProductResponse> , void> {

  final ProductRepository  productRepository;

   GetProductUseCase(this.productRepository);
  @override
  Future<DataState<ProductResponse>> call({void params}) {
    return productRepository.geProducts();
  }

}