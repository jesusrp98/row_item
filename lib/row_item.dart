import 'package:flutter/material.dart';

/// Enum variable that is used for determinate icon style inside
/// a [RowItem.boolean] widget.
enum IconBooleanStyle { filled, outlined }

/// Defines icon properties, used mostly inside a [RowItem.boolean] widget.
/// These properties are [Color] and [IconData].
///
/// There's also a named constructor, which builds an instance
/// based on a boolean parameter.
class _IconProperties {
  final Color color;
  final IconData icon;

  const _IconProperties(this.icon, this.color);

  factory _IconProperties.fromBoolean(bool? value, {IconBooleanStyle? style}) =>
      props[style!]![value]!;

  static Color validColor = Colors.green;
  static Color invalidColor = Colors.red;
  static Color unknownColor = Colors.blueGrey;

  static Map<IconBooleanStyle, Map<bool?, _IconProperties>> props = {
    IconBooleanStyle.filled: {
      true: _IconProperties(Icons.check_circle, validColor),
      false: _IconProperties(Icons.cancel, invalidColor),
      null: _IconProperties(Icons.help, unknownColor),
    },
    IconBooleanStyle.outlined: {
      true: _IconProperties(Icons.check_circle_outline, Colors.green),
      false: _IconProperties(Icons.highlight_off, Colors.red),
      null: _IconProperties(Icons.help_outline, Colors.blueGrey),
    },
  };
}

/// This widget has been designed to represent a text, with its associated value.
/// The [title] widget will be located at the left of the [RowItem] widget,
/// and the [description] widget, at the right.
class RowItem extends StatelessWidget {
  /// Main text of the widget, located at the left.
  final Widget title;

  /// Associated value of the [title] parameter, localed at the right.
  final Widget description;

  const RowItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: title,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: description,
          ),
        ),
      ],
    );
  }

  /// Builds a 'text-to-text' widget. Useful when the associated
  /// value can be represented with a [Text] widget.
  factory RowItem.text(
    String title,
    String description, {
    Key? key,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextOverflow? textOverflow,
    int? maxLines,
  }) {
    return RowItem(
      key: key,
      title: _Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        maxLines: maxLines,
      ),
      description: _Text(
        description,
        style: descriptionStyle,
        textAlign: TextAlign.end,
        textOverflow: textOverflow,
        maxLines: maxLines,
        useDefaultDescriptionColor: true,
      ),
    );
  }

  /// Builds a 'text-to-boolean' widget. Useful when the associated
  /// value with a boolean value, which can be represented with an icon.
  /// You can select outlined icons using the [outline] parameter.
  factory RowItem.boolean(
    String title,
    bool? value, {
    Key? key,
    TextStyle? titleStyle,
    TextOverflow? textOverflow,
    int? maxLines,
    Color? iconColor,
    double iconSize = 18,
    IconBooleanStyle iconStyle = IconBooleanStyle.outlined,
  }) {
    return RowItem(
      key: key,
      title: _Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        maxLines: maxLines,
      ),
      description: _Icon(
        properties: _IconProperties.fromBoolean(
          value,
          style: iconStyle,
        ),
        color: iconColor,
        size: iconSize,
      ),
    );
  }

  /// Builds a 'text-to-text' widget. It allows the associated value,
  /// in this case a [Text] widget, to be clickable by the user.
  factory RowItem.tap(
    String title,
    String description, {
    Key? key,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextOverflow? textOverflow,
    int? maxLines,
    VoidCallback? onTap,
  }) {
    return RowItem(
      key: key,
      title: _Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        maxLines: maxLines,
      ),
      description: InkResponse(
        onTap: onTap,
        child: _Text(
          description,
          style: descriptionStyle,
          textAlign: TextAlign.end,
          textOverflow: textOverflow,
          maxLines: maxLines,
          clickable: onTap != null,
          useDefaultDescriptionColor: true,
        ),
      ),
    );
  }
}

/// Returns an icon based on the [value] variable.
/// Various [Icon] parameters can be set as well.
class _Icon extends StatelessWidget {
  final _IconProperties? properties;
  final Color? color;
  final double? size;

  const _Icon({
    Key? key,
    this.properties,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      properties!.icon,
      color: color ?? properties!.color,
      size: size,
    );
  }
}

/// Returns a [Text] widget, using the [text] variable.
/// It checks if can be clickable, with the [clickable] parameter.
/// Various of its paremeters can be set.
class _Text extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final bool clickable;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final bool useDefaultDescriptionColor;

  const _Text(
    this.data, {
    Key? key,
    this.style,
    this.clickable = false,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.useDefaultDescriptionColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: useDefaultDescriptionColor
                ? Theme.of(context).textTheme.caption!.color
                : null,
            decoration:
                clickable ? TextDecoration.underline : TextDecoration.none,
          ),
      child: Text(
        data,
        overflow: textOverflow ?? TextOverflow.ellipsis,
        maxLines: maxLines,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}
