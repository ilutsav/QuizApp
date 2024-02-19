import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/view/quiz_screen.dart';

class HomePage extends StatelessWidget {
  final QuestionController questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
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
