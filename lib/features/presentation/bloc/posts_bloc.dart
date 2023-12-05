import 'package:bloc/bloc.dart';
import 'package:clean_archeticture_posts_app/core/errors/failures.dart';
import 'package:clean_archeticture_posts_app/core/failures_string/failures_string.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/posts.dart';
import '../../domain/usecase/get_all_posts.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;

  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPostsStates());
        final failureOrPosts = await getAllPosts.call();
        failureOrPosts.fold(
            (failure) => emit(ErrorPostsStates(message: _failureMessage(failure))),
            (posts) => emit(LoadedPostsStates(posts: posts)));
        // _mapFailureOrPostToStates(failureOrPosts);
      } else if (event is RefreshAllPostsEvent) {
        emit(LoadingPostsStates());
        final failureOrPosts = await getAllPosts.call();
        failureOrPosts.fold(
                (failure) => emit(ErrorPostsStates(message: _failureMessage(failure))),
                (posts) => emit(LoadedPostsStates(posts: posts)));
        // _mapFailureOrPostToStates(failureOrPosts);
      }
    });
  }
}

void _mapFailureOrPostToStates(Either<Failure, List<Posts>> either) {
  return either.fold(
      (failure) => ErrorPostsStates(message: _failureMessage(failure)),
      (post) => LoadedPostsStates(posts: post));
}

String _failureMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return EMPTY_CACHED_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFLINE_FAILURE_MESSAGE;
    default:
      return 'unexpected error';
  }
}
