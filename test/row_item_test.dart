import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:row_item/row_item.dart';

void main() {
  Widget makeWidgetTestable(Widget child) =>
      MaterialApp(home: Scaffold(body: child));

  testWidgets('RowItem displays correct text', (tester) async {
    await tester.pumpWidget(
      makeWidgetTestable(
        RowItem(
          title: Text('title'),
          description: Text('description'),
        ),
      ),
    );

    expect(find.text('title'), findsOneWidget);
    expect(find.text('description'), findsOneWidget);
  });

  testWidgets('RowItem.text displays correct text', (tester) async {
    await tester.pumpWidget(
      makeWidgetTestable(
        RowItem.text(
          'title',
          'description',
        ),
      ),
    );

    expect(find.text('title'), findsOneWidget);
    expect(find.text('description'), findsOneWidget);
  });

  testWidgets('RowItem.boolean displays correct text & icon', (tester) async {
    await tester.pumpWidget(
      makeWidgetTestable(
        RowItem.boolean(
          'true',
          true,
        ),
      ),
    );

    expect(find.text('true'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);

    await tester.pumpWidget(
      makeWidgetTestable(
        RowItem.boolean(
          'false',
          false,
        ),
      ),
    );

    expect(find.text('false'), findsOneWidget);
    expect(find.byIcon(Icons.cancel), findsOneWidget);

    await tester.pumpWidget(
      makeWidgetTestable(
        RowItem.boolean(
          'null',
          null,
        ),
      ),
    );

    expect(find.text('null'), findsOneWidget);
    expect(find.byIcon(Icons.help), findsOneWidget);
  });

  testWidgets(
    'RowItem.tap displays correct text & dialog',
    (tester) async {
      bool pressed1 = false, pressed2 = false;

      await tester.pumpWidget(
        makeWidgetTestable(
          RowItem.tap(
            'title1',
            'description1',
            onTap: () => pressed1 = true,
          ),
        ),
      );

      expect(find.text('title1'), findsOneWidget);
      expect(find.text('description1'), findsOneWidget);
      await tester.tap(find.text('description1'));
      expect(pressed1, isTrue);

      await tester.pumpWidget(
        makeWidgetTestable(
          RowItem.tap(
            'title2',
            'description2',
          ),
        ),
      );

      expect(find.text('title2'), findsOneWidget);
      expect(find.text('description2'), findsOneWidget);
      await tester.tap(find.text('description2'));
      expect(pressed2, isFalse);
    },
  );
}
