import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Country extends StatelessWidget {
  final String country;

  Country({
    Key key,
    @required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          'assets/flags/${country.toLowerCase()}.png',
          width: 30,
        ),
        SizedBox(
          width: 5,
        ),
        Text(country),
      ],
    );
  }
}
