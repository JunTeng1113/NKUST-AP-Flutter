import 'dart:async';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:package_info/package_info.dart';

class FA {
  static FirebaseAnalytics analytics;

  static Future<void> setCurrentScreen(
      String screenName, String screenClassOverride) async {
    await analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenClassOverride,
    );
  }

  static Future<void> setUserProperty(String name, String value) async {
    await analytics.setUserProperty(
      name: name,
      value: value,
    );
    print('setUserProperty succeeded');
  }

  static Future<void> logApiEvent(String type, int status) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    await analytics.logEvent(
      name: 'ap-api',
      parameters: <String, dynamic>{
        'type': type,
        'status': status,
        'version': packageInfo.version,
        'platform': Platform.operatingSystem,
      },
    );
    print('logEvent succeeded');
  }
}
