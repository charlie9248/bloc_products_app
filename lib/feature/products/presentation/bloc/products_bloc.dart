import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';
import 'package:products_app/feature/products/domain/usecases/get_product_usecase.dart';


part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  final GetProductUseCase  _getProductUseCase;

  ProductsBloc(this._getProductUseCase) : super(ProductsLoading()) {

    on<GetProducts>(_onGetProducts);
  }

  Future<void> _onGetProducts(GetProducts event, Emitter<ProductsState> emit) async{
    final  results = await _getProductUseCase.call();

    try {
      emit(ProductsLoaded(products: results.data!.products));
    }
    catch(e){
      emit(ProductsError(errorMessage: results.error!.message.toString()));
    }
  }
}
