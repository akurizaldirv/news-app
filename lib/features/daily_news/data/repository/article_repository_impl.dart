import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learn_tdd/core/constants/constants.dart';
import 'package:learn_tdd/core/resources/data_state.dart';
import 'package:learn_tdd/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:learn_tdd/features/daily_news/domain/entities/article_entity.dart';
import 'package:learn_tdd/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        category: categoryQuery,
        country: countryQuery
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        // return DataSuccess(List.empty());
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
          )
        );
      }
    } on DioException catch (e) {
      print("errorrr ---- ${e}");
      print("errorrr ---- ${e.stackTrace}");
      return DataFailed(e);
    }
  }
}