part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class LoadingPostsStates extends PostsState {}

class LoadedPostsStates extends PostsState {
  final List<Posts> posts;

  const LoadedPostsStates({required this.posts});

  @override
  List<Object> get props => [posts];
}

class ErrorPostsStates extends PostsState {
  final String message;

  const ErrorPostsStates({required this.message});

  @override
  List<Object> get props => [message];
}
