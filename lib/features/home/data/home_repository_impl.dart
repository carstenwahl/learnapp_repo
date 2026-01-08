import 'package:injectable/injectable.dart';

import '../domain/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  int _counter = 0;

  @override
  int getCounter() => _counter;

  @override
  void incrementCounter() {
    _counter++;
  }
}
