
import 'Question.dart';

class Quiz{
  int _index=0;
  List<Question> _questionBank=[
    Question('You can lead a cow down stairs but not up stairs',false),
    Question('Approximately one quarter of human bones are in the feet',true),
    Question('A slug\'s blood is green',true),
    Question('Some cats are actually allergic to human',true),
    Question('It is illegal to pee in the ocean in Portugal', true),
    Question('No piece of square dry paper can be folded in half more than 7 times', false),
    Question('The loudest soud is produced by any animal is 188 decibels. That animal is African elephant', false),
    Question('The total surface area of two human lungs is approximately 70 square meter', true),
    Question('Google was originally called \"Backrub\"', true),
    Question('Chocolate affects a dog heart and nervous system; a few ounce are enough to kill a small dog', true),
    Question('In West Virgina, USA, if you accidentally hit an animal with your car, your free to take it home and eat', true),
  ];

  bool nextQuestion(){
    if(_index<_questionBank.length-1){
      _index++;
      return true;
    }
    return false;
  }

  String getGuestions(){
    return _questionBank[_index].question;
  }

  bool getAnswers(){
    return _questionBank[_index-1].answer;
  }

  int getLenght(){
    return _questionBank.length;
  }

  void setIndex(int index){
    _index=index;
  }
}