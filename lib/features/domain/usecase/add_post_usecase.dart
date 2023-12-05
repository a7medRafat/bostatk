import 'package:clean_archeticture_posts_app/features/domain/entities/posts.dart';
import 'package:clean_archeticture_posts_app/features/domain/repositories/postst_repositories.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';

class AddPostUseCase {
  final PostRepositories postRepositories;

  AddPostUseCase(this.postRepositories);
  Future<Either<Failure, Unit>> call(Posts posts)async{
    return await postRepositories.addPosts(posts);
  }
}