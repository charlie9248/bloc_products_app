import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:products_app/di/injector.dart';
import 'package:products_app/feature/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:products_app/feature/cart/presentation/widget/cart_preview.dart';
import 'package:products_app/main.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<CartBloc>()..add(const GetSavedProducts()),
      child:  Scaffold(
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is GetCartProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.green ,),
              );
            }
            if (state is GetCartProductError) {
              return const Center(
                child:  Text(
                  "Something went wrong",
                ),
              );
            }
            if (state is GetCartProductsLoaded) {
              return ListView.builder(
                itemCount: state.products!.length,
                itemBuilder: (context, index) {
                  final product = state.products![index];
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            context.read<CartBloc>().add(RemoveProduct(product));
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ), child: CartPreViewPage(product: product,));
                },
              );
            }
            return Container();
          },
        )),
    );
  }
}
