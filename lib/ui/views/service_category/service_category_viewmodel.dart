import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/models/service_category_model.dart';
import 'package:esewa_hci/ui/views/service_category/mock_popular_service_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class ServiceCategoryViewModel extends CustomBaseViewModel {
  List<Showcase> _services = [];
  List<Showcase> get services => _services;
  Future<void> init() async {
    setBusy(true);
    await getServices();
    setBusy(false);
  }

  Future<void> getServices() async {
    await dumbDelay(miliseconds: 1200);
    _services.addAll(popularServices);
  }
}
