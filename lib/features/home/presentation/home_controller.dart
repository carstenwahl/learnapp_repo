import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../domain/get_counter_usecase.dart';
import '../domain/increment_counter_usecase.dart';

@lazySingleton
class HomeController extends ChangeNotifier {
  final GetCounterUseCase getCounterUseCase;
  final IncrementCounterUseCase incrementCounterUseCase;

  HomeController({
    required this.getCounterUseCase,
    required this.incrementCounterUseCase,
  }) {
    _counter = getCounterUseCase();
  }

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    incrementCounterUseCase();
    _counter = getCounterUseCase();
    notifyListeners();
  }
}
