import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_bloc.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_event.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_state.dart';

import '../../feature/cart/presentation/views/cart_page.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBloc, BottomNavState>(
      listener: (context, state) {
        if(state.tabIndex == 1){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        return ClipRRect(

          borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
          child: BottomNavigationBar(
            onTap: (index) {
              context.read<BottomNavBloc>().add(SelectedTabEvent(index));
              print(index);
            },
            currentIndex
            : state.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            fixedColor: Colors.red,
            elevation: 3,
            items: const [

              BottomNavigationBarItem(
                  label: "home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: "home", icon: Icon(Icons.add_shopping_cart_rounded))
            ],
          ),
        );
      },
    );
  }
}
