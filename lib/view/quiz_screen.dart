import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/controller/quiz_controller.dart';
import 'package:quiz_app/model/question_model.dart';
import 'package:quiz_app/view/home_screen.dart';

class QuizPage extends StatelessWidget {
  final QuestionController question = Get.put(QuestionController());
  final QuizController quizController = Get.put(QuizController());
  QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: FutureBuilder<Questions>(
            future: question.getQuestions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data == null) {
                return const Text('No data available');
              } else {
                var questions = snapshot.data!.data;
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Obx(
                      () => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  quizController.resetIndex();
                                  _onBackPressed(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                ),
                              ),
                              const Text(
                                'First Quiz',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Icon(Icons.lightbulb),
                            ],
                          ),
                          const SizedBox(height: 75),
                          Text(
                            questions[quizController.index.value]
                                    .questionId
                                    .toString() +
                                '  ' +
                                questions[quizController.index.value]
                                    .questionText,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  quizController.selectOption(0);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            quizController.isOptionSelected(0)
                                                ? Colors.black.withOpacity(0.4)
                                                : Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset('assets/0.svg'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  quizController.selectedOption(1);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            quizController.isOptionSelected(1)
                                                ? Colors.black.withOpacity(0.4)
                                                : Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset('assets/1.svg'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print('presed 2');
                                  quizController.selectedOption(2);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            quizController.isOptionSelected(2)
                                                ? Colors.black.withOpacity(0.4)
                                                : Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset('assets/2.svg'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  quizController.selectOption(3);
                                  print('presed 3');
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            quizController.isOptionSelected(3)
                                                ? Colors.black.withOpacity(0.4)
                                                : Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset('assets/3.svg'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {
                              quizController.onnext();
                            },
                            child: quizController.index.value == 3
                                ? Text('Finish')
                                : Text('Next'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Exit Quiz?'),
            content: Text('This will erase all your progress'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  'Exit',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
    if (exitApp) {
      quizController.resetSelectedOption();
      Get.to(() => HomePage());
    }
    return exitApp;
  }
}
