import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'form_validation_event.dart';
part 'form_validation_state.dart';

class FormValidationBloc extends Bloc<FormValidationEvent, FormValidationState> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isSubmitted = false;
  FormValidationBloc() : super(FormValidationInitial()) {
    on<FormValidationEvent>((event, emit) {
      if(event is TextInputChangedEvent){
        if(event.userName.isEmpty){
          emit(FormErrorState(errorMsg: 'Please enter valid input'));
        }else if(event.password.isEmpty && event.password.length < 8){
          emit(FormErrorState(errorMsg: 'Please enter valid password'));
        }
        else if(event.userName.isNotEmpty && event.password.isNotEmpty && event.password.length > 8){
          emit(FormErrorState(errorMsg: ''));
        }
      }
    });


  }
}
