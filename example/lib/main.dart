import 'package:flutter/material.dart';
import 'package:row_item/row_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'row_item',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget get _spacer => SizedBox(height: 12);
  Widget get _cardSpacer => SizedBox(height: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row item')),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Column(children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(children: <Widget>[
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
                padding: EdgeInsets.all(8),
                child: Column(children: <Widget>[
                  RowItem.text(
                    'English',
                    'Hello',
                    titleStyle: TextStyle(color: Colors.blue),
                    descriptionStyle: TextStyle(fontSize: 18),
                  ),
                  _spacer,
                  RowItem.text(
                    'Español',
                    'Hola',
                    titleStyle: TextStyle(color: Colors.red),
                    descriptionStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _spacer,
                  RowItem.text(
                    'English',
                    'Bye',
                    titleStyle: TextStyle(color: Colors.blue),
                    descriptionStyle: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  _spacer,
                  RowItem.text(
                    'Español',
                    'Adiós',
                    titleStyle: TextStyle(color: Colors.red),
                    descriptionStyle: TextStyle(letterSpacing: 3),
                  ),
                ]),
              ),
            ),
            _cardSpacer,
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(children: <Widget>[
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
                    iconColor: Theme.of(context).accentColor,
                    iconStyle: IconBooleanStyle.filled,
                  ),
                  _spacer,
                  RowItem.boolean(
                    'Chrome',
                    false,
                    iconColor: Theme.of(context).accentColor,
                  ),
                ]),
              ),
            ),
            _cardSpacer,
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(children: <Widget>[
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
