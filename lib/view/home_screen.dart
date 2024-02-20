import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/controller/quiz_controller.dart';
import 'package:quiz_app/view/quiz_screen.dart';

class HomePage extends StatelessWidget {
  final QuestionController questionController = Get.put(QuestionController());
  final QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                quizController.resetIndex();
                Get.to(() => QuizPage());
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
