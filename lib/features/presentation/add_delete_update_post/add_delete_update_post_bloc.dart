import 'package:bloc/bloc.dart';
import 'package:clean_archeticture_posts_app/core/errors/failures.dart';
import 'package:clean_archeticture_posts_app/core/messages/messages.dart';
import 'package:clean_archeticture_posts_app/features/domain/entities/posts.dart';
import 'package:clean_archeticture_posts_app/features/domain/usecase/delete_post_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecase/add_post_usecase.dart';
import '../../domain/usecase/update_posts.dart';

part 'add_delete_update_post_event.dart';

part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUseCase addPost;
  final UpdatePostUseCase updatePost;
  final DeletePostUseCase deletePost;

  AddDeleteUpdatePostBloc(
      {required this.addPost,
      required this.updatePost,
      required this.deletePost})
      : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      if (event is AddPostEvent)
      {
        emit(LoadingAddDeleteUpdateState());
        final failureOrMessage = await addPost.call(event.posts);
        failureOrMessage.fold(
            (failure) => emit(
                  ErrorAddDeleteUpdatePostStates(
                      message: _failureMessage(failure)),
                ),
            (_) => emit(const MessageAddDeleteUpdatePostStates(
                message: ADD_SUCCESS_MESSAGE)));

        // _eitherDoneMessageOrErrorStete(failureOrMessage, ADD_SUCCESS_MESSAGE);
      } else if (event is DeletePostEvent) {
        emit(LoadingAddDeleteUpdateState());
        final failureOrMessage = await deletePost.call(event.postId);
        failureOrMessage.fold(
                (failure) => emit(
              ErrorAddDeleteUpdatePostStates(
                  message: _failureMessage(failure)),
            ),
                (_) => emit(const MessageAddDeleteUpdatePostStates(
                message: DELETE_SUCCESS_MESSAGE)));

        // _eitherDoneMessageOrErrorStete(failureOrMessage, DELETE_SUCCESS_MESSAGE);
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddDeleteUpdateState());
        final failureOrMessage = await updatePost.call(event.posts);
        failureOrMessage.fold(
          (failure) => emit(ErrorAddDeleteUpdatePostStates(message: _failureMessage(failure)),),
          (_) => emit(const MessageAddDeleteUpdatePostStates(message: Update_SUCCESS_MESSAGE)),);
        // _eitherDoneMessageOrErrorStete(failureOrMessage, Update_SUCCESS_MESSAGE);
      }
    });
  }

  _eitherDoneMessageOrErrorStete(Either<Failure, Unit> either, String message) {
    either.fold(
        (failure) =>
            ErrorAddDeleteUpdatePostStates(message: _failureMessage(failure)),
        (_) => MessageAddDeleteUpdatePostStates(message: message));
  }

  String _failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'please try again later';
      case OfflineFailure:
        return 'no internet connection';
      default:
        return 'unexpected error';
    }
  }
}
