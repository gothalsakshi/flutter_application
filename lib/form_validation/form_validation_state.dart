part of 'form_validation_bloc.dart';

@immutable
sealed class FormValidationState {}

final class FormValidationInitial extends FormValidationState {}

class TextInputChangedState extends FormValidationState{
  final String userName;
  final String password;

  TextInputChangedState({required this.userName, required this.password});
}

class FormSubmittedState extends FormValidationState{}

class FormErrorState extends FormValidationState{
  final String errorMsg;

  FormErrorState({required this.errorMsg});
}

class ValidState extends FormValidationState{}