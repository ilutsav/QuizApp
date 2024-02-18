class QuestionResponse {
  final bool success;
  final List<Question> data;

  QuestionResponse({required this.success, required this.data});

  factory QuestionResponse.fromJson(Map<String, dynamic> json) {
    return QuestionResponse(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((questionJson) => Question.fromJson(questionJson))
              .toList() ??
          [],
    );
  }
}

class Question {
  final int questionId;
  final int quizId;
  final String questionText;

  Question({
    required this.questionId,
    required this.quizId,
    required this.questionText,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionId: json['question_id'] ?? 0,
      quizId: json['quiz_id'] ?? 0,
      questionText: json['question_text'] ?? '',
    );
  }
}
