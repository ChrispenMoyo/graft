// GRAFT Form Components
// Reusable form input widgets for GRAFT

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// GRAFT TextField
/// Standard text field component
class GraftTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool readOnly;

  const GraftTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.obscureText = false,
    this.textInputAction,
    this.validator,
    this.maxLines,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: BorderSide(color: GraftColors.primary, width: 2),
        ),
      ),
      obscureText: obscureText,
      textInputAction: textInputAction,
      validator: validator,
      maxLines: maxLines,
      readOnly: readOnly,
    );
  }
}

/// GRAFT Phone Input
/// Phone number input field for Zimbabwean numbers
class GraftPhoneInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const GraftPhoneInput({
    super.key,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: const Text('Phone Number'),
        hintText: '+263 XXX XXX XXXX',
        prefixText: '+263 ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: BorderSide(color: GraftColors.primary, width: 2),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Phone number is required';
            }
            if (!value.startsWith('+263')) {
              return 'Phone number must start with +263';
            }
            return null;
          },
    );
  }
}

/// GRAFT Currency Input
/// Currency input field for USD amounts
class GraftCurrencyInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? Function(String?)? validator;

  const GraftCurrencyInput({
    super.key,
    this.controller,
    this.label,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        hintText: '0.00',
        prefixText: 'USD ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: BorderSide(color: GraftColors.primary, width: 2),
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: validator,
    );
  }
}

/// GRAFT Location Field
/// Location input field with autocomplete hint
class GraftLocationField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final VoidCallback? onCurrentLocation;

  const GraftLocationField({
    super.key,
    this.controller,
    this.label,
    this.onCurrentLocation,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : const Text('Location'),
        hintText: 'Enter location or use current location',
        suffixIcon: onCurrentLocation != null
            ? IconButton(
                icon: const Icon(Icons.my_location),
                onPressed: onCurrentLocation,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: BorderSide(color: GraftColors.primary, width: 2),
        ),
      ),
      textInputAction: TextInputAction.done,
    );
  }
}

/// GRAFT Search Field
/// Search input with search icon
class GraftSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;

  const GraftSearchField({
    super.key,
    this.controller,
    this.hint,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint ?? 'Search...',
        prefixIcon: const Icon(Icons.search, size: GraftIcon.md),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
          borderSide: BorderSide(color: GraftColors.primary, width: 2),
        ),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted != null ? (_) => onSubmitted!() : null,
    );
  }
}

/// GRAFT Dropdown/Select
/// Dropdown selection field
class GraftDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final String Function(T)? itemLabel;
  final String? hint;
  final String? label;
  final String? Function(T?)? validator;

  const GraftDropdown({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.itemLabel,
    this.hint,
    this.label,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          borderSide: BorderSide(color: GraftColors.primary, width: 2),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(itemLabel?.call(item) ?? item.toString()),
              ))
          .toList(),
      onChanged: onChanged,
      validator: validator,
      isExpanded: true,
    );
  }
}

/// GRAFT Category Selector
/// Category selection with icons
class GraftCategorySelector extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final String? selectedCategory;
  final ValueChanged<String?>? onChanged;

  const GraftCategorySelector({
    super.key,
    required this.categories,
    this.selectedCategory,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: GraftSpacing.sm,
      runSpacing: GraftSpacing.sm,
      children: categories.map((category) {
        final isSelected = category['id'] == selectedCategory;
        return FilterChip(
          selected: isSelected,
          label: Text(category['name']),
          avatar: category['icon'] != null
              ? Icon(category['icon'], size: GraftIcon.xs)
              : null,
          onSelected: (selected) => onChanged?.call(category['id']),
          selectedColor: GraftColors.primary.withValues(alpha: 0.2),
          labelStyle: TextStyle(
            color: isSelected ? GraftColors.primary : GraftColors.textPrimary,
          ),
        );
      }).toList(),
    );
  }
}

/// GRAFT Date/Time Selector
/// DateTime picker button
class GraftDateTimeSelector extends StatelessWidget {
  final DateTime? selectedDateTime;
  final ValueChanged<DateTime?>? onChanged;
  final String label;
  final bool showTime;

  const GraftDateTimeSelector({
    super.key,
    this.selectedDateTime,
    this.onChanged,
    this.label = 'Select Date/Time',
    this.showTime = false,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = selectedDateTime != null
        ? selectedDateTime!.toLocal().toString().split('.').first
        : label;

    return InputOutlinedButton(
      onPressed: () {},
      label: displayText,
      icon: Icons.calendar_today,
    );
  }
}

/// GRAFT Input Outlined Button
/// Button styled like an input field
class InputOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;

  const InputOutlinedButton({
    super.key,
    this.onPressed,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(GraftTouchTarget.inputHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: GraftIcon.md),
            const SizedBox(width: GraftSpacing.sm),
          ],
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: GraftTypography.systemFontFallback,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}