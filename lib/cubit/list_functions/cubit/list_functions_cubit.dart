import 'package:flutter_bloc/flutter_bloc.dart';
part 'list_functions_state.dart';

class ListFunctionsCubit extends Cubit<ListFunctionsState> {
  ListFunctionsCubit() : super(ListFunctionsInitial());
  int listAddCounter = 0;
  List list = [];
  List countryList = ['India','Afghanistan','Algeria','Andorra','Angola','Belgium','Canada','China','Egypt','France','Germany','Iceland','India','Iraq','Italy','Mexico'];

  checkListData(){
    
    
  }

  addingDataIntoList(){
    // listAddCounter ++;
    // list.add(listAddCounter);
    emit(ListAddState(list: countryList));
  }

  removingDataIntoList(int index){
    // listAddCounter --;
    countryList.removeAt(index);
    emit(ListRemoveState(list: countryList));
  }
}
