import 'dart:convert';

import 'package:company_task/login_screen/answer.dart';
import 'package:company_task/models/question_mapper/field.dart';
import 'package:company_task/models/question_mapper/option.dart';
import 'package:company_task/models/question_mapper/question_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  Rx<QuestionMapper>? question;

  List<Field> listField = [];

  int selectedIndex = 0;

  Field? currentField;

  List<Field> selectedList = [];

  Future<void> init() async {
    selectedIndex = 0;

    Dio dio = Dio();

    var data = await readJSON("question.json");

    var list = QuestionMapper.fromJson(data);

    question = Rx(list);

    listField.addAll(question?.value.schema?.fields ?? []);

    currentField = listField.first;
    update();
  }

  /// method to read json from the [fileName] json file
  /// present int he assets folder.
  static dynamic readJSON(String fileName) async {
    final String response =
        await rootBundle.loadString('assets/json/$fileName');
    final data = await json.decode(response);
    return data;
  }

  void onSelection(
      // required Option option,
      {
    required Option option,
  }) {
    currentField?.fieldData?.value = option;

    update();
  }

  /* ********************/
  //
  /* ********************/
  void nextButtonClicked({required BuildContext context}) {
    selectedIndex++;

    if (selectedIndex < listField.length) {
      currentField = listField[selectedIndex];
    }

    if (selectedIndex > listField.length) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Answer();
      }));
    }

    update();
  }

  /* ********************/
  //back button clicked
  /* ********************/
  void backButtonClicked() {
    if (selectedIndex > 0) {
      selectedIndex--;
      currentField = listField[selectedIndex];
    }
    update();
  }
}
