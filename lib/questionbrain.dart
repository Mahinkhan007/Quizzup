import 'questions.dart';

class QuizBrain {
  int _questionNum = 0;
  List<Question> _questionBank = [
    Question(q: 'South Africa has one capital', a: false),
    Question(
        q: 'The Atlantic ocean is the biggest ocean in the world', a: false),
    Question(q: 'Greenland is the largest Island in the world', a: true),
    Question(q: 'Toy Story was pixar\'s first movie', a: true),
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true)
  ];

  void nextQues() {
    if (_questionNum < _questionBank.length - 1) {
      _questionNum++;
    }
  }

  String getQuesText() {
    return _questionBank[_questionNum].questionText;
  }

  bool getQuesAns() {
    return _questionBank[_questionNum].questionAnswer;
  }

  bool isFinished() {
    if (_questionNum >= _questionBank.length - 1) {
      return true;
    } else
      return false;
  }

  void reset() {
    _questionNum = 0;
  }
}
