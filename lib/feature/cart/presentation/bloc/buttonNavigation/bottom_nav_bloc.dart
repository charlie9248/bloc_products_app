

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_event.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_event.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_event.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_state.dart';

class BottomNavBloc extends Bloc<ButtonNavEvent, BottomNavState> {
  BottomNavBloc() : super(const TabSelectedState(0)) {
    on<SelectedTabEvent>(_onSelectedTabEvent);
  }

  FutureOr<void> _onSelectedTabEvent(SelectedTabEvent event, Emitter<BottomNavState> emit) {
     emit(TabSelectedState(event.index));
  }
}
