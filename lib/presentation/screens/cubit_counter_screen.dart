import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        // child: Text('counter value: ${counterState.counter}'),
        child: BlocBuilder<CounterCubit, CubitCounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            print('state cambio');
            return Text('counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increasedBy(3);
              },
              heroTag: '1',
              child: const Text('+3')),
          const SizedBox(height: 15),
          FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increasedBy(2);
              },
              heroTag: '2',
              child: const Text('+2')),
          const SizedBox(height: 15),
          FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increasedBy(1);
              },
              heroTag: '3',
              child: const Text('+1')),
        ],
      ),
    );
  }
}
