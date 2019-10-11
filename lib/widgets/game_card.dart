import 'package:eshop_crawler_app/data/eshop_crawler/models/game.dart';
import 'package:eshop_crawler_app/redux/game/selector.dart';
import 'package:eshop_crawler_app/widgets/cupertino/cupertino_list_group.dart';
import 'package:eshop_crawler_app/widgets/game_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class GameCard extends StatelessWidget {
  final GameDto game;

  GameCard({
    Key key,
    @required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bestDiscount = GameSelector.getBetterDiscount(game.prices);
    final percent = GameSelector.getPricePercentDiscount(bestDiscount);

    return Column(
      children: <Widget>[
        GameImage(
          imageUrl: game.euImageUrl,
        ),
        CupertinoListGroup(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    game.title,
                    textAlign: TextAlign.center,
                  ),
                  Visibility(
                    visible: bestDiscount.onSale,
                    child: Text(
                      '$percent% off',
                      style: TextStyle(
                        color: CupertinoColors.activeOrange,
                      ),
                    ),
                  )
                ],
              ),
              Icon(CupertinoIcons.right_chevron),
            ],
          ),
        ),
      ],
    );
  }
}
