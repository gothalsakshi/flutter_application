import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void counterIncrement(){
    final updatedValue = state + 1;
    emit(updatedValue);
  }

   void counterDecrement(){
    final updatedValue = state - 1;
    emit(updatedValue);
  }
}
