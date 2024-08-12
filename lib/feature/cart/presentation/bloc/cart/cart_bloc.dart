import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';
import 'package:products_app/feature/products/domain/usecases/get_saved_products.dart';
import 'package:products_app/feature/products/domain/usecases/remove_article.dart';
import 'package:products_app/feature/products/domain/usecases/save_article.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  final GetSavedProductUseCase  _getSavedProducts;
  final SaveProductUseCase _saveProduct;
  final RemoveProductUseCase _removeProduct;
  CartBloc(this._getSavedProducts, this._saveProduct, this._removeProduct) : super(const GetCartProductsLoading()) {
    on<GetSavedProducts>(_onGetSavedProducts);
    on<SaveProduct>(_onSaveProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  FutureOr<void> _onGetSavedProducts(GetSavedProducts event, Emitter<CartState> emit) async {

    final articles  =  await _getSavedProducts();
    emit(GetCartProductsLoaded(articles));
  }

  FutureOr<void> _onSaveProduct(SaveProduct event, Emitter<CartState> emit) async{
    await _saveProduct(params: event.product);
    final articles  =  await _getSavedProducts();
    emit(GetCartProductsLoaded(articles));
  }

  FutureOr<void> _onRemoveProduct(RemoveProduct event, Emitter<CartState> emit) async {
    await _removeProduct(params: event.product);
    final articles  =  await _getSavedProducts();
    emit(GetCartProductsLoaded(articles));
  }
}
