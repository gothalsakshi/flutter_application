import 'package:flutter/material.dart';
import 'package:flutter_application_1/form_validation/form_validation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationFormScreen extends StatelessWidget {
   ValidationFormScreen({super.key});

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
                controller: userName,
                onChanged: (val){
                BlocProvider.of<FormValidationBloc>(context).add(TextInputChangedEvent(userName: userName.text, password: password.text));
              },),
          TextFormField(
                controller: password,
                onChanged: (val){
                BlocProvider.of<FormValidationBloc>(context).add(TextInputChangedEvent(userName: userName.text, password: password.text));
              },),
          BlocBuilder<FormValidationBloc,FormValidationState>(
            builder: (ctx,state){
            if(state is FormErrorState){
              return Text(state.errorMsg);
            }else{
              return const SizedBox();
            }
          }),
          BlocBuilder<FormValidationBloc,FormValidationState>(
            builder: (ctx,state){
            return ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all((state is FormSubmittedState) ? Colors.amber : Colors.grey)),
              onPressed: (){
                BlocProvider.of<FormValidationBloc>(context).add(FormSubmittedEvent(userName: userName.text, password: password.text)); 
              },
             child: const Text('Submit'));
          })
        ],
      )
    );
  }
}