import 'package:clean_archeticture_posts_app/core/network/network_info.dart';
import 'package:clean_archeticture_posts_app/features/data/datasources/post_local_data_source.dart';
import 'package:clean_archeticture_posts_app/features/data/datasources/post_remote_data_source.dart';
import 'package:clean_archeticture_posts_app/features/data/repositories/post_repositories_impl.dart';
import 'package:clean_archeticture_posts_app/features/domain/repositories/postst_repositories.dart';
import 'package:clean_archeticture_posts_app/features/domain/usecase/add_post_usecase.dart';
import 'package:clean_archeticture_posts_app/features/domain/usecase/delete_post_usecase.dart';
import 'package:clean_archeticture_posts_app/features/domain/usecase/get_all_posts.dart';
import 'package:clean_archeticture_posts_app/features/domain/usecase/update_posts.dart';
import 'package:clean_archeticture_posts_app/features/presentation/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:clean_archeticture_posts_app/features/presentation/bloc/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
        addPost: sl(),
        updatePost: sl(),
        deletePost: sl(),
      ));

  // UseCases
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PostRepositories>(() => PostRepositoriesImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  //DataSources
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));
  //External

  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  await sl.isReady<SharedPreferences>();

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
