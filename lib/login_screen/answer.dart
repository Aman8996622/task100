import 'package:company_task/login_screen/introduction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Answer extends StatefulWidget {
  const Answer({super.key});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: GetBuilder<IntroductionController>(builder: (controller) {
                return Container(
                  child: ListView.builder(
                      itemCount: controller.selectedList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  controller.selectedList[index].fieldData
                                          ?.label ??
                                      "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  controller.selectedList[index].fieldData
                                          ?.value?.value ??
                                      "",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
