class PackageModel {
  final int? id;
  final String name;
  final String price;
  final int featuresCount;
  final List<String> features;
  final bool showBadge;
  final String? badgeText;
  final bool showMoreFeatures;
  final DateTime? selectedAt;

  PackageModel({
    this.id,
    required this.name,
    required this.price,
    required this.featuresCount,
    required this.features,
    this.showBadge = false,
    this.badgeText,
    this.showMoreFeatures = false,
    this.selectedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'featuresCount': featuresCount,
      'features': features.join('|||'), // Using ||| as separator
      'showBadge': showBadge ? 1 : 0,
      'badgeText': badgeText,
      'showMoreFeatures': showMoreFeatures ? 1 : 0,
      'selectedAt': selectedAt?.toIso8601String(),
    };
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      featuresCount: map['featuresCount'],
      features: (map['features'] as String).split('|||'),
      showBadge: map['showBadge'] == 1,
      badgeText: map['badgeText'],
      showMoreFeatures: map['showMoreFeatures'] == 1,
      selectedAt: map['selectedAt'] != null
          ? DateTime.parse(map['selectedAt'])
          : null,
    );
  }

  PackageModel copyWith({
    int? id,
    String? name,
    String? price,
    int? featuresCount,
    List<String>? features,
    bool? showBadge,
    String? badgeText,
    bool? showMoreFeatures,
    DateTime? selectedAt,
  }) {
    return PackageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      featuresCount: featuresCount ?? this.featuresCount,
      features: features ?? this.features,
      showBadge: showBadge ?? this.showBadge,
      badgeText: badgeText ?? this.badgeText,
      showMoreFeatures: showMoreFeatures ?? this.showMoreFeatures,
      selectedAt: selectedAt ?? this.selectedAt,
    );
  }
}
