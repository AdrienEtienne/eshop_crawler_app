import 'package:eshop_crawler_app/redux/app/middleware.dart';
import 'package:eshop_crawler_app/redux/game/middleware.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';

List<Middleware<RootState>> createStoreMiddleware() => []
  ..add(new LoggingMiddleware.printer())
  ..add(thunkMiddleware)
  ..addAll(appMiddleware())
  ..addAll(gameMiddleware());
