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

  static Future<bool> isTablet() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.displayMetrics.widthPx > 600 &&
          !androidInfo.systemFeatures
              .contains('android.software.leanback_only');
    } else if (Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.model.contains('iPad');
    }
    return false;
  }

  static Future<bool> isMobile() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.displayMetrics.widthPx <= 600 &&
          !androidInfo.systemFeatures
              .contains('android.software.leanback_only');
    } else if (Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.model.contains('ios');
    }
    return false;
  }
}
