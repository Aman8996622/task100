import 'field.dart';

class Schema {
  List<Field>? fields;

  Schema({this.fields});

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        fields: (json['fields'] as List<dynamic>?)
            ?.map((e) => Field.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'fields': fields?.map((e) => e.toJson()).toList(),
      };
}
