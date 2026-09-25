// GRAFT Post Job - Budget Screen
// Sixth and final step in the job posting flow

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../models/job.dart';

/// Budget screen for post job flow
/// Allows user to set a fixed budget or leave it open for offers
class PostJobBudgetScreen extends StatefulWidget {
  final double? currentBudget;
  final PricingPreference? currentPricingPreference;
  final void Function(double? budget, PricingPreference preference) onBudgetSelected;
  final VoidCallback onBack;

  const PostJobBudgetScreen({
    super.key,
    this.currentBudget,
    this.currentPricingPreference,
    required this.onBudgetSelected,
    required this.onBack,
  });

  @override
  State<PostJobBudgetScreen> createState() => _PostJobBudgetScreenState();
}

class _PostJobBudgetScreenState extends State<PostJobBudgetScreen> {
  double? _budget;
  PricingPreference? _pricingPreference;
  final TextEditingController _budgetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _budget = widget.currentBudget;
    _pricingPreference = widget.currentPricingPreference;
    if (_budget != null) {
      _budgetController.text = _budget!.toStringAsFixed(2);
    }
  }

  @override
  void dispose() {
    _budgetController.dispose();
    super.dispose();
  }

  /// Whether the currently entered budget can be used:
  /// empty is fine for "Open to Offers", fixed budgets need an amount > 0.
  bool get _hasValidBudget {
    if (_pricingPreference == PricingPreference.openToOffers &&
        _budgetController.text.trim().isEmpty) {
      return true;
    }
    return _budget != null && _budget! > 0;
  }

  void _onNext() {
    if (_pricingPreference != null && _hasValidBudget) {
      widget.onBudgetSelected(_budget, _pricingPreference!);
    }
  }

  void _onBudgetTextChanged(String value) {
    final double? parsed = double.tryParse(value);
    setState(() {
      // An unparsable or non-positive amount is treated as no budget so the
      // Review button stays disabled until a valid amount is entered.
      _budget = (parsed != null && parsed > 0) ? parsed : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Budget'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBack,
        ),
      ),
      body: Column(
        children: [
          // Progress indicator
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Step 6 of 6: '),
                Text(
                  'Budget',
                  style: GraftTypography.headlineSmall.copyWith(
                    color: GraftColors.primary,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: GraftSpacing.lg),
              child: ListView(
                padding: const EdgeInsets.only(bottom: GraftSpacing.xxxl),
                children: [
                  Text(
                    'What is your budget?',
                    style: GraftTypography.headlineLarge.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.sm),

                  Text(
                    'You can set a fixed budget or leave it open for workers to make offers.',
                    style: GraftTypography.bodyMedium.copyWith(
                      color: GraftColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xl),

                  // Pricing preference selection
                  Text(
                    'Pricing Method',
                    style: GraftTypography.labelLarge.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xs),

                  Column(
                    children: [
                      _PricingOption(
                        title: 'Fixed Budget',
                        subtitle: 'Set a specific amount you\'re willing to pay',
                        isSelected: _pricingPreference == PricingPreference.fixedBudget,
                        icon: Icons.account_balance_wallet,
                        onTap: () {
                          setState(() {
                            _pricingPreference = PricingPreference.fixedBudget;
                          });
                        },
                      ),
                      const SizedBox(height: GraftSpacing.sm),
                      _PricingOption(
                        title: 'Open to Offers',
                        subtitle: 'Let workers propose their price',
                        isSelected: _pricingPreference == PricingPreference.openToOffers,
                        icon: Icons.attach_money,
                        onTap: () {
                          setState(() {
                            _pricingPreference = PricingPreference.openToOffers;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: GraftSpacing.xl),

                  // Budget input (only shown for fixed budget)
                  if (_pricingPreference == PricingPreference.fixedBudget) ...[
                    Text(
                      'Your Budget (USD)',
                      style: GraftTypography.labelLarge.copyWith(
                        color: GraftColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: GraftSpacing.xs),
                    TextFormField(
                      controller: _budgetController,
                      decoration: InputDecoration(
                        hintText: '0.00',
                        prefixText: 'USD ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(GraftBorderRadius.md)),
                          borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
                          borderSide: BorderSide(color: GraftColors.primary, width: 2),
                        ),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: _onBudgetTextChanged,
                    ),
                    const SizedBox(height: GraftSpacing.lg),
                  ],

                  // Budget info
                  Card(
                    elevation: GraftElevation.level1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(GraftBorderRadius.md),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(GraftSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How it works',
                            style: GraftTypography.labelLarge.copyWith(
                              color: GraftColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: GraftSpacing.xs),
                          if (_pricingPreference == PricingPreference.fixedBudget) ...[
                            Text(
                              '• Workers will bid with a price within your budget range',
                              style: GraftTypography.bodyMedium.copyWith(
                                color: GraftColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: GraftSpacing.xs),
                            Text(
                              '• If no worker can meet your budget, you\'ll be notified',
                              style: GraftTypography.bodyMedium.copyWith(
                                color: GraftColors.textSecondary,
                              ),
                            ),
                          ] else ...[
                            Text(
                              '• Workers will contact you with their offers',
                              style: GraftTypography.bodyMedium.copyWith(
                                color: GraftColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: GraftSpacing.xs),
                            Text(
                              '• You can review and accept offers from qualified workers',
                              style: GraftTypography.bodyMedium.copyWith(
                                color: GraftColors.textSecondary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: GraftSpacing.lg),

                  Text(
                    'Example:',
                    style: GraftTypography.labelLarge.copyWith(
                      color: GraftColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xs),
                  Text(
                    'Fixed budget: USD 500 - Workers bid within this range\nOpen offers: Workers propose their own price',
                    style: GraftTypography.bodyMedium.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Review button
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: PrimaryButton(
              text: 'Review Job',
              onPressed: _pricingPreference != null && _hasValidBudget ? _onNext : null,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

/// Pricing option card widget
class _PricingOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;

  const _PricingOption({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(GraftBorderRadius.md),
      child: Card(
        elevation: isSelected ? GraftElevation.level2 : GraftElevation.level1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          side: BorderSide(
            color: isSelected ? GraftColors.primary : GraftColors.surfaceVariant,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.lg),
          child: Row(
            children: [
              Icon(
                icon,
                size: GraftIcon.lg,
                color: isSelected ? GraftColors.primary : GraftColors.textSecondary,
              ),
              const SizedBox(width: GraftSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GraftTypography.headlineSmall.copyWith(
                        color: isSelected ? GraftColors.primary : GraftColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GraftTypography.bodySmall.copyWith(
                        color: GraftColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: GraftSpacing.sm),
              Icon(
                isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                color: isSelected ? GraftColors.primary : GraftColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}