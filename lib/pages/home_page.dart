import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  static final String route = '/home';

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.title,
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.all(0),
          onPressed: _incrementCounter,
          child: Icon(CupertinoIcons.add),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
            ),
          ],
        ),
      ),
    );
  }
}
