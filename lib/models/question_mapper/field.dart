import 'field_data.dart';

class Field {
  String? type;
  int? version;
  FieldData? fieldData;

  

  Field({this.type, this.version, this.fieldData});

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        type: json['type'] as String?,
        version: json['version'] as int?,
        fieldData: json['field_data'] == null
            ? null
            : FieldData.fromJson(json['field_data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'version': version,
        'field_data': fieldData?.toJson(),
      };
}
