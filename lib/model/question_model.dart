// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

Questions questionsFromJson(String str) => Questions.fromJson(json.decode(str));

String questionsToJson(Questions data) => json.encode(data.toJson());

class Questions {
  bool success;
  List<Datum> data;

  Questions({
    required this.success,
    required this.data,
  });

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int questionId;
  int quizId;
  String questionText;

  Datum({
    required this.questionId,
    required this.quizId,
    required this.questionText,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        questionId: json["question_id"],
        quizId: json["quiz_id"],
        questionText: json["question_text"],
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "quiz_id": quizId,
        "question_text": questionText,
      };
}
