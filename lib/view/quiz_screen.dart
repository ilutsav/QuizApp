import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/controller/quiz_controller.dart';
import 'package:quiz_app/model/question_model.dart';

class QuizPage extends StatelessWidget {
  final QuestionController question = Get.put(QuestionController());
  final QuizController quizController = Get.put(QuizController());
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
              // return ListView.builder(
              //     itemCount: questions.length,
              //     itemBuilder: (context, index) {
              //       var questionText = questions[index].questionText;
              //       return ListTile(
              //         leading: Text(questions[index].questionId.toString()),
              //         title: Text(questionText),
              //       );
              //     });
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
                                Get.back();
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${quizController.options.optionsList()[0].optionText}'),
                            SizedBox(height: 12),
                            Text(
                                '${quizController.options.optionsList()[1].optionText}'),
                            SizedBox(height: 12),
                            Text(
                                '${quizController.options.optionsList()[2].optionText}'),
                            SizedBox(height: 12),
                            Text(
                                '${quizController.options.optionsList()[3].optionText}'),
                          ],
                        ),
                        SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            print('index before ${quizController.index.value}');
                            quizController.onnext();
                            print('index after ${quizController.index.value}');
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
    );
  }
}
