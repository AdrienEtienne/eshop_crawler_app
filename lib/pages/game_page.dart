import 'package:eshop_crawler_app/data/eshop_crawler/models/game.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:eshop_crawler_app/view_models/games_vm.dart';
import 'package:eshop_crawler_app/widgets/country.dart';
import 'package:eshop_crawler_app/widgets/cupertino/cupertino_list_group.dart';
import 'package:eshop_crawler_app/widgets/cupertino/cupertino_title.dart';
import 'package:eshop_crawler_app/widgets/game_image.dart';
import 'package:eshop_crawler_app/widgets/price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class _GameViewModel {
  final GamesViewModel games;

  _GameViewModel({
    @required this.games,
  });

  static fromStore(Store<RootState> store) {
    return _GameViewModel(
      games: GamesViewModel.fromStore(store),
    );
  }
}

class GamePage extends StatefulWidget {
  static final route = '/game';

  final GameDto game;

  GamePage({@required this.game});

  @override
  State<StatefulWidget> createState() {
    return _GameState();
  }
}

class _GameState extends State<GamePage> {
  Widget buildPrices(_GameViewModel vm) {
    final priceShops = vm.games.getFilteredPriceShops(this.widget.game.prices);
    final children = List<Widget>();

    num i = 0;
    priceShops.forEach((shopPrice) {
      if (i++ > 0) {
        children.add(Divider());
      }

      children.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Country(
            country: shopPrice.shop.country,
          ),
          Price(
            price: shopPrice.price,
          ),
        ],
      ));
    });

    return Column(
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, _GameViewModel>(
      converter: (Store<RootState> store) {
        return _GameViewModel.fromStore(store);
      },
      builder: (BuildContext context, _GameViewModel vm) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(this.widget.game.title),
          ),
          child: ListView(
            children: <Widget>[
              GameImage(
                imageUrl: this.widget.game.euImageUrl,
              ),
              SizedBox(
                height: 15,
              ),
              CupertinoTitle(
                text: 'Prices',
              ),
              CupertinoListGroup(
                child: buildPrices(vm),
              )
            ],
          ),
        );
      },
    );
  }
}
