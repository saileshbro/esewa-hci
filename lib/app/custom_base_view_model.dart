import 'package:stacked/stacked.dart';

class CustomBaseViewModel extends BaseViewModel {
  Future<void> delay({int miliseconds = 0, int seconds = 0}) async {
    setBusy(true);
    await Future.delayed(Duration(milliseconds: miliseconds, seconds: seconds));
    setBusy(false);
  }

  Future<void> dumbDelay({int miliseconds = 0, int seconds = 0}) async {
    await Future.delayed(Duration(milliseconds: miliseconds, seconds: seconds));
  }
}
