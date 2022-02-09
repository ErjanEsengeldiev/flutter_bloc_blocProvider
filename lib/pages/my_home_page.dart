import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_block_class/counter_bloc/counter_bloc.dart';
import 'package:test_block_class/pages/second_page.dart';
import '../counter_bloc/counter_state.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  final CounterBloc _bloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocProvider<CounterBloc>(
              create: (context) => CounterBloc(),
              child: BlocConsumer<CounterBloc, CounterState>(
                listener: ((context, state) {}),
                bloc: _bloc,
                builder: (context, state) {
                  if (state is CounterStateValue) {
                    return Text(
                      state.count.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return const Text('0');
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BlocProvider.value(
                value: _bloc,
                child: const SecondPage())));
        },
      ),
    );
  }
}
