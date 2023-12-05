import 'package:equatable/equatable.dart';

class Posts extends Equatable {
  final String title;
  final String body;
  final int? id;

  const Posts({required this.title, required this.body,this.id});

  @override
  List<Object?> get props => [title,body,id];
}
