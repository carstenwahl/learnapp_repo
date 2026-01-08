# learnapp

This project was refactored to adopt a feature-based, clean-architecture layout.

Core additions

- `lib/core/network/` — `NetworkClient` interface and placeholder `HttpNetworkClient` implementation. Implement with `dio` or `http` for real network calls.
- `lib/core/error/` — `Failure` base type and common failures like `ServerFailure` and `CacheFailure`.
- `lib/core/usecases/` — Generic `UseCase<Result, Params>` base class and `NoParams` helper for domain usecases.

Quick actions

```bash
flutter pub get
flutter analyze
flutter test
```

Next steps

- Implement concrete network client (e.g. with `dio`) and register in DI.
- Expand `core/` with logging, interceptors, and error mappings.
- Add more domain features and tests per feature.
