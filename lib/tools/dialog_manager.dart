import 'dart:async';

import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';

class DialogManager {
  factory DialogManager() {
    assert(_instance != null, 'DialogManager must be initialized');
    return _instance!;
  }

  DialogManager._({GlobalKey<NavigatorState>? navigatorKey})
      : _navigatorKey = navigatorKey;

  GlobalKey<NavigatorState>? _navigatorKey;
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;
  static DialogManager? _instance;

  static void init(GlobalKey<NavigatorState> navigatorKey) {
    _instance ??= DialogManager._(navigatorKey: navigatorKey);
  }

  static Future<T?> show<T>({
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) async {
    final navKey = DialogManager().navigatorKey;
    assert(navKey != null, 'Navigator key must not be null');

    return showDialog<T>(
      context: navKey!.currentContext!,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior,
    );
  }

  static Future<T?> futureLoading<T>(
    Future<T> action, {
    Widget Function(BuildContext)? builder,
  }) async {
    late BuildContext dialogContext;

    unawaited(
      show<void>(
        barrierDismissible: false,
        builder: builder ??= (context) {
          dialogContext = context;
          return WillPopScope(
            onWillPop: () async => false,
            child: Stack(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const CustomCircularIndicator(),
                ),
              ],
            ),
          );
        },
      ),
    );
    final result = await action.whenComplete(dialogContext.pop);
    return result;
  }
}
