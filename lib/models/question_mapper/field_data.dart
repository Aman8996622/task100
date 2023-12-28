import 'option.dart';

class FieldData {
  String? name;
  String? label;
  bool? hidden;
  bool? readonly;
  List<Option>? options;

  Option? value;


  FieldData({
    this.name,
    this.label,
    this.hidden,
    this.readonly,
    this.options,
    this.value
  });

  factory FieldData.fromJson(Map<String, dynamic> json) => FieldData(
        name: json['name'] as String?,
        label: json['label'] as String?,
        hidden: json['hidden'] as bool?,
        readonly: json['readonly'] as bool?,
        options: (json['options'] as List<dynamic>?)
            ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'label': label,
        'hidden': hidden,
        'readonly': readonly,
        'options': options?.map((e) => e.toJson()).toList(),
      };
}
