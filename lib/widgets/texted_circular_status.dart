import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';

class CircularStatus extends StatelessWidget {
  const CircularStatus({
    required this.consumption,
    required this.goal,
    super.key,
    this.textColor,
    this.progressColor,
    this.progressBgColor,
  });

  final double consumption;
  final double goal;
  final Color? textColor;
  final Color? progressColor;
  final Color? progressBgColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Spacer(),
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${(354 / 1000 * 100).round()} %',
                              maxLines: 1,
                              style: context.textTheme.displayLarge.bold
                                  ?.copyWith(height: 1, color: textColor),
                            ),
                            Text(
                              '${consumption.toStringAsFixed(0)}'
                              ' / '
                              '${goal.toStringAsFixed(0)} ml',
                              maxLines: 1,
                              style: context.textTheme.headlineSmall
                                  ?.copyWith(height: 1, color: textColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                CircularProgressIndicator(
                  value: 354 / 1000,
                  strokeWidth: 16,
                  color: progressColor,
                  backgroundColor: progressBgColor ??
                      context.colorScheme.primary.withOpacity(.2),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
