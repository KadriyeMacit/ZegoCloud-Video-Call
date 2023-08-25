import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:crypto/crypto.dart';

class CallModel {
  static int appID = 0; //from ZegoCloud
  static String appSign = ""; //from ZegoCloud

  static Future<String> getUniqueUserId() async {
    String? deviceId;
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.id; // unique ID on Android
    }

    if (deviceId != null && deviceId.length < 4) {
      if (Platform.isAndroid) {
        deviceId += '_android';
      } else if (Platform.isIOS) {
        deviceId += '_ios___';
      }
    }
    if (Platform.isAndroid) {
      deviceId ??= 'flutter_user_id_android';
    } else if (Platform.isIOS) {
      deviceId ??= 'flutter_user_id_ios';
    }

    final userId = md5
        .convert(utf8.encode(deviceId!))
        .toString()
        .replaceAll(RegExp(r'[^0-9]'), '');
    return userId.substring(userId.length - 6);
  }
}
