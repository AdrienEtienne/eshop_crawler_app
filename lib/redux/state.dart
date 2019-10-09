import 'package:eshop_crawler_app/redux/app/state.dart';

class RootState {
  final AppState app;

  RootState({
    this.app,
  });

  RootState copyWith({
    AppState app,
  }) {
    return new RootState(
      app: app ?? this.app,
    );
  }

  factory RootState.initial() {
    return RootState(
      app: AppState.initial(),
    );
  }
}
