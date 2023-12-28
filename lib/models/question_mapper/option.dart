class Option {
  String? key;
  String? value;

  int? isSelected = 0;

  Option({
    this.key,
    this.value,
    this.isSelected = 0,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        key: json['key'] as String?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
      };
}
