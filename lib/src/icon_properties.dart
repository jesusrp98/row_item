import 'package:flutter/material.dart';

/// Enum variable that is used for determinate icon style inside
/// a [RowItem.boolean] widget.
enum IconBooleanStyle { filled, outlined }

/// Defines icon properties, used mostly inside a [RowItem.boolean] widget.
/// These properties are [Color] and [IconData].
///
/// There's also a named constructor, which builds an instance
/// based on a boolean parameter.
class IconProperties {
  final Color color;
  final IconData icon;

  const IconProperties(this.icon, this.color);

  factory IconProperties.fromBoolean({
    required IconBooleanStyle style,
    bool? value,
  }) =>
      props[style]![value]!;

  static const _validColor = Colors.green;
  static const _invalidColor = Colors.red;
  static const _unknownColor = Colors.blueGrey;

  static Map<IconBooleanStyle, Map<bool?, IconProperties>> props = {
    IconBooleanStyle.filled: {
      true: const IconProperties(Icons.check_circle, _validColor),
      false: const IconProperties(Icons.cancel, _invalidColor),
      null: const IconProperties(Icons.help, _unknownColor),
    },
    IconBooleanStyle.outlined: {
      true: const IconProperties(Icons.check_circle_outline, _validColor),
      false: const IconProperties(Icons.highlight_off, _invalidColor),
      null: const IconProperties(Icons.help_outline, _unknownColor),
    },
  };
}
