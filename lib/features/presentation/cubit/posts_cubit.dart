// import 'package:bloc/bloc.dart';
// import 'package:clean_archeticture_posts_app/core/errors/failures.dart';
// import 'package:clean_archeticture_posts_app/features/domain/usecase/get_all_posts.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../core/failures_string/failures_string.dart';
// import '../../domain/entities/posts.dart';
// part 'posts_state.dart';
//
// class PostsCubit extends Cubit<PostsState> {
//   PostsCubit({required this.getAllPostsUseCase}) : super(PostsInitial());
//
//   static PostsState get (context)=> BlocProvider.of(context);
//
//   final GetAllPostsUseCase getAllPostsUseCase;
//     getAllPosts()async{
//       emit(PostsLoadingStates());
//       final failureOrPosts = await getAllPostsUseCase.call();
//       return failureOrPosts.fold(
//               (failure) => emit(PostsErrorStates(message: _failureMessage(failure))),
//               (post) => emit(PostsLoadedStates(posts: posts)));
//
//     }
//
//   String _failureMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return SERVER_FAILURE_MESSAGE;
//       case EmptyCacheFailure:
//         return EMPTY_CACHED_FAILURE_MESSAGE;
//       case OfflineFailure:
//         return OFLINE_FAILURE_MESSAGE;
//       default:
//         return 'unexpected error';
//     }
//   }
//
// }
