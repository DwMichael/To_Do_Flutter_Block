import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/business_logic/bloc/conectivity_cubit.dart';
import 'package:to_do_app/business_logic/bloc/counterbloc.dart';

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
      body:
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                bloc.stream..toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
         ),
      
    floatingActionButton: FloatingActionButton(onPressed: (){
  bloc.add(CounterIncrementPressed());
    }),
    );
    
  }
}
