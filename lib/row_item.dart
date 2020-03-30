import 'package:flutter/material.dart';

/// Defines icon properties, used mostly inside a [RowItem.boolean] widget.
/// These properties are [Color] and [IconData].
///
/// There's also a named constructor, which builds an instance
/// based on a boolean parameter.
class _IconProperties {
  final Color color;
  final IconData icon;

  const _IconProperties({this.color, this.icon});

  factory _IconProperties.fromBoolean(bool value) => _props[value];

  static Map<bool, _IconProperties> _props = {
    true: _IconProperties(color: Colors.green, icon: Icons.check_circle),
    false: _IconProperties(color: Colors.red, icon: Icons.cancel),
    null: _IconProperties(color: Colors.blueGrey, icon: Icons.help),
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
    Key key,
    @required this.title,
    @required this.description,
  })  : assert(title != null),
        assert(description != null),
        super(key: key);

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
    Key key,
    TextStyle titleStyle,
    TextStyle descriptionStyle,
  }) {
    return RowItem(
      key: key,
      title: _buildText(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
      ),
      description: _buildText(
        description,
        style: descriptionStyle,
        textAlign: TextAlign.end,
      ),
    );
  }

  /// Builds a 'text-to-boolean' widget. Useful when the associated
  /// value with a boolean value, which can be represented with an icon.
  factory RowItem.boolean(
    String title,
    bool icon, {
    Key key,
    TextStyle titleStyle,
    Color iconColor,
    double iconSize = 17,
  }) {
    return RowItem(
      key: key,
      title: _buildText(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
      ),
      description: _buildIcon(
        icon,
        iconColor: iconColor,
        iconSize: iconSize,
      ),
    );
  }

  /// Builds a 'text-to-text' widget. It allows the associated value,
  /// in this case a [Text] widget, to be clickable by the user.
  factory RowItem.tap(
    String title,
    String description, {
    Key key,
    TextStyle titleStyle,
    TextStyle descriptionStyle,
    VoidCallback onTap,
  }) {
    return RowItem(
      key: key,
      title: _buildText(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
      ),
      description: InkResponse(
        onTap: onTap,
        child: _buildText(
          description,
          style: descriptionStyle,
          textAlign: TextAlign.end,
          clickable: onTap != null,
        ),
      ),
    );
  }

  /// Returns an icon based on the [value] variable.
  /// Various [Icon] parameters can be set as well.
  static Icon _buildIcon(bool value, {Color iconColor, double iconSize}) {
    final _IconProperties data = _IconProperties.fromBoolean(value);
    return Icon(
      data.icon,
      color: iconColor ?? data.color,
      size: iconSize,
    );
  }

  /// Returns a [Text] widget, using the [text] variable.
  /// It checks if can be clickable, with the [clickable] parameter.
  /// Various of its paremeters can be set.
  static Text _buildText(
    String text, {
    TextStyle style,
    bool clickable = false,
    @required TextAlign textAlign,
  }) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
        decoration: clickable ? TextDecoration.underline : TextDecoration.none,
      ).merge(style),
    );
  }
}
