import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/model/question_model.dart';

class QuestionController extends GetxController {
  Future<Questions> getQuestions() async {
    String mainUrl = 'https://backend-gilt-two.vercel.app';
    final response =
        await http.get(Uri.parse('$mainUrl/api/v1/question/getAll/6'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final questions = Questions.fromJson(data);
      return questions;
      //print(data);
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
