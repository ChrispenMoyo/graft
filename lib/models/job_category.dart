// GRAFT Job Category Model
// Represents job categories in the GRAFT marketplace

enum JobCategoryEnum {
  gardening('Gardening', '🌱'),
  cleaning('Cleaning', '🧹'),
  plumbing('Plumbing', '🔧'),
  electrical('Electrical', '⚡'),
  painting('Painting', '🎨'),
  moving('Moving', '📦'),
  handyman('Handyman', '🔨'),
  errands('Errands', '🛒'),
  other('Other', '📋');

  const JobCategoryEnum(this.label, this.emoji);

  final String label;
  final String emoji;

  @override
  String toString() => label;
}

class JobCategory {
  final JobCategoryEnum category;
  final String? description;

  const JobCategory({
    required this.category,
    this.description,
  });

  factory JobCategory.fromJson(Map<String, dynamic> json) {
    return JobCategory(
      category: JobCategoryEnum.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => JobCategoryEnum.other,
      ),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category.name,
      'description': description,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JobCategory && other.category == category;
  }

  @override
  int get hashCode => category.hashCode;
}