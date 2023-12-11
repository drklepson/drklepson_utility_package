import 'dart:async';

import 'package:flutter/material.dart';

/// Non-categorized context extensions
extension ContextGeneral on BuildContext {
  /// For get theme
  ThemeData get theme => Theme.of(this);

  /// For get MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// For get brightness
  Brightness get brightness => theme.brightness;

  /// For get colorScheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// For get textTheme
  TextTheme get textTheme => theme.textTheme;

  /// For get primaryColor
  Color get primaryColor => theme.colorScheme.primary;

  /// For get primaryContainerColor
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;

  /// Get context width of screen
  double get width => MediaQuery.of(this).size.width;

  /// Get context height
  double get height => MediaQuery.of(this).size.height;

  // ignore: deprecated_member_use
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}

/// Navigation extensions on Context
extension ContextNavigator on BuildContext {
  /// The arguments passed to this route.
  Object? get routeArguments => ModalRoute.of(this)?.settings.arguments;

  /// Navigation pop
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);

  /// Navigation push with name
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  /// Navigation push replacement with name
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      Navigator.of(this).pushReplacementNamed(
        routeName,
        arguments: arguments,
        result: result,
      );

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName, {
    bool Function(Route<dynamic>)? predicate,
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        newRouteName,
        predicate ?? (p0) => false,
        arguments: arguments,
      );

  Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String newRouteName, {
    bool Function(Route<dynamic>)? predicate,
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        newRouteName,
        (route) => false,
        arguments: arguments,
      );
}



// // extension ContextLoading on BuildContext {
// //   Future<T?> loading<T>(
// //     Future<T> action, {
// //     Widget Function(BuildContext)? builder,
// //   }) async {
// //     late BuildContext dialogContext;

// //     unawaited(
// //       showDialog<void>(
// //         context: this,
// //         barrierDismissible: false,
// //         builder: builder ??= (context) {
// //           dialogContext = context;
// //           return WillPopScope(
// //             onWillPop: () async => false,
// //             child: Stack(
// //               clipBehavior: Clip.antiAlias,
// //               alignment: Alignment.center,
// //               children: [
// //                 Container(
// //                   padding: const EdgeInsets.all(10),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white38,
// //                     borderRadius: BorderRadius.circular(5),
// //                   ),
// //                   child: SizedBox(
// //                     width: 30,
// //                     height: 30,
// //                     child: CircularProgressIndicator(
// //                       color: Theme.of(context).primaryColor,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //     final result = await action.whenComplete(() => dialogContext.pop());
// //     return result;
// //   }
// // }
