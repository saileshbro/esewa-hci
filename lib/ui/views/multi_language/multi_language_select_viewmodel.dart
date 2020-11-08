import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/helpers/show_custom_toast.dart';
import 'package:esewa_hci/models/language_model.dart';
import 'package:esewa_hci/ui/blocs/language_bloc/language_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:oktoast/oktoast.dart';

@lazySingleton
class MultiLanguageSelectViewModel extends CustomBaseViewModel {
  String _languageCode;
  init(String currentLanguageCode) {
    _languageCode = currentLanguageCode;
    notifyListeners();
  }

  get languageCode => _languageCode;
  void toggleLanguageCode(value) {
    bool isSupported = Constants.languages.map((e) => e.code).contains(value);
    if (isSupported) {
      _languageCode = value;
      locator<LanguageBloc>()
          .add(ToggleLanguageEvent(LanguageModel(code: value)));
    } else {
      showCustomToast(
          message:
              "Currently only English and Nepali languages are included.\nहाल केवल अंग्रेजी र नेपाली भाषाहरू मात्र समावेश छन्।");
    }
  }
}
