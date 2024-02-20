import 'package:get/get.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/model/option_model.dart';

import '../view/home_screen.dart';

class QuizController extends GetxController {
  final QuestionController questionController = Get.put(QuestionController());
  var questions;
  RxInt index = 0.obs;
  RxInt selectedOption = 9.obs;

  List<Map<String, dynamic>> selectedOptions = [];

  QuizController() {
    resetIndex();
    resetSelectedOption();
    initializeQuestions(); // Call the initialization method in the constructor
  }

  void initializeQuestions() async {
    questions = await questionController.getQuestions();
  }

  void selectOption(int option) {
    selectedOption.value = option;
  }

  bool isOptionSelected(int option) {
    return selectedOption.value == option;
  }

  void resetIndex() {
    index.value = 0;
  }

  void resetSelectedOption() {
    selectedOption.value = 9;
  }

  void onnext() {
    if (index < questions.data.length - 1) {
      selectedOptions.add({
        "questionId": index.value,
        "optionId": selectedOption.value,
      });
      resetSelectedOption();
      index++;
    } else {
      print(selectedOptions);
      Get.to(() => HomePage());
    }
  }
}
