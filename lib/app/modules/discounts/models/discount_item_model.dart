class DiscountItemModel {
  final int? id;
  final String discountName;
  final String description;
  final String discountType;
  final double? priceOf;
  final double? priceBy;
  final double? pricePercentage;
  final String? percentage;
  final double? light;
  final double? payment;
  final double? priceLightPayment;
  final DateTime? dateActivation;
  final DateTime? dateInactivation;
  final String image;

  DiscountItemModel({
    this.id,
    required this.discountName,
    required this.description,
    required this.discountType,
    this.priceOf,
    this.priceBy,
    this.pricePercentage,
    this.percentage,
    this.light,
    this.payment,
    this.priceLightPayment,
    required this.dateActivation,
    required this.dateInactivation,
    required this.image,
  });

  factory DiscountItemModel.fromSqlfiteDatabase(Map<String, dynamic> map) {
    return DiscountItemModel(
      id: map['id'],
      discountName: map['discountName'],
      description: map['description'],
      discountType: map['discountType'],
      priceOf: map['priceOf'],
      priceBy: map['priceBy'],
      pricePercentage: map['pricePercentage'],
      percentage: map['percentage'],
      light: map['light'],
      payment: map['payment'],
      priceLightPayment: map['priceLightPayment'],
      dateActivation: DateTime.parse(map['dateActivation']),
      dateInactivation: DateTime.parse(map['dateInactivation']),
      image: map['image'],
    );
  }

  Map<String, dynamic> toMapSqlfiteDatabase() {
    return {
      'discountName': discountName,
      'description': description,
      'discountType': discountType,
      'priceOf': priceOf,
      'priceBy': priceBy,
      'pricePercentage': pricePercentage,
      'percentage': percentage,
      'light': light,
      'payment': payment,
      'priceLightPayment': priceLightPayment,
      'dateActivation': dateActivation.toString(),
      'dateInactivation': dateInactivation.toString(),
      'image': image,
    };
  }

  copyWith({
    String? discountName,
    String? description,
    String? discountType,
    double? priceOf,
    double? priceBy,
    double? pricePercentage,
    String? percentage,
    double? light,
    double? payment,
    double? priceLightPayment,
    DateTime? dateActivation,
    DateTime? dateInactivation,
    String? image,
  }) {
    return DiscountItemModel(
      discountName: discountName ?? this.discountName,
      description: description ?? this.description,
      discountType: discountType ?? this.discountType,
      priceOf: priceOf ?? this.priceOf,
      priceBy: priceBy ?? this.priceBy,
      pricePercentage: pricePercentage ?? this.pricePercentage,
      percentage: percentage ?? this.percentage,
      light: light ?? this.light,
      payment: payment ?? this.payment,
      priceLightPayment: priceLightPayment ?? this.priceLightPayment,
      dateActivation: dateActivation ?? this.dateActivation,
      dateInactivation: dateInactivation ?? this.dateInactivation,
      image: image ?? this.image,
    );
  }
}
