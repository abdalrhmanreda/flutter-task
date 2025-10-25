import 'package:bloc/bloc.dart';
import 'package:flutter_task/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int offerIndex = 0;
  void changeOfferIndex(int index) {
    offerIndex = index;
    emit(HomeInitial());
  }
}
