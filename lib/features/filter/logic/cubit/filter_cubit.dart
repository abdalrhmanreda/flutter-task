import 'package:bloc/bloc.dart';
import 'package:flutter_task/features/filter/data/models/filter_model.dart';
import 'package:flutter_task/features/filter/logic/cubit/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  FilterModel filterModel = FilterModel();

  void updateCategory(String? category) {
    filterModel = filterModel.copyWith(category: category);
    emit(FilterUpdated());
  }

  void updateLocation(String? location) {
    filterModel = filterModel.copyWith(location: location);
    emit(FilterUpdated());
  }

  void updateMonthlyPayments(List<String> payments) {
    filterModel = filterModel.copyWith(monthlyPayments: payments);
    emit(FilterUpdated());
  }

  void updateType(String? type) {
    filterModel = filterModel.copyWith(type: type);
    emit(FilterUpdated());
  }

  void updateRoomCount(String? roomCount) {
    filterModel = filterModel.copyWith(roomCount: roomCount);
    emit(FilterUpdated());
  }

  void updatePriceRange(String? priceRange) {
    filterModel = filterModel.copyWith(priceRange: priceRange);
    emit(FilterUpdated());
  }

  void updatePaymentMethod(String? paymentMethod) {
    filterModel = filterModel.copyWith(paymentMethod: paymentMethod);
    emit(FilterUpdated());
  }

  void updatePropertyStatus(String? propertyStatus) {
    filterModel = filterModel.copyWith(propertyStatus: propertyStatus);
    emit(FilterUpdated());
  }

  void resetFilter() {
    filterModel.reset();
    emit(FilterReset());
  }

  int getResultCount() {
    // Mock result count - replace with actual logic
    return 10000;
  }
}
