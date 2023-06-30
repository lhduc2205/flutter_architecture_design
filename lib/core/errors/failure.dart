import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.properties = const {}});

  final Map<String, dynamic> properties;

  @override
  List<Object?> get props => [properties];
}

class RemoteServerFailure extends Failure {}

class LocalServerFailure extends Failure {
  const LocalServerFailure({
    Map<String, dynamic>? properties,
  }) : super(properties: properties ?? const {});
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}