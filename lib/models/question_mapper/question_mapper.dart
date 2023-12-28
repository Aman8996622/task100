import 'schema.dart';

class QuestionMapper {
  String? title;
  String? name;
  String? slug;
  String? description;
  Schema? schema;

  QuestionMapper({
    this.title,
    this.name,
    this.slug,
    this.description,
    this.schema,
  });

  factory QuestionMapper.fromJson(Map<String, dynamic> json) {
    var a = QuestionMapper(
      title: json['title'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      schema: json['schema'] == null
          ? null
          : Schema.fromJson(json['schema'] as Map<String, dynamic>),
    );

    return a;
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'name': name,
        'slug': slug,
        'description': description,
        'schema': schema?.toJson(),
      };
}
