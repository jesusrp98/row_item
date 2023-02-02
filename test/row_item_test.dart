// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:row_item/row_item.dart';

class TestPage extends StatelessWidget {
  final Widget test;

  const TestPage(this.test, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('AppBar'),
          ),
          body: test,
        ),
      ),
    );
  }
}

void main() {
  group('RowItem', () {
    testWidgets('RowItem displays custom widgets correctly', (tester) async {
      await tester.pumpWidget(
        const TestPage(
          RowItem(
            title: Text('title'),
            description: Text('description'),
          ),
        ),
      );

      expect(find.text('title'), findsOneWidget);
      expect(find.text('description'), findsOneWidget);
    });
  });

  group('RowItem.text', () {
    testWidgets('RowItem.text displays correct text', (tester) async {
      await tester.pumpWidget(
        TestPage(
          RowItem.text('title', 'description'),
        ),
      );

      expect(find.text('title'), findsOneWidget);
      expect(find.text('description'), findsOneWidget);

      final title = tester.widget<Text>(find.text('title'));
      final description = tester.widget<Text>(find.text('description'));

      expect(title.textAlign, TextAlign.start);
      expect(title.overflow, TextOverflow.ellipsis);

      expect(description.textAlign, TextAlign.end);
      expect(description.overflow, TextOverflow.ellipsis);
    });

    testWidgets(
      'RowItem.text pulls default settings correctly',
      (tester) async {
        await tester.pumpWidget(
          TestPage(
            RowItem.text('title', 'description'),
          ),
        );

        final titleStyle = tester.widget<DefaultTextStyle>(
          find
              .ancestor(
                of: find.text('title'),
                matching: find.byType(DefaultTextStyle),
              )
              .first,
        );
        final descriptionStyle = tester.widget<DefaultTextStyle>(
          find
              .ancestor(
                of: find.text('description'),
                matching: find.byType(DefaultTextStyle),
              )
              .first,
        );

        expect(titleStyle.style.fontSize, 14);
        expect(titleStyle.style.fontWeight, FontWeight.w400);

        expect(descriptionStyle.style.fontSize, 14);
        expect(descriptionStyle.style.fontWeight, FontWeight.w400);
      },
    );

    testWidgets(
      'RowItem.text applies custom settings correctly',
      (tester) async {
        await tester.pumpWidget(
          TestPage(
            RowItem.text(
              'title',
              'description',
              maxLines: 2,
              textOverflow: TextOverflow.fade,
              titleStyle: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
              descriptionStyle: const TextStyle(
                fontSize: 19,
                color: Colors.blue,
              ),
            ),
          ),
        );

        final title = tester.widget<Text>(find.text('title'));
        final description = tester.widget<Text>(find.text('description'));

        expect(title.style!.fontSize, 20);
        expect(title.style!.color, Colors.red);
        expect(title.overflow, TextOverflow.fade);
        expect(title.maxLines, 2);

        expect(description.style!.fontSize, 19);
        expect(description.style!.color, Colors.blue);
        expect(description.overflow, TextOverflow.fade);
        expect(description.maxLines, 2);
      },
    );
  });
  group('RowItem.description', () {
    testWidgets('RowItem.boolean displays correct text & icon', (tester) async {
      await tester.pumpWidget(
        TestPage(
          RowItem.boolean(
            'true',
            true,
            iconStyle: IconBooleanStyle.filled,
          ),
        ),
      );

      expect(find.text('true'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.pumpWidget(
        TestPage(
          RowItem.boolean(
            'false',
            false,
            iconStyle: IconBooleanStyle.filled,
          ),
        ),
      );

      expect(find.text('false'), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsOneWidget);

      await tester.pumpWidget(
        TestPage(
          RowItem.boolean(
            'null',
            null,
            iconStyle: IconBooleanStyle.filled,
          ),
        ),
      );

      expect(find.text('null'), findsOneWidget);
      expect(find.byIcon(Icons.help), findsOneWidget);
    });

    testWidgets(
      'RowItem.boolean displays correct text & outlined icon',
      (tester) async {
        await tester.pumpWidget(
          TestPage(
            RowItem.boolean('true', true),
          ),
        );

        expect(find.text('true'), findsOneWidget);
        expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);

        await tester.pumpWidget(
          TestPage(
            RowItem.boolean('false', false),
          ),
        );

        expect(find.text('false'), findsOneWidget);
        expect(find.byIcon(Icons.highlight_off), findsOneWidget);

        await tester.pumpWidget(
          TestPage(
            RowItem.boolean('null', null),
          ),
        );

        expect(find.text('null'), findsOneWidget);
        expect(find.byIcon(Icons.help_outline), findsOneWidget);
      },
    );

    testWidgets('RowItem.boolean pulls default settings', (tester) async {
      await tester.pumpWidget(
        TestPage(
          RowItem.boolean('true', true),
        ),
      );

      var titleStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('true'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );
      var icon = tester.widget<Icon>(find.byIcon(Icons.check_circle_outline));

      expect(titleStyle.style.fontSize, 14);
      expect(titleStyle.style.fontWeight, FontWeight.w400);

      expect(icon.size, 18);
      expect(icon.color, Colors.green);

      await tester.pumpWidget(
        TestPage(
          RowItem.boolean('false', false),
        ),
      );

      titleStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('false'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );
      icon = tester.widget<Icon>(find.byIcon(Icons.highlight_off));

      expect(titleStyle.style.fontSize, 14);
      expect(titleStyle.style.fontWeight, FontWeight.w400);

      expect(icon.size, 18);
      expect(icon.color, Colors.red);

      await tester.pumpWidget(
        TestPage(
          RowItem.boolean('null', null),
        ),
      );

      titleStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('null'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );
      icon = tester.widget<Icon>(find.byIcon(Icons.help_outline));

      expect(titleStyle.style.fontSize, 14);
      expect(titleStyle.style.fontWeight, FontWeight.w400);

      expect(icon.size, 18);
      expect(icon.color, Colors.blueGrey);
    });

    testWidgets('RowItem.boolean applies custom settings', (tester) async {
      await tester.pumpWidget(
        TestPage(
          RowItem.boolean(
            'true',
            true,
            maxLines: 2,
            textOverflow: TextOverflow.fade,
            titleStyle: const TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
            iconColor: Colors.blue,
            iconSize: 24,
          ),
        ),
      );

      var title = tester.widget<Text>(find.text('true'));
      var icon = tester.widget<Icon>(find.byIcon(Icons.check_circle_outline));

      expect(title.style!.fontSize, 20);
      expect(title.style!.color, Colors.red);
      expect(title.overflow, TextOverflow.fade);
      expect(title.maxLines, 2);

      expect(icon.size, 24);
      expect(icon.color, Colors.blue);

      await tester.pumpWidget(
        TestPage(
          RowItem.boolean(
            'false',
            false,
            maxLines: 2,
            textOverflow: TextOverflow.fade,
            titleStyle: const TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
            iconColor: Colors.blue,
            iconSize: 24,
          ),
        ),
      );

      title = tester.widget<Text>(find.text('false'));
      icon = tester.widget<Icon>(find.byIcon(Icons.highlight_off));

      expect(title.style!.fontSize, 20);
      expect(title.style!.color, Colors.red);
      expect(title.overflow, TextOverflow.fade);
      expect(title.maxLines, 2);

      expect(icon.size, 24);
      expect(icon.color, Colors.blue);

      await tester.pumpWidget(
        TestPage(
          RowItem.boolean(
            'null',
            null,
            maxLines: 2,
            textOverflow: TextOverflow.fade,
            titleStyle: const TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
            iconColor: Colors.blue,
            iconSize: 24,
          ),
        ),
      );

      title = tester.widget<Text>(find.text('null'));
      icon = tester.widget<Icon>(find.byIcon(Icons.help_outline));

      expect(title.style!.fontSize, 20);
      expect(title.style!.color, Colors.red);
      expect(title.overflow, TextOverflow.fade);
      expect(title.maxLines, 2);

      expect(icon.size, 24);
      expect(icon.color, Colors.blue);
    });
  });

  group('RowItem.tap', () {
    testWidgets(
      'RowItem.tap displays text correctly',
      (tester) async {
        await tester.pumpWidget(
          TestPage(
            RowItem.tap(
              'title1',
              'description1',
              onTap: () => print('hello'),
            ),
          ),
        );

        expect(find.text('title1'), findsOneWidget);
        expect(find.text('description1'), findsOneWidget);

        await tester.pumpWidget(
          TestPage(
            RowItem.tap(
              'title2',
              'description2',
            ),
          ),
        );

        expect(find.text('title2'), findsOneWidget);
        expect(find.text('description2'), findsOneWidget);
      },
    );

    testWidgets('RowItem.tap pulls default settings', (tester) async {
      await tester.pumpWidget(
        TestPage(
          RowItem.tap(
            'title1',
            'description1',
            onTap: () => print('hello'),
          ),
        ),
      );

      var titleStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('title1'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );
      var descriptionStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('description1'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );

      expect(titleStyle.style.fontSize, 14);
      expect(titleStyle.style.fontWeight, FontWeight.w400);

      expect(descriptionStyle.style.fontSize, 14);
      expect(descriptionStyle.style.fontWeight, FontWeight.w400);
      expect(descriptionStyle.style.decoration, TextDecoration.underline);

      await tester.pumpWidget(
        TestPage(
          RowItem.tap(
            'title2',
            'description2',
          ),
        ),
      );

      titleStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('title2'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );

      descriptionStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('description2'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );

      expect(titleStyle.style.fontSize, 14);
      expect(titleStyle.style.fontWeight, FontWeight.w400);

      expect(descriptionStyle.style.fontSize, 14);
      expect(descriptionStyle.style.fontWeight, FontWeight.w400);
      expect(descriptionStyle.style.decoration, TextDecoration.none);
    });

    testWidgets('RowItem.tap applies custom settings', (tester) async {
      await tester.pumpWidget(
        TestPage(
          RowItem.tap(
            'title1',
            'description1',
            maxLines: 2,
            textOverflow: TextOverflow.fade,
            titleStyle: const TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
            descriptionStyle: const TextStyle(
              fontSize: 19,
              color: Colors.blue,
            ),
            onTap: () => print('hello'),
          ),
        ),
      );

      var title = tester.widget<Text>(find.text('title1'));
      var description = tester.widget<Text>(find.text('description1'));
      var descriptionStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('description1'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );

      expect(title.style!.fontSize, 20);
      expect(title.style!.color, Colors.red);
      expect(title.overflow, TextOverflow.fade);
      expect(title.maxLines, 2);

      expect(description.style!.fontSize, 19);
      expect(description.style!.color, Colors.blue);
      expect(description.overflow, TextOverflow.fade);
      expect(description.maxLines, 2);
      expect(descriptionStyle.style.decoration, TextDecoration.underline);

      await tester.pumpWidget(
        TestPage(
          RowItem.tap(
            'title2',
            'description2',
            maxLines: 2,
            textOverflow: TextOverflow.fade,
            titleStyle: const TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
            descriptionStyle: const TextStyle(
              fontSize: 19,
              color: Colors.blue,
            ),
          ),
        ),
      );

      title = tester.widget<Text>(find.text('title2'));
      description = tester.widget<Text>(find.text('description2'));
      descriptionStyle = tester.widget<DefaultTextStyle>(
        find
            .ancestor(
              of: find.text('description2'),
              matching: find.byType(DefaultTextStyle),
            )
            .first,
      );

      expect(title.style!.fontSize, 20);
      expect(title.style!.color, Colors.red);
      expect(title.overflow, TextOverflow.fade);
      expect(title.maxLines, 2);

      expect(description.style!.fontSize, 19);
      expect(description.style!.color, Colors.blue);
      expect(description.overflow, TextOverflow.fade);
      expect(description.maxLines, 2);
      expect(descriptionStyle.style.decoration, TextDecoration.none);
    });

    testWidgets('Checks RowItem.tap "onTap" works correctly', (tester) async {
      var pressed1 = false;
      const pressed2 = false;

      await tester.pumpWidget(
        TestPage(
          RowItem.tap(
            'title1',
            'description1',
            onTap: () => pressed1 = true,
          ),
        ),
      );

      await tester.tap(find.text('description1'));
      expect(pressed1, isTrue);

      await tester.pumpWidget(
        TestPage(
          RowItem.tap(
            'title2',
            'description2',
          ),
        ),
      );

      await tester.tap(find.text('description2'));
      expect(pressed2, isFalse);
    });
  });
}
