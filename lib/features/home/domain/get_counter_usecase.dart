import 'package:injectable/injectable.dart';

import 'home_repository.dart';

@lazySingleton
class GetCounterUseCase {
  final HomeRepository repository;

  GetCounterUseCase(this.repository);

  int call() => repository.getCounter();
}
