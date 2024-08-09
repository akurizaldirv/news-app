import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_tdd/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:learn_tdd/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:learn_tdd/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        "Daily News",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is RemoteArticlesError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemoteArticlesDone) {
        return ListView.separated(
            itemBuilder: (_, index) =>
                ArticleTile(article: state.articles![index]),
            separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ),
            itemCount: state.articles!.length);
      }
      return const SizedBox();
    });
  }
}
