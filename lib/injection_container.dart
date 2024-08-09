import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_tdd/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:learn_tdd/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:learn_tdd/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:learn_tdd/features/daily_news/domain/repository/article_repository.dart';
import 'package:learn_tdd/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:learn_tdd/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // Usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
