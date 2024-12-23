// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//  import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// // part 'post_model.freezed.dart';
// part 'post_model.g.dart';

// // @freezed
// @Riverpod()
// class PostModel with _$PostModel {
//   const factory PostModel({
//     required int id,
//     required String body,
//     required String title,
//   }) = _PostModel;
//    factory PostModel.fromJson(Map<String,dynamic> json) =>
//       _$PostModelFromJson(json);

// }
class PostModel {
  int id;
  String title;
  String body;
  PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  PostModel copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostModel(id: $id, title: $title, body: $body)';

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}
