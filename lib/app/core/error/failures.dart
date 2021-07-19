import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class InvalidSearchText extends Failure {}

class EmptyList extends Failure {}

class ErrorSearch extends Failure {}

class DatasourceResultNull extends Failure {}
