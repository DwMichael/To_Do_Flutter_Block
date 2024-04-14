import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

final class CounterNotesIcrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>(
      (event, emit) {
        emit(state + 1);
      },
    );
    on<CounterNotesIcrementPressed>(
      (event, emit) {
        emit(state + 2);
      },
    );
  }
}
