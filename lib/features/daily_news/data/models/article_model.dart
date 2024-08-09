import 'package:floor/floor.dart';
import 'package:learn_tdd/features/daily_news/domain/entities/article_entity.dart';


@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  // const ArticleModel({
  //   super.id,
  //   super.author,
  //   super.title,
  //   super.description,
  //   super.uri,
  //   super.imageUri,
  //   super.publishedAt,
  //   super.content
  // });
  const ArticleModel({
    int ? id,
    String ? author,
    String ? title,
    String ? description,
    String ? url,
    String ? urlToImage,
    String ? publishedAt,
    String ? content,
  }): super(
    id: id,
    author: author,
    title: title,
    description: description,
    uri: url,
    imageUri: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );
  // const ArticleModel({
  //   int? id,
  //   String? author,
  //   String? title,
  //   String? description,
  //   String? uri,
  //   String? imageUri,
  //   String? publishedAt,
  //   String? content
  // }) : super(
  //   id: id,
  //   author: author,
  //   title: title,
  //   description: description,
  //   uri: uri,
  //   imageUri: imageUri,
  //   publishedAt: publishedAt,
  //   content: content
  // );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}