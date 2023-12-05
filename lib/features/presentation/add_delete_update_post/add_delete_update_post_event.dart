part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostEvent extends Equatable {
  const AddDeleteUpdatePostEvent();
}

class AddPostEvent extends AddDeleteUpdatePostEvent {
  final Posts posts;

  const AddPostEvent({required this.posts});

  @override
  // TODO: implement props
  List<Object?> get props => [posts];
}

class DeletePostEvent extends AddDeleteUpdatePostEvent {
  final int postId;

  const DeletePostEvent({required this.postId});

  @override
  // TODO: implement props
  List<Object?> get props => [postId];
}

class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  final Posts posts;

  const UpdatePostEvent({required this.posts});

  @override
  // TODO: implement props
  List<Object?> get props => [posts];
}
