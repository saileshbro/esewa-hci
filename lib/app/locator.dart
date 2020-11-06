import 'package:esewa_hci/app/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt locator = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
)
Future<void> setupLocator() => $initGetIt(locator);
