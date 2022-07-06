import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ActivityEntity {
  int? id;
  String? title;
  String? content;
  String? iniHours;
  String? finalHours;
  String? status;
  String? createAt;
  String? updateAt;

  ActivityEntity({
    this.id,
    this.title,
    this.content,
    this.iniHours,
    this.finalHours,
    this.status,
    this.createAt,
    this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'iniHours': iniHours,
      'finalHours': finalHours,
      'status': status,
      'createAt': createAt,
      'updateAt': updateAt,
    };
  }

  factory ActivityEntity.fromMap(Map<String, dynamic> map) {
    return ActivityEntity(
      id: map['id'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
      iniHours: map['iniHours'] as String,
      finalHours: map['finalHours'] as String,
      status: map['status'] as String,
      createAt: map['createAt'] as String,
      updateAt: map['updateAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityEntity.fromJson(String source) =>
      ActivityEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
