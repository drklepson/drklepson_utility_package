import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.title,
    super.key,
    this.content,
    this.actions,
  });

  final String title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: CustomInsets.h16v12,
      actionsPadding: CustomInsets.h16v12,
      title: SizedBox(
        width: context.width * 0.8,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: CustomInsets.h16v12,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colorScheme.background,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(child: content),
      actions: actions,
    );
  }
}
