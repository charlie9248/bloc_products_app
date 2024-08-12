
import 'package:products_app/core/data_state.dart';
import 'package:products_app/feature/products/data/models/product_reponse.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';
import 'package:products_app/feature/products/domain/repository/products_repository.dart';
import 'package:products_app/feature/products/domain/usecases/base_usecase.dart';

class SaveProductUseCase extends BaseUseCase<void , Product> {

  final ProductRepository  productRepository;

  SaveProductUseCase(this.productRepository);
  @override
  Future<void> call({Product? params}) {
    return productRepository.saveProduct(params!);
  }

}