import 'package:injectable/injectable.dart';

import 'home_repository.dart';

@lazySingleton
class IncrementCounterUseCase {
  final HomeRepository repository;

  IncrementCounterUseCase(this.repository);

  void call() => repository.incrementCounter();
}
