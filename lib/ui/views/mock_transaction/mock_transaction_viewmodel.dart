import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class MockTransactionViewModel extends CustomBaseViewModel {
  MockTransactionViewModel();
  bool _hasCancelled = false;
  void onPayPressed() {}

  void cancelled() {
    _hasCancelled = true;
  }

  bool showCompletion() {
    return !_hasCancelled;
  }
}
