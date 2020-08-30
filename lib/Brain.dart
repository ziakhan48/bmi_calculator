

import 'dart:math';

class Brain{

  Brain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);

  }
  String getResult(){
    if(_bmi>=25) {
      return 'over weight';
    }else if(_bmi>18.5){
      return 'normal weight';
    }
    else  return 'under weight';
  }

  String interpretation(){
    if(_bmi>=25) {
      return 'you have higher than normal body weight';
    }else if(_bmi>18.5){
      return 'good! normal body weight';
    }
    else  return 'you are under weight..try to eat more';
  }
}