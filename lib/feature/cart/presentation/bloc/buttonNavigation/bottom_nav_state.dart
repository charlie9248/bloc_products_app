

sealed class BottomNavState {
  final int tabIndex;
  const BottomNavState({required this.tabIndex});
}

final class TabSelectedState extends BottomNavState {

  const TabSelectedState(tabIndex) : super(tabIndex : tabIndex) ;
}
