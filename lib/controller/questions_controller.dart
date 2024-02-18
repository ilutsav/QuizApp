import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuestionController extends GetxController {
  Future<void> getQuestions() async {
    String mainUrl = 'https://backend-gilt-two.vercel.app';
    final response =
        await http.get(Uri.parse('$mainUrl/api/v1/question/getAll/6'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
    }
  }
}
