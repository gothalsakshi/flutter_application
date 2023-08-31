import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dummy_event.dart';
part 'dummy_state.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {
  int dummyCounter = 0;
  DummyBloc() : super(DummyInitial()) {
    on<DummyEvent>((event, emit) {
      if(event is DummyCounterIncrementEvent){
        dummyCounter++;
        emit(DummyCounterIncrementState(counter: dummyCounter));
      }else if(event is DummyCounterDecrementEvent){
        dummyCounter--;
        emit(DummyCounterDecrementState(counter: dummyCounter));
      }
    });
  }
}
