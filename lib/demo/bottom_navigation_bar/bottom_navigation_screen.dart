import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/screens/user_page.dart';
import 'package:flutter_application_1/demo/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:flutter_application_1/dummy_bloc/dummy_counter_view.dart';
import 'package:flutter_application_1/form_validation/view/validation_form_screen.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              fixedColor: Colors.amber,
              onTap: (i) {
                BlocProvider.of<BottomNavigationBarBloc>(context).add(BottomNavigationChangeEvent(currentIndex: i));
              },
              currentIndex: BlocProvider.of<BottomNavigationBarBloc>(context).currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.abc_rounded),
                    label: "ABC",
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.pages),
                    label: "Pages",
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.dangerous),
                    label: "Dangerous",
                    backgroundColor: Colors.blue)
              ]),
          body: IndexedStack(
            index: BlocProvider.of<BottomNavigationBarBloc>(context).currentIndex,
            children: [
              const MyHomePage(),
              ValidationFormScreen(),
              const DummyCounterView(),
              const UserPage()
            ],
          ),
        );
      },
    );
  }
}
