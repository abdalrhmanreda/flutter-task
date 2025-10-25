abstract class LayoutState {}

final class LayoutStateInitial extends LayoutState {}

final class ChangeNavBarState extends LayoutState {
  final int index;
  ChangeNavBarState({required this.index});
}
