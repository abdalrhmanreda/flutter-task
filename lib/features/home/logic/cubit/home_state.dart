abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeChangeOfferIndex extends HomeState {}

// final class HomeInsertProducts extends HomeState {}
class HomeGetProductsLoading extends HomeState {}

class HomeGetProductsSuccess extends HomeState {}

class HomeGetProductsError extends HomeState {
  final String message;
  HomeGetProductsError({required this.message});
}
