import 'dart:math';

import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';

class IndicatorPageView extends StatelessWidget {
  const IndicatorPageView({
    required this.itemBuilder,
    required this.itemCount,
    required this.height,
    super.key,
    this.indicatorPadding = const EdgeInsets.symmetric(vertical: 8),
    required this.textScaleFactor,
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double height;
  final EdgeInsets indicatorPadding;
  final double textScaleFactor;

  double get tsf => textScaleFactor;

  @override
  Widget build(BuildContext context) {
    final activePage = ValueNotifier<double>(15);
    final controller = PageController();
    controller.addListener(() {
      activePage.value = controller.page ?? 0;
    });
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: itemCount,
              itemBuilder: itemBuilder,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: List.generate(itemCount, (index) {
              return ValueListenableBuilder(
                valueListenable: activePage,
                builder: (context, value, child) {
                  final deger = 1.00 - min((index - value).abs(), 1);
                  return AnimatedContainer(
                    height: 8 * tsf,
                    width: (8 + 16 * deger) * tsf,
                    duration: CustomDuration.low,
                    decoration: BoxDecoration(
                      color: context.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
