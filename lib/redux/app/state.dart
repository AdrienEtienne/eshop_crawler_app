import 'package:flutter/widgets.dart';

enum ActionName { loadStoredData, fetchShops, fetchGames }

class ActionState {
  final String id;
  bool isLoading = false;
  final ActionName name;

  ActionState({bool isLoading, @required this.name}) : id = name.toString() {
    this.isLoading = isLoading ?? this.isLoading;
  }

  copyWith({
    bool isLoading,
  }) {
    return new ActionState(
      isLoading: isLoading ?? this.isLoading,
      name: this.name,
    );
  }
}

class AppState {
  final Map<String, ActionState> actions;

  AppState({
    this.actions,
  });

  factory AppState.initial() => AppState(
        actions: Map<String, ActionState>(),
      );

  AppState copyWith({
    Map<String, ActionState> actions,
  }) {
    return new AppState(
      actions: actions ?? this.actions,
    );
  }
}
