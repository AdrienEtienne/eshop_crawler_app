import 'package:eshop_crawler_app/redux/app/selector.dart';
import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Selectors', () {
    test('Return formatted phone number', () {
      final isActionLoading = AppSelector.isActionLoading(
        new Map(),
        ActionName.loadStoredData,
      );

      expect(isActionLoading, equals(false));
    });
  });
}
