import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.properties = const []});

  final List<dynamic> properties;

  @override
  List<Object?> get props => [properties];
}

class RemoteServerFailure extends Failure {}

class LocalServerFailure extends Failure {}

class CacheFailure extends Failure {}