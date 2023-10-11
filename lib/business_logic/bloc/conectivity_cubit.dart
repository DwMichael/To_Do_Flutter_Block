import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';

class ConnectivityCubit extends Cubit<bool> {
  ConnectivityCubit() : super(true) {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _checkInternetConnection();
    });
  }

  Timer? _timer;

  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        emit(true);
      }
    } on SocketException catch (_) {
      emit(false);
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
