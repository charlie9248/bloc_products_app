import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_bloc.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_event.dart';
import 'package:products_app/feature/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';


class CartPreViewPage extends StatelessWidget {
  final Product product;
  const CartPreViewPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        context.read<BottomNavBloc>().add(SelectedTabEvent(0));

        return true;
      },
      child: Card(
        elevation: 2,
        child: Container(
            height: size.height * 0.2,
            width: size.width,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(color: Color(0xD8E9F1E5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 120.0,
                        ),
                        child: CachedNetworkImage(
                          fit: BoxFit
                              .fill,
                          imageUrl: product.images[0],
                          placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            product.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30, // Specify the width
                      height: 30, // Specify the height
                      child: FloatingActionButton(
                        heroTag: "btn${product.id}",
                        child: const Icon(Icons.add),
                        onPressed: () {
                          context.read<CartBloc>().add(SaveProduct(product));
                        },
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}