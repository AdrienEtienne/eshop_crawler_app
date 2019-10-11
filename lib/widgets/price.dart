import 'package:eshop_crawler_app/data/eshop_crawler/models/price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Price extends StatelessWidget {
  final PriceDto price;

  Price({
    Key key,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          price.discountAmount ?? '',
          style: TextStyle(color: CupertinoColors.activeOrange),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          price.amount,
          style: price.onSale
              ? TextStyle(
                  color: CupertinoColors.inactiveGray,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 14,
                )
              : null,
        ),
      ],
    );
  }
}
