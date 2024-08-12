part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  final Product? product;

  const CartEvent({this.product});
}


class GetSavedProducts  extends  CartEvent {
  const GetSavedProducts();

  @override
  List<Object?> get props => [];

}


class RemoveProduct  extends  CartEvent {
  const RemoveProduct(Product product) : super(product:  product);

  @override
  List<Object?> get props => [];

}


class SaveProduct  extends  CartEvent {
  const SaveProduct(Product product) : super(product:  product);

  @override
  List<Object?> get props => [];

}