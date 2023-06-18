import 'package:architecture_designed/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<(Failure?, T?)> call(P param);
}

class NoParam {}