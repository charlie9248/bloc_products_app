part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
}


class GetProducts extends ProductsEvent {
  const GetProducts();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class AddProductToCart extends ProductsEvent {

  final Product product;
  const AddProductToCart(this.product);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}






