// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrement>((event, emit) {
     emit(CounterIncrementState());
    });

     on<CounterDecrement>((event, emit) {
      emit(CounterDcrementState());
    });
  }

  incremetCounter(){
    counter ++;
  }

  decrementCounter(){
    counter --;
  }
}
