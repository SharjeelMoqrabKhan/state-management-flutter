import 'package:flutter/cupertino.dart';

//step1 to extends a mdoel with changeNotifier
class TimerInfo extends ChangeNotifier {
  int _remainingTime = 60;
  int get remainingTime => _remainingTime;
  updateReamingTime() {
    if (_remainingTime > 0) {
      _remainingTime--;
    }
    //update a value we notify
    notifyListeners();
  }
}
