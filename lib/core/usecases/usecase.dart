/// Generic UseCase base class used by domain layer.
/// Type is the return type, Params is the input parameter type.
abstract class UseCase<Result, Params> {
  Future<Result> call(Params params);
}

/// Convenience type for usecases without parameters.
class NoParams {
  const NoParams();
}
