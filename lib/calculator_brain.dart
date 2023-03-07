import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final height;
  final weight;
  double _bmi = 0;
  String calculateBmi() {
    _bmi = weight / pow(weight / 100, 2);
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
}
