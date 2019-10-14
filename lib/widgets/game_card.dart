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
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      game.title,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      maxLines: 1,
                    ),
                    Visibility(
                      visible: bestDiscount.onSale,
                      child: Text(
                        '$percent% off',
                        style: TextStyle(
                          color: CupertinoColors.activeOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(CupertinoIcons.right_chevron),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
