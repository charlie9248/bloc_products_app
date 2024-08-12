part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  final List<Product> ? products;
  const CartState({this.products});

}


class GetCartProductsLoading  extends CartState {
  const GetCartProductsLoading();

  @override
  List<Object?> get props => [];

}

class GetCartProductsLoaded  extends CartState {

  const GetCartProductsLoaded(List<Product> products) : super(products: products);

  @override
  List<Object?> get props => [products];

}


class GetCartProductError  extends CartState {

  const GetCartProductError();

  @override
  List<Object?> get props => [];

}


