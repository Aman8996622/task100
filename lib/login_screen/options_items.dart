import 'package:company_task/models/question_mapper/field.dart';
import 'package:company_task/models/question_mapper/option.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OptionsItems extends StatelessWidget {
  final Option option;
  final Field? field;

  final ValueSetter<Option> onChanged;

  const OptionsItems({
    super.key,
    required this.option,
    required this.onChanged,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(option);
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                option.isSelected == 1 ? Colors.orange : Colors.grey.shade900,
            width: 1,
          ),
        ),
        child: Row(children: [
          Radio(
            // value: field?.fieldData?.value == option ? 1 : 0,
            // value: option == field?.fieldData?.value ? 1 : 0,
            value: 1,
            activeColor: Colors.orange,
            // groupValue: field?.fieldData?.value,
            groupValue: field?.fieldData?.value == option ? 1 : 0,
            onChanged: (value) {},
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Text(
              option.value ?? "",
              style: TextStyle(
                fontSize: 20,
                color: option.isSelected == 1
                    ? Colors.orange
                    : Colors.grey.shade900,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
