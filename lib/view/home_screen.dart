import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/view/quiz_screen.dart';

class HomePage extends StatelessWidget {
  final QuestionController questionController = Get.put(QuestionController());
  HomePage({super.key});

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
                  questionController.getQuestions();
                  Get.to(() => QuizPage());
                },
                child: Text('Start Quiz'))
          ],
        ),
      ),
    );
  }
}
