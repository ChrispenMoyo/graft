// GRAFT Post Job - Photos Screen
// Third step in the job posting flow

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../models/job.dart';

/// Photos screen for post job flow
/// Handles optional job photos with placeholder implementation
class PostJobPhotosScreen extends StatefulWidget {
  final List<String> existingPhotos;
  final void Function(List<String> photos) onPhotosUpdated;
  final VoidCallback onBack;
  final VoidCallback onNext;

  const PostJobPhotosScreen({
    super.key,
    this.existingPhotos = const [],
    required this.onPhotosUpdated,
    required this.onBack,
    required this.onNext,
  });

  @override
  State<PostJobPhotosScreen> createState() => _PostJobPhotosScreenState();
}

class _PostJobPhotosScreenState extends State<PostJobPhotosScreen> {
  List<String> _photos = [];
  int _totalPhotos = 0;

  @override
  void initState() {
    super.initState();
    _photos = List.from(widget.existingPhotos);
    // For MVP, we'll simulate photo count
    _totalPhotos = _photos.length;
  }

  void _onRemovePhoto(int index) {
    setState(() {
      _photos.removeAt(index);
      _totalPhotos = _photos.length;
    });
    widget.onPhotosUpdated(_photos);
  }

  /// Add photo - placeholder implementation
  /// In production, this would use an image picker
  void _onAddPhoto() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take Photo'),
            onTap: () {
              Navigator.pop(context);
              _attemptAddPhoto();
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from Gallery'),
            onTap: () {
              Navigator.pop(context);
              _attemptAddPhoto();
            },
          ),
        ],
      ),
    );
  }

  /// Simulate adding a photo for MVP
  /// In production, this would pick an actual image
  void _attemptAddPhoto() {
    // For MVP: add a placeholder photo URL
    // In production, use image_picker to get actual file path or URL
    if (_totalPhotos < maxJobPhotos) {
      setState(() {
        // Using placeholder URLs for demonstration
        _photos.add('https://via.placeholder.com/300?text=Job+Photo+${_totalPhotos + 1}');
        _totalPhotos = _photos.length;
      });
      widget.onPhotosUpdated(_photos);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Maximum $maxJobPhotos photos allowed'),
        ),
      );
    }
  }

  void _onNext() {
    widget.onPhotosUpdated(_photos);
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Photos (Optional)'),
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
                const Text('Step 3 of 6: '),
                Text(
                  'Photos',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add photos (Optional)',
                    style: GraftTypography.headlineLarge.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.sm),

                  Text(
                    'Photos help workers understand your job better. You can add up to $maxJobPhotos photos.',
                    style: GraftTypography.bodyMedium.copyWith(
                      color: GraftColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xl),

                  // Photos grid
                  if (_photos.isEmpty)
                    _BuildEmptyState()
                  else
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      itemCount: _photos.length,
                      itemBuilder: (context, index) {
                        return _PhotoCard(
                          photoUrl: _photos[index],
                          onDelete: () => _onRemovePhoto(index),
                        );
                      },
                    ),

                  // Add photo button
                  const SizedBox(height: GraftSpacing.lg),
                  Center(
                    child: TextButton.icon(
                      onPressed: _totalPhotos < maxJobPhotos ? _onAddPhoto : null,
                      icon: const Icon(Icons.add_a_photo, size: GraftIcon.lg),
                      label: Text(
                        _totalPhotos < maxJobPhotos
                            ? 'Add Photo'
                            : 'Maximum Photos Reached ($maxJobPhotos)',
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: _totalPhotos < maxJobPhotos
                            ? GraftColors.primary
                            : GraftColors.textMuted,
                      ),
                    ),
                  ),

                  const SizedBox(height: GraftSpacing.md),

                  // Photo count
                  Center(
                    child: Text(
                      '$_totalPhotos of $maxJobPhotos photos',
                      style: GraftTypography.bodySmall.copyWith(
                        color: GraftColors.textMuted,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Skip and Next buttons
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: Column(
              children: [
                PrimaryButton(
                  text: 'Next',
                  onPressed: _onNext,
                  width: double.infinity,
                ),
                const SizedBox(height: GraftSpacing.sm),
                SecondaryButton(
                  text: 'Skip',
                  onPressed: _onNext,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Empty state for when no photos added
class _BuildEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: GraftIcon.xxl,
            color: GraftColors.textMuted,
          ),
          const SizedBox(height: GraftSpacing.xxl),
          Text(
            'No photos yet',
            style: GraftTypography.headlineSmall.copyWith(
              color: GraftColors.textMuted,
            ),
          ),
          const SizedBox(height: GraftSpacing.md),
          Text(
            'Photos are optional but help workers understand your job better',
            style: GraftTypography.bodyMedium.copyWith(
              color: GraftColors.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Photo card widget
class _PhotoCard extends StatelessWidget {
  final String photoUrl;
  final VoidCallback onDelete;

  const _PhotoCard({
    required this.photoUrl,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: GraftElevation.level1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(GraftBorderRadius.md),
            child: Image.network(
              photoUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: GraftColors.surfaceVariant,
                  child: const Center(
                    child: Icon(Icons.broken_image, size: GraftIcon.lg),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: InkWell(
            onTap: onDelete,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: GraftColors.error,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                size: GraftIcon.xs,
                color: GraftColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}