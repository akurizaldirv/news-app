import 'package:learn_tdd/core/resources/data_state.dart';
import 'package:learn_tdd/core/use_cases/use_case.dart';
import 'package:learn_tdd/features/daily_news/domain/entities/article_entity.dart';
import 'package:learn_tdd/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {

  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}