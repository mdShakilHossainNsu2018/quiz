import 'package:quiz/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question('শর্করা প্রোটিন বাঁচোয়া খাদ্য কাকে বলা হয়?', true),
    Question('ফ্লেম কোষ ফিতা কৃমির রেচন অঙ্গ?', true),
    Question('হিমোগ্লোবিনের গড় আয়ু  ৯০ দিন ', false),
    Question('সিটা কেঁচোর গমনাঙ্গের নাম?', true),
    Question('বৃহত্তম এককোষী শৈবালের নাম অ্যামিবা', false),
    Question('মানব দেহের বৃহত্তম গ্রন্থি লিভার', true),
    Question('লাইসোজোম কোষ অঙ্গানুকে সুইসাইড ব্যাগ বলা হয়', true),
    Question('বার্ড ফ্লু ভাইরাসের নাম H5N1', true),
    Question(' বাংলা  আমাদের  মাতৃ ভাষা', true),
    Question(' ২১  শে  ফেব্রুয়ারি  বিজয় দিবস।', false),
  ];

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  int get questionLength {
    return _questions.length;
  }
}
