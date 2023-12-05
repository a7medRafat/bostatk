import 'package:clean_archeticture_posts_app/features/domain/entities/posts.dart';
import 'package:clean_archeticture_posts_app/features/domain/repositories/postst_repositories.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';

class GetAllPostsUseCase {
  final PostRepositories postRepositories;

  GetAllPostsUseCase(this.postRepositories);
  Future<Either<Failure, List<Posts>>> call() async {
    return await postRepositories.getAllPosts();
  }
}
