import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (_) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView({Key? key}) : super(key: key);

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  void resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(CounterReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) => Text('Bloc Counter ${counterBloc.state.transactionCount}')),
        actions: [
          IconButton(onPressed: () => resetCounter(context), icon: Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) =>
            Text('counter value ${counterBloc.state.counter}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () => increaseCounterBy(context, 3),
              heroTag: '1',
              child: const Text('+3')),
          const SizedBox(height: 15),
          FloatingActionButton(
              onPressed: () => increaseCounterBy(context, 2),
              heroTag: '2',
              child: const Text('+2')),
          const SizedBox(height: 15),
          FloatingActionButton(
              onPressed: () => increaseCounterBy(context, 1),
              heroTag: '3',
              child: const Text('+1')),
        ],
      ),
    );
  }
}
