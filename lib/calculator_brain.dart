import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'Overweight';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 30) {
      return 'Your body weight is quite high.You need to exercise regularly and eat healthy food.';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
