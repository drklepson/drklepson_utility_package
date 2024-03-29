import 'package:drklepson_utility_package/widgets/circuler_prog_ind.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class Utility {
  static Widget futureBuilderWidget<T>(
    BuildContext context,
    AsyncSnapshot<T> snapshot,
    Widget Function(BuildContext context, T data) function,
  ) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return const Center(child: CustomCircularIndicator());
      case ConnectionState.active:
      case ConnectionState.done:
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        final data = snapshot.data;

        if (data != null) return function(context, data);

        return const Center(child: CustomCircularIndicator());
    }
  }

  /// This function is set to allowed orientations
  /// [landscapeRight], [landscapeLeft], [portraitUp], [portraitDown],
  /// [landscape] and [portrait] are set to true by default
  /// If you want to set only one orientation, set the others to false
  /// Example:
  /// ```dart
  /// setAllowOrientations(
  ///   landscapeRight: true,
  ///   landscapeLeft: false,
  ///   portraitUp: false,
  ///   portraitDown: false,
  ///   landscape: false,
  ///   portrait: false
  /// );
  /// ```
  /// This will set only landscapeRight orientation
  /// if [landscape] or [portrait] are set to true, the others will be ignored
  /// Example:
  /// ```dart
  /// setAllowOrientations(
  ///   landscapeRight: false,
  ///   landscapeLeft: false,
  ///   portraitUp: false,
  ///   portraitDown: false,
  ///   landscape: true,
  ///   portrait: false
  /// );
  /// ```
  /// This will set only landscape orientations (landscapeRight and landscapeLeft)
  static Future<void> setAllowOrientations({
    bool landscapeRight = true,
    bool landscapeLeft = true,
    bool portraitUp = true,
    bool portraitDown = true,
    bool landscape = true,
    bool portrait = true,
    bool unlock = false,
  }) {
    return SystemChrome.setPreferredOrientations([
      if (landscapeRight || landscape || unlock)
        DeviceOrientation.landscapeRight,
      if (landscapeLeft || landscape || unlock) DeviceOrientation.landscapeLeft,
      if (portraitUp || portrait || unlock) DeviceOrientation.portraitUp,
      if (portraitDown || portrait || unlock) DeviceOrientation.portraitDown,
    ]);
  }

  /// This function is for get platform version
  /// Example:
  /// ```dart
  /// getPlatformVersion().then((value) => print(value));
  /// ```
  static Future<String> getPlatformVersion() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      return 'Android-$sdkInt';
    }

    if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      final systemName = iosInfo.systemName;
      final version = iosInfo.systemVersion;
      return '$systemName-$version';
    }

    return 'unknow';
  }
}
