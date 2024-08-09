import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_tdd/core/resources/data_state.dart';
import 'package:learn_tdd/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:learn_tdd/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:learn_tdd/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  
  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()) {
    on <GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticlesDone(dataState.data!)
      );
    }
  }
}