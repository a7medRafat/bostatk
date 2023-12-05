part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAllPostsEvent extends PostsEvent{}

class RefreshAllPostsEvent extends PostsEvent{}