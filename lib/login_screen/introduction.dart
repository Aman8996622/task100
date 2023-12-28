import 'dart:math';

import 'package:company_task/login_screen/introduction_controller.dart';
import 'package:company_task/login_screen/options_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Introduction extends StatefulWidget {
  final IntroductionController controller = Get.put(IntroductionController());

  Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  void initState() {
    widget.controller.init();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              GetBuilder<IntroductionController>(builder: (controller) {
                return Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    controller.question?.value.title ?? "",
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),

              Flexible(
                flex: 6,
                child:
                    GetBuilder<IntroductionController>(builder: (controller) {
                  return Container(
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                        ),
                        Flexible(
                          child: GetBuilder<IntroductionController>(
                              builder: (controller) {
                            return Container(
                              width: double.infinity,
                              height: 5,
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.listField.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                        // horizontal: 10,
                                        right: 10,
                                      ),
                                      width: 70,
                                      height: 10,
                                      color: controller.selectedIndex == index
                                          ? Colors.blue
                                          : Colors.grey,
                                    );
                                  }),
                            );
                          }),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            controller.currentField?.fieldData?.label ?? "",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 10,
                          child: GetBuilder<IntroductionController>(
                              builder: (controller) {
                            return Container(
                              // color: Colors.red,
                              child: ListView.builder(
                                  itemCount: (controller.currentField?.fieldData
                                              ?.options ??
                                          [])
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: OptionsItems(
                                        option: (controller.currentField
                                                ?.fieldData?.options ??
                                            [])[index],
                                        field: controller.currentField,
                                        onChanged: (value) {
                                          controller.onSelection(
                                            option: value,
                                          );
                                        },
                                      ),
                                    );
                                  }),
                            );
                          }),
                        )
                      ],
                    ),
                  );
                }),
              ),
              //  Container(
              //   child:  ,
              //  )

              footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget footer() {
    return Flexible(
      child: Container(
        // color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                widget.controller.backButtonClicked();
              },
              child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 16,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      )
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                widget.controller.nextButtonClicked(
                  context: context,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                // height: 100,
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
                child: Transform.rotate(
                    angle: pi,
                    child: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
