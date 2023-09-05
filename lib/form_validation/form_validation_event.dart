part of 'form_validation_bloc.dart';

@immutable
abstract class FormValidationEvent {}

class TextInputChangedEvent extends FormValidationEvent{
  final String userName;
  final String password;

  TextInputChangedEvent({required this.userName, required this.password});
}

class FormSubmittedEvent extends FormValidationEvent{
  final String userName;
  final String password;

  FormSubmittedEvent({required this.userName, required this.password});
}

