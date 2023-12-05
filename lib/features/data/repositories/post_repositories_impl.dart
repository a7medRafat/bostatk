import 'package:clean_archeticture_posts_app/core/errors/exceptions.dart';
import 'package:clean_archeticture_posts_app/core/errors/failures.dart';
import 'package:clean_archeticture_posts_app/features/data/datasources/post_local_data_source.dart';
import 'package:clean_archeticture_posts_app/features/data/datasources/post_remote_data_source.dart';
import 'package:clean_archeticture_posts_app/features/data/models/post_model.dart';
import 'package:clean_archeticture_posts_app/features/domain/entities/posts.dart';
import 'package:clean_archeticture_posts_app/features/domain/repositories/postst_repositories.dart';
import 'package:dartz/dartz.dart';
import '../../../core/network/network_info.dart';

class PostRepositoriesImpl implements PostRepositories {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoriesImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Posts>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.gatAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPosts(Posts posts) async {
    PostModel postModel =
        PostModel(title: posts.title, body: posts.body);
    return await _getMessage(() {
      return remoteDataSource.addPost(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePosts(int id) async {
    return await _getMessage(() {
      return remoteDataSource.deletePost(id);
    });
  }

  @override
  Future<Either<Failure, Unit>> updatePosts(Posts posts) async {
    PostModel postModel =
        PostModel(title: posts.title, body: posts.body, id: posts.id);

    return await _getMessage(() {
      return remoteDataSource.updatePost(postModel);
    });
  }



  Future<Either<Failure, Unit>> _getMessage(Future<Unit> Function() deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
