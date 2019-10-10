import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class CupertinoTitle extends StatelessWidget {
  final String text;

  CupertinoTitle({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Text(
            this.text,
            style: TextStyle(
              color: CupertinoColors.inactiveGray,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
