import 'package:flutter/material.dart';

class SpacingColumn extends Column {
  SpacingColumn({
    super.key,
    super.mainAxisAlignment = MainAxisAlignment.start,
    super.mainAxisSize = MainAxisSize.max,
    super.crossAxisAlignment = CrossAxisAlignment.center,
    super.textDirection,
    super.verticalDirection = VerticalDirection.down,
    super.textBaseline,
    List<Widget> children = const <Widget>[],
    double spacing = 0,
  }) : super(
          children: children.indexed
              .map<List<Widget>>(
            (e) => e.$1 == children.length - 1
                ? [e.$2]
                : [
                    e.$2,
                    SizedBox(height: spacing),
                  ],
          )
              .fold(
            [],
            (previousValue, element) => [...previousValue, ...element],
          ),
        );
}

class SpacingRow extends Row {
  SpacingRow({
    super.key,
    super.mainAxisAlignment = MainAxisAlignment.start,
    super.mainAxisSize = MainAxisSize.max,
    super.crossAxisAlignment = CrossAxisAlignment.center,
    super.textDirection,
    super.verticalDirection = VerticalDirection.down,
    super.textBaseline,
    List<Widget> children = const <Widget>[],
    double spacing = 0,
  }) : super(
          children: children.indexed
              .map<List<Widget>>(
            (e) => e.$1 == children.length - 1
                ? [e.$2]
                : [
                    e.$2,
                    SizedBox(width: spacing),
                  ],
          )
              .fold(
            [],
            (previousValue, element) => [...previousValue, ...element],
          ),
        );
}
