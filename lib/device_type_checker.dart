library device_type_checker;

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceType {
  static Future<bool> isAndroidTV() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.systemFeatures
          .contains('android.software.leanback_only');
    }
    return false;
  }

  static final isTablet = false;
  static final isMobile = false;
}
