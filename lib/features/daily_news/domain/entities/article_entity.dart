import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String? title;
  final String? author;
  final String? description;
  final String? uri;
  final String? imageUri;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    this.id,
    this.title,
    this.author,
    this.description,
    this.uri,
    this.imageUri,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      author,
      description,
      uri,
      imageUri,
      publishedAt,
      content
    ];
  }
}
