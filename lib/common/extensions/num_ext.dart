import 'package:esewa_hci/common/ui/screen_util.dart';

extension NumExtension on num {
  num get w => ScreenUtil().setWidth(this);
  num get h => ScreenUtil().setHeight(this);
  num get sp => ScreenUtil().setSp(this);
}
