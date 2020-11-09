import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/common/helpers/show_not_implemented_toast.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class HomeViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService;

  HomeViewModel(this._navigationService);
  void onSearchPressed() => showNotImplementedToast();
  void onNotificationPressed() => showNotImplementedToast();

  onCategoryPressed(String category) {
    _navigationService.navigateTo(Routes.serviceCategoryView,
        arguments: ServiceCategoryViewArguments(category: category));
  }

  void onMorePressed() {
    _navigationService.navigateTo(Routes.settingsView);
  }
}
