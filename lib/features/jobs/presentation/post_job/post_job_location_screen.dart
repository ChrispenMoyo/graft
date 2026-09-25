// GRAFT Post Job - Location Screen
// Fourth step in the job posting flow

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../models/location.dart';

/// Location selection screen for post job flow
class PostJobLocationScreen extends StatefulWidget {
  final Location? currentLocation;
  final void Function(Location location) onLocationSelected;
  final VoidCallback onBack;

  const PostJobLocationScreen({
    super.key,
    this.currentLocation,
    required this.onLocationSelected,
    required this.onBack,
  });

  @override
  State<PostJobLocationScreen> createState() => _PostJobLocationScreenState();
}

class _PostJobLocationScreenState extends State<PostJobLocationScreen> {
  Location? _selectedLocation;
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.currentLocation;
    if (_selectedLocation?.area != null) {
      _locationController.text = _selectedLocation!.area!;
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_selectedLocation != null) {
      widget.onLocationSelected(_selectedLocation!);
    }
  }

  void _useCurrentLocation() {
    // For MVP: simulate getting current location
    // In production, use geolocator or similar package
    setState(() {
      _selectedLocation = const Location(
        area: 'Current Area',
        city: 'Harare',
      );
      _locationController.text = 'Current Area';
    });
  }

  void _onLocationChanged(String value) {
    setState(() {
      if (value.isNotEmpty) {
        _selectedLocation = Location(area: value);
      } else {
        _selectedLocation = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Location'),
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
                const Text('Step 4 of 6: '),
                Text(
                  'Location',
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
                    'Where is the job located?',
                    style: GraftTypography.headlineLarge.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.sm),

                  Text(
                    'Help workers find you by providing a general area. Exact address is only shared with the selected worker.',
                    style: GraftTypography.bodyMedium.copyWith(
                      color: GraftColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xl),

                  // Current location button
                  TextButton.icon(
                    onPressed: _useCurrentLocation,
                    icon: const Icon(Icons.my_location, size: GraftIcon.lg),
                    label: const Text('Use Current Location'),
                    style: TextButton.styleFrom(
                      foregroundColor: GraftColors.primary,
                      textStyle: const TextStyle(
                        fontFamily: GraftTypography.systemFontFallback,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.lg),

                  // Location input
                  Text(
                    'Or enter location manually',
                    style: GraftTypography.labelLarge.copyWith(
                      color: GraftColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xs),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      hintText: 'Area, suburb, or landmark (e.g., Borrowdale, Avondale)',
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
                    onChanged: _onLocationChanged,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: GraftSpacing.lg),

                  // Selected location preview
                  if (_selectedLocation != null)
                    _LocationPreview(
                      location: _selectedLocation!,
                      onClear: () {
                        setState(() {
                          _selectedLocation = null;
                          _locationController.clear();
                        });
                      },
                    ),

                  const SizedBox(height: GraftSpacing.lg),

                  // Location example
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
                            'Privacy note',
                            style: GraftTypography.labelLarge.copyWith(
                              color: GraftColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: GraftSpacing.xs),
                          Text(
                            'When a worker is selected, they will see a general area location, not your exact address. '
                            'You can update the exact location during job coordination.',
                            style: GraftTypography.bodySmall.copyWith(
                              color: GraftColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Next button
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: PrimaryButton(
              text: 'Next',
              onPressed: _selectedLocation != null ? _onNext : null,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

/// Location preview widget
class _LocationPreview extends StatelessWidget {
  final Location location;
  final VoidCallback onClear;

  const _LocationPreview({
    required this.location,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: GraftElevation.level2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
      ),
      child: Padding(
        padding: const EdgeInsets.all(GraftSpacing.lg),
        child: Row(
          children: [
            const Icon(Icons.location_on, size: GraftIcon.lg, color: GraftColors.primary),
            const SizedBox(width: GraftSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job location',
                    style: GraftTypography.labelSmall.copyWith(
                      color: GraftColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location.displayLocation,
                    style: GraftTypography.headlineSmall.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: onClear,
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}