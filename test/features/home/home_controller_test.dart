import 'package:flutter_test/flutter_test.dart';
import 'package:learnapp/features/home/presentation/home_controller.dart';
import 'package:learnapp/features/home/data/home_repository_impl.dart';
import 'package:learnapp/features/home/domain/get_counter_usecase.dart';
import 'package:learnapp/features/home/domain/increment_counter_usecase.dart';

void main() {
  group('HomeController', () {
    test('starts with counter 0', () {
      final repo = HomeRepositoryImpl();
      final controller = HomeController(
        getCounterUseCase: GetCounterUseCase(repo),
        incrementCounterUseCase: IncrementCounterUseCase(repo),
      );
      expect(controller.counter, 0);
    });

    test('increment increases counter and notifies listeners', () {
      final repo = HomeRepositoryImpl();
      final controller = HomeController(
        getCounterUseCase: GetCounterUseCase(repo),
        incrementCounterUseCase: IncrementCounterUseCase(repo),
      );
      var notified = false;
      controller.addListener(() => notified = true);

      controller.increment();

      expect(controller.counter, 1);
      expect(notified, isTrue);
    });
  });
}
