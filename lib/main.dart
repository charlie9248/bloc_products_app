import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_bloc.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_state.dart';
import 'package:products_app/feature/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:products_app/feature/cart/presentation/views/cart_page.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';
import 'package:products_app/feature/products/domain/usecases/get_product_usecase.dart';
import 'package:products_app/feature/products/presentation/bloc/products_bloc.dart';
import 'package:products_app/shared/views/bottomNavigation_bar.dart';

import 'di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  provideDataSources();
  provideRepositories();
  provideUseCases();
  provideBlocs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Widget> bottomNavScreen = <Widget>[const HomePage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsBloc(injector.get<GetProductUseCase>())
              ..add(const GetProducts()),
          ),
          BlocProvider(
            create: (context) => injector<CartBloc>(),
          ),
          BlocProvider(
            create: (context) => injector<BottomNavBloc>(),
          )
          // Add other providers here if needed
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Products'),
                    actions: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CartPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.add_shopping_cart_outlined))
                    ],
                  ),
                  body: bottomNavScreen.elementAt(state.tabIndex),
                bottomNavigationBar: const BottomNavBar(),
              );
            },
          ),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          if (state is ProductsError) {
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
          }
          if (state is ProductsLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductPreView(
                  product: product,
                );
              },
            );
          }
          return Container();
        },
    );
  }
}

class ProductPreView extends StatelessWidget {
  final Product product;
  const ProductPreView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
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
    );
  }
}
