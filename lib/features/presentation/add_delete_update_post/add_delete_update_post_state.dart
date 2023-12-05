part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {
  @override
  List<Object> get props => [];
}

class LoadingAddDeleteUpdateState extends AddDeleteUpdatePostState {
  @override
  List<Object?> get props => [];
}

class MessageAddDeleteUpdatePostStates extends AddDeleteUpdatePostState {
  final String message;

  const MessageAddDeleteUpdatePostStates({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ErrorAddDeleteUpdatePostStates extends AddDeleteUpdatePostState {
  final String message;

  const ErrorAddDeleteUpdatePostStates({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
