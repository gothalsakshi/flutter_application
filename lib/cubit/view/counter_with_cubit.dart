import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWithCubit extends StatelessWidget {
  const CounterWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().counterIncrement();
              },
              child: const Icon(Icons.add)),
          FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().counterDecrement();
              },
              child: const Icon(Icons.add)),
        ],
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(child: Text('$state'));
        },
      ),
    );
  }
}
