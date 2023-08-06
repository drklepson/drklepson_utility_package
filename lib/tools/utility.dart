import 'package:drklepson_utility_package/widgets/circuler_prog_ind.dart';
import 'package:flutter/material.dart';

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
}
