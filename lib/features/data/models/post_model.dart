import 'package:clean_archeticture_posts_app/features/domain/entities/posts.dart';

class PostModel extends Posts {
  const PostModel(

      {required super.title, required super.body,super.id});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(title: json['title'], body: json['body'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
