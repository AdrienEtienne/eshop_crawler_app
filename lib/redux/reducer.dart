import 'package:eshop_crawler_app/redux/app/reducer.dart';
import 'package:eshop_crawler_app/redux/state.dart';

RootState reducer(RootState state, action) {
  return RootState(
    app: appReducer(state.app, action),
  );
}
