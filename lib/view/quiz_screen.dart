import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/model/question_model.dart';

class QuizPage extends StatelessWidget {
  final QuestionController question = Get.put(QuestionController());
  //final UserData questions = UserData.fromJson(questions.data);
  QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    var questionText = questions[index].questionText;
                    return ListTile(
                      leading: Text(questions[index].questionId.toString()),
                      title: Text(questionText),
                    );
                  });
            }
          }),
    );
  }
}
