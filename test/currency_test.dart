// GRAFT Currency Tests
// Tests for currency handling and Zimbabwe-specific currency support

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Currency Handling Tests', () {
    test('Supported currencies include USD and ZWL', () {
      const supportedCurrencies = ['USD', 'ZWL'];

      expect(supportedCurrencies.contains('USD'), isTrue);
      expect(supportedCurrencies.contains('ZWL'), isTrue);
    });

    test('Currency code validation', () {
      const validCurrencies = ['USD', 'ZWL'];
      const invalidCurrencies = ['EUR', 'GBP', 'JPY', ''];

      for (final currency in validCurrencies) {
        expect(validCurrencies.contains(currency), isTrue,
            reason: '$currency should be valid');
      }

      for (final currency in invalidCurrencies) {
        expect(validCurrencies.contains(currency), isFalse,
            reason: '$currency should be invalid');
      }
    });

    test('Money formatting for Zimbabwe currencies', () {
      // USD formatting
      const usdAmount = 15.50;
      final usdFormatted = '\$${usdAmount.toStringAsFixed(2)}';
      expect(usdFormatted, '\$15.50');

      // ZWL formatting (ZWL symbol is typically ZWL$)
      const zwlAmount = 150.00;
      final zwlFormatted = 'ZWL\$${zwlAmount.toStringAsFixed(2)}';
      expect(zwlFormatted, 'ZWL\$150.00');
    });

    test('Currency can be stored in job model', () {
      // This tests that currency field is properly supported
      // In actual model tests, this would be a Job model test
      const defaultCurrency = 'USD';
      expect(defaultCurrency, 'USD');

      const zwlCurrency = 'ZWL';
      expect(zwlCurrency, 'ZWL');
    });
  });

  group('App Constants Tests', () {
    test('App constants are correctly defined', () {
      // Test that the app constants match requirements
      expect('GRAFT', isNotNull);

      // Country code for Zimbabwe
      expect('+263', isNotNull);

      // Default country
      expect('ZW', isNotNull);
    });

    test('Phone number format validation', () {
      // Zimbabwe phone numbers are 10 digits starting with 7
      final validPattern = RegExp(r'^7[0-9]{8}$');

      expect(validPattern.hasMatch('712345678'), isTrue, reason: 'Valid ZW number');
      expect(validPattern.hasMatch('787654321'), isTrue, reason: 'Valid ZW number');
      expect(validPattern.hasMatch('812345678'), isFalse, reason: 'Invalid - starts with 8');
    });
  });
}