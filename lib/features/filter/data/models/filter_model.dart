class FilterModel {
  String? category;
  String? location;
  List<String> monthlyPayments;
  String? type;
  String? roomCount;
  String? priceRange;
  String? paymentMethod;
  String? propertyStatus;

  FilterModel({
    this.category,
    this.location,
    this.monthlyPayments = const [],
    this.type,
    this.roomCount,
    this.priceRange,
    this.paymentMethod,
    this.propertyStatus,
  });

  FilterModel copyWith({
    String? category,
    String? location,
    List<String>? monthlyPayments,
    String? type,
    String? roomCount,
    String? priceRange,
    String? paymentMethod,
    String? propertyStatus,
  }) {
    return FilterModel(
      category: category ?? this.category,
      location: location ?? this.location,
      monthlyPayments: monthlyPayments ?? this.monthlyPayments,
      type: type ?? this.type,
      roomCount: roomCount ?? this.roomCount,
      priceRange: priceRange ?? this.priceRange,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      propertyStatus: propertyStatus ?? this.propertyStatus,
    );
  }

  void reset() {
    category = null;
    location = null;
    monthlyPayments = [];
    type = null;
    roomCount = null;
    priceRange = null;
    paymentMethod = null;
    propertyStatus = null;
  }
}
