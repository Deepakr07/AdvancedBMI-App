import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final height;
  final weight;
  double _bmi = 0;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return 'You have higher weight than normal. Try Exercising more';
    else if (_bmi > 18.5)
      return 'You have a normal body Weight Good Job!';
    else
      return 'You have low body weight.Eat more nutritious food and gain weight!';
  }
}
