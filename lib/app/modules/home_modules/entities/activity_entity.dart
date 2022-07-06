import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ActivityEntity {
  int? id;
  String? title;
  String? content;

  ActivityEntity({
    this.id,
    this.title,
    this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
    };
  }

  factory ActivityEntity.fromMap(Map<String, dynamic> map) {
    return ActivityEntity(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityEntity.fromJson(String source) =>
      ActivityEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
