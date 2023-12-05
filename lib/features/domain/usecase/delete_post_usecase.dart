import 'package:clean_archeticture_posts_app/features/domain/repositories/postst_repositories.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';

class DeletePostUseCase {
  final PostRepositories postRepositories;

  DeletePostUseCase(this.postRepositories);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await postRepositories.deletePosts(postId);
  }
}
