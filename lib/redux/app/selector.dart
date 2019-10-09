import 'package:eshop_crawler_app/redux/app/state.dart';

class AppSelector {
  static bool isActionLoading(
      Map<String, ActionState> actions, ActionName name) {
    ActionState action = ActionState(name: name);
    if (!actions.containsKey(action.id)) return false;
    ActionState tmp = actions[action.id];
    return tmp.isLoading;
  }
}
