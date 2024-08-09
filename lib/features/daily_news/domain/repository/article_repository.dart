import 'package:learn_tdd/core/resources/data_state.dart';
import 'package:learn_tdd/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}