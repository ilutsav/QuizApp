import 'package:get/get.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/model/option_model.dart';

class QuizController extends GetxController {
  final QuestionController questionController = Get.put(QuestionController());
  final Option options = Get.put(Option());
  var questions;
  RxInt index = 0.obs;

  QuizController() {
    print(options.optionsList()[0].optionText);
    initializeQuestions(); // Call the initialization method in the constructor
  }

  void initializeQuestions() async {
    questions = await questionController.getQuestions();
  }

  void onnext() {
    if (index < questions.data.length - 1) {
      index++;
    }
  }
}
