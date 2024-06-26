import 'package:flutter/material.dart';

import 'package:to_do_app/bloc/counterbloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final bloc = CounterBloc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Dodawaj Matsony',
            ),
            StreamBuilder<int>(
              initialData: 0,
              stream: bloc.stream,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              bloc.add(CounterIncrementPressed());
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            child: const Icon(Icons.plus_one_rounded),
            onPressed: () {
              bloc.add(CounterNotesIcrementPressed());
            },
          ),
        ],
      ),
    );
  }
}
