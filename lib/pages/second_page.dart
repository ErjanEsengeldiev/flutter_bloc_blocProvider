import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_block_class/counter_bloc/counter_bloc.dart';
import '../counter_bloc/counter_event.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider.value(
            value: context.read<CounterBloc>(),
            child: FloatingActionButton(
              heroTag: 'Increment',
              onPressed: () {
                context.read<CounterBloc>().add(IncrementValue());
                Navigator.pop(context);
              },
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(width: 50),
          BlocProvider.value(
            value: context.read<CounterBloc>(),
            child: FloatingActionButton(
              heroTag: 'Decrement',
              onPressed: () {
                context.read<CounterBloc>().add(DecrementValue());
                Navigator.pop(context);
              },
              child: const Icon(Icons.delete),
            ),
          ),
        ],
      )),
    );
  }
}
