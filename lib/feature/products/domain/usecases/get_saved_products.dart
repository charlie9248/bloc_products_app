import 'package:products_app/core/data_state.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';
import 'package:products_app/feature/products/domain/repository/products_repository.dart';
import 'package:products_app/feature/products/domain/usecases/base_usecase.dart';

class GetSavedProductUseCase extends BaseUseCase<List<Product> , void> {

  final ProductRepository  productRepository;

  GetSavedProductUseCase(this.productRepository);
  @override
  Future<List<Product>> call({void params}) {
    return productRepository.getProducts();
  }

}