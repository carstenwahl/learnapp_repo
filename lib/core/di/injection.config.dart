// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:learnapp/core/utils/logger.dart' as _i92;
import 'package:learnapp/features/home/data/home_repository_impl.dart' as _i907;
import 'package:learnapp/features/home/domain/get_counter_usecase.dart'
    as _i134;
import 'package:learnapp/features/home/domain/home_repository.dart' as _i152;
import 'package:learnapp/features/home/domain/increment_counter_usecase.dart'
    as _i868;
import 'package:learnapp/features/home/presentation/home_controller.dart'
    as _i340;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i92.Logger>(() => _i92.Logger());
    gh.lazySingleton<_i152.HomeRepository>(() => _i907.HomeRepositoryImpl());
    gh.lazySingleton<_i134.GetCounterUseCase>(
      () => _i134.GetCounterUseCase(gh<_i152.HomeRepository>()),
    );
    gh.lazySingleton<_i868.IncrementCounterUseCase>(
      () => _i868.IncrementCounterUseCase(gh<_i152.HomeRepository>()),
    );
    gh.lazySingleton<_i340.HomeController>(
      () => _i340.HomeController(
        getCounterUseCase: gh<_i134.GetCounterUseCase>(),
        incrementCounterUseCase: gh<_i868.IncrementCounterUseCase>(),
      ),
    );
    return this;
  }
}
