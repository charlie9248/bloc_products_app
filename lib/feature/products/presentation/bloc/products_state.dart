part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {

  const ProductsState();
}

final class ProductsLoading extends ProductsState {
  @override
  List<Object> get props => [];
}


final class ProductsLoaded  extends ProductsState {

  final List<Product> products;

  const  ProductsLoaded({required this.products});
  @override
  List<Object> get props => [];
}

final class ProductsError extends ProductsState {

  final String errorMessage;
  const ProductsError({required this.errorMessage});

  @override
  List<Object?> get props => [];
}


