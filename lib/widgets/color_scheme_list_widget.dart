import 'package:flutter/material.dart';

class ColorSchemeList extends StatelessWidget {
  const ColorSchemeList({
    required this.colorScheme,
    super.key,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: {
          colorScheme.background: 'background',
          colorScheme.error: 'error',
          colorScheme.errorContainer: 'errorContainer',
          colorScheme.inversePrimary: 'inversePrimary',
          colorScheme.inverseSurface: 'inverseSurface',
          colorScheme.onBackground: 'onBackground',
          colorScheme.onError: 'onError',
          colorScheme.onErrorContainer: 'onErrorContainer',
          colorScheme.onInverseSurface: 'onInverseSurface',
          colorScheme.onPrimary: 'onPrimary',
          colorScheme.onPrimaryContainer: 'onPrimaryContainer',
          colorScheme.onSecondary: 'onSecondary',
          colorScheme.onSecondaryContainer: 'onSecondaryContainer',
          colorScheme.onSurface: 'onSurface',
          colorScheme.onSurfaceVariant: 'onSurfaceVariant',
          colorScheme.onTertiary: 'onTertiary',
          colorScheme.onTertiaryContainer: 'onTertiaryContainer',
          colorScheme.outline: 'outline',
          colorScheme.outlineVariant: 'outlineVariant',
          colorScheme.primary: 'primary',
          colorScheme.primaryContainer: 'primaryContainer',
          colorScheme.scrim: 'scrim',
          colorScheme.secondary: 'secondary',
          colorScheme.secondaryContainer: 'secondaryContainer',
          colorScheme.surface: 'surface',
          colorScheme.surfaceVariant: 'surfaceVariant',
          colorScheme.tertiary: 'tertiary',
          colorScheme.tertiaryContainer: 'tertiaryContainer',
          colorScheme.shadow: 'shadow',
          colorScheme.surfaceTint: 'surfaceTint',
        }
            .map<String, Widget>(
              (color, text) => MapEntry(
                text,
                Column(
                  children: [
                    Container(
                      color: color,
                      height: 50,
                      width: 100,
                    ),
                    Text('${color.toString().substring(10, 16)} ($text)'),
                  ],
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
