// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:row_item/row_item.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'row_item',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget get _spacer => const SizedBox(height: 12);
  Widget get _cardSpacer => const SizedBox(height: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row item')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  RowItem.text('English', 'Hello'),
                  _spacer,
                  RowItem.text('Español', 'Hola'),
                  _spacer,
                  RowItem.text('English', 'Bye'),
                  _spacer,
                  RowItem.text('Español', 'Adiós'),
                ]),
              ),
            ),
            _cardSpacer,
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  RowItem.text(
                    'English',
                    'Hello',
                    titleStyle: const TextStyle(color: Colors.blue),
                    descriptionStyle: const TextStyle(fontSize: 18),
                  ),
                  _spacer,
                  RowItem.text(
                    'Español',
                    'Hola',
                    titleStyle: const TextStyle(color: Colors.red),
                    descriptionStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _spacer,
                  RowItem.text(
                    'English',
                    'Bye',
                    titleStyle: const TextStyle(color: Colors.blue),
                    descriptionStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  _spacer,
                  RowItem.text(
                    'Español',
                    'Adiós',
                    titleStyle: const TextStyle(color: Colors.red),
                    descriptionStyle: const TextStyle(letterSpacing: 3),
                  ),
                ]),
              ),
            ),
            _cardSpacer,
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  RowItem.boolean('Firefox', true),
                  _spacer,
                  RowItem.boolean(
                    'Chrome',
                    false,
                    iconStyle: IconBooleanStyle.filled,
                  ),
                  _spacer,
                  RowItem.boolean(
                    'Firefox',
                    true,
                    iconColor: Theme.of(context).colorScheme.primary,
                    iconStyle: IconBooleanStyle.filled,
                  ),
                  _spacer,
                  RowItem.boolean(
                    'Chrome',
                    false,
                    iconColor: Theme.of(context).colorScheme.primary,
                  ),
                ]),
              ),
            ),
            _cardSpacer,
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  RowItem.tap(
                    'Android',
                    'Click here',
                    onTap: () => print('Clicked!'),
                  ),
                  _spacer,
                  RowItem.tap(
                    'iOS',
                    'Click here',
                    onTap: () => print('Clicked!'),
                  ),
                  _spacer,
                  RowItem.tap(
                    'Windows Phone',
                    'Don\'t click',
                  ),
                  _spacer,
                  RowItem.tap(
                    'Symbian',
                    'Don\'t click',
                  ),
                ]),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
