import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class GameImage extends StatelessWidget {
  final String imageUrl;

  GameImage({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: imageUrl != null,
      child: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new NetworkImage(
              'https:$imageUrl',
            ),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 400,
        ),
      ),
    );
  }
}
