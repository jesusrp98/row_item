import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:row_item/row_item.dart';

class TestPage extends StatelessWidget {
  final Widget test;

  const TestPage(this.test);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('AppBar'),
          ),
          body: test,
        ),
      ),
    );
  }
}

void main() {
  testWidgets('RowItem displays custom widgets correctly', (tester) async {
    await tester.pumpWidget(
      TestPage(
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
      TestPage(
        RowItem.text('title', 'description'),
      ),
    );

    expect(find.text('title'), findsOneWidget);
    expect(find.text('description'), findsOneWidget);

    final title = tester.widget<Text>(find.text('title'));
    final description = tester.widget<Text>(find.text('description'));

    expect(title.textAlign, TextAlign.start);
    expect(description.textAlign, TextAlign.end);
  });

  testWidgets(
    'RowItem.text pulls default settings correctly',
    (tester) async {},
  );

  testWidgets(
    'RowItem.text applies custom settings correctly',
    (tester) async {},
  );

  testWidgets('RowItem.boolean displays correct text & icon', (tester) async {
    await tester.pumpWidget(
      TestPage(
        RowItem.boolean('true', true),
      ),
    );

    expect(find.text('true'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);

    await tester.pumpWidget(
      TestPage(
        RowItem.boolean('false', false),
      ),
    );

    expect(find.text('false'), findsOneWidget);
    expect(find.byIcon(Icons.cancel), findsOneWidget);

    await tester.pumpWidget(
      TestPage(
        RowItem.boolean('null', null),
      ),
    );

    expect(find.text('null'), findsOneWidget);
    expect(find.byIcon(Icons.help), findsOneWidget);
  });

  testWidgets('RowItem.boolean pulls default settings', (tester) async {});

  testWidgets('RowItem.boolean applies custom settings', (tester) async {});

  testWidgets(
    'RowItem.tap displays text correctly',
    (tester) async {
      await tester.pumpWidget(
        TestPage(
          RowItem.tap(
            'title1',
            'description1',
            onTap: () => print("hello"),
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
            onTap: null,
          ),
        ),
      );

      expect(find.text('title2'), findsOneWidget);
      expect(find.text('description2'), findsOneWidget);
    },
  );

  testWidgets('RowItem.tap pulls default settings', (tester) async {});

  testWidgets('RowItem.tap applies custom settings', (tester) async {});

  testWidgets('Checks RowItem.tap "onTap" works correctly', (tester) async {});
}
