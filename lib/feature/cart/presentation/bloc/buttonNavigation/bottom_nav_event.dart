
sealed class ButtonNavEvent {}

class SelectedTabEvent extends ButtonNavEvent {
  final int index;
  SelectedTabEvent(this.index);
}
