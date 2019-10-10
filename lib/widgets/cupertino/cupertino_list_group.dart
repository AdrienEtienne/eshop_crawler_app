import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class CupertinoListGroup extends StatelessWidget {
  final Widget child;

  CupertinoListGroup({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.lightBackgroundGray,
          ),
          bottom: BorderSide(
            color: CupertinoColors.lightBackgroundGray,
          ),
        ),
        color: CupertinoColors.white,
      ),
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      padding: EdgeInsets.all(10),
      child: this.child,
    );
  }
}
