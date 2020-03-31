# Row Item

[![Package](https://img.shields.io/pub/v/row_item.svg?style=for-the-badge)](https://pub.dartlang.org/packages/row_item)
[![Build](https://img.shields.io/github/workflow/status/jesusrp98/row_item/Flutter%20Package%20CI?style=for-the-badge)](https://github.com/jesusrp98/row_item/actions)
[![Patreon](https://img.shields.io/badge/Support-Patreon-orange.svg?style=for-the-badge)](https://www.patreon.com/jesusrp98)
[![License](https://img.shields.io/github/license/jesusrp98/row_item.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0.en.html)

This package allows developers to display compat information inside a row widget.

<p align="center">
  <img src="https://raw.githubusercontent.com/jesusrp98/row_item/master/screenshots/0.png" width="415" hspace="8">
    <img src="https://raw.githubusercontent.com/jesusrp98/row_item/master/screenshots/1.png" width="415" hspace="8">
</p>

As a highly customizable widget, you can place as a title and description whatever you want. But the preferred way to use this package is using a `Text` widget as the 'title', and another `Text` or `Icon` widget as the 'description' portion of the view.

You can check the of these examples down below.

## Example

If you want to take a deeper look at the example, take a look at the [example](https://github.com/jesusrp98/row_item/tree/master/example) folder provided with the project.

### RowItem

This is the vanilla widget. You can place whatever widget you want inside both `title`and `description`parameters.

```
RowItem(
    title: Text('title'),
    description: Text('description'),
)
```

### RowItem.tex

The text variant simplifies the action of display text information inside the widget. It also has styles for both title and description text labels.

```
RowItem.text(
  'title',
  'description',
)
```

### RowItem.boolean

You can show a boolean state (`true`, `false` or `null`) using this variant of the widget. Color and size of the icon placed inside the description place are both customizable.

```
RowItem.boolean(
  'Displays a checked icon',
  true,
)
```

### RowItem.tap

This last variant makes the `description` text clickable, using the `onTap` parameter. If this parameters is not `null`, the description text will be underlined.

```
RowItem.tap(
  'This item is clickable',
  'Tap me!',
  onTap: () => print("Hello world!"),
)
```

## Getting Started

This project is a starting point for a Dart [package](https://flutter.io/developing-packages/), a library module containing code that can be shared easily across multiple Flutter or Dart projects.

For help getting started with Flutter, view our [online documentation](https://flutter.io/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Built with

- [Flutter](https://flutter.dev/) - Beautiful native apps in record time.
- [Android Studio](https://developer.android.com/studio/index.html/) - Tools for building apps on every type of Android device.
- [Visual Studio Code](https://code.visualstudio.com/) - Code editing. Redefined.

## Authors

- **Jesús Rodríguez** - you can find me on [GitHub](https://github.com/jesusrp98), [Twitter](https://twitter.com/jesusrp98) & [Reddit](https://www.reddit.com/user/jesusrp98).

## License

This project is licensed under the GNU GPL v3 License - see the [LICENSE.md](LICENSE.md) file for details.
