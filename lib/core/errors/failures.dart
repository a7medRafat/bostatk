import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ServerFailure extends Failure {}

class OfflineFailure extends Failure {}

class EmptyCacheFailure extends Failure {}
