class DiscountItemModel {
  final int? id;
  bool isActive;
  final String discountName;
  final String description;
  final String discountType;
  final double? priceOf;
  final double? priceBy;
  final double? resultPrecification;
  final double? pricePercentage;
  final int? percentage;
  final double? resultPercentage;
  final int? light;
  final int? payment;
  final double? priceLightPayment;
  DateTime? dateActivation;
  DateTime? dateInactivation;
  final String image;

  DiscountItemModel({
    this.id,
    required this.isActive,
    required this.discountName,
    required this.description,
    required this.discountType,
    this.priceOf,
    this.priceBy,
    this.resultPrecification,
    this.pricePercentage,
    this.percentage,
    this.resultPercentage,
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
      isActive: map['isActive'] == 1 ? true : false,
      discountName: map['discountName'],
      description: map['description'],
      discountType: map['discountType'],
      priceOf: map['priceOf'],
      priceBy: map['priceBy'],
      resultPrecification: map['resultPrecification'],
      pricePercentage: map['pricePercentage'],
      percentage: map['percentage'],
      resultPercentage: map['resultPercentage'],
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
      'id': id,
      'isActive': isActive == true ? 1 : 0,
      'discountName': discountName,
      'description': description,
      'discountType': discountType,
      'priceOf': priceOf,
      'priceBy': priceBy,
      'resultPrecification': resultPrecification,
      'pricePercentage': pricePercentage,
      'percentage': percentage,
      'resultPercentage': resultPercentage,
      'light': light,
      'payment': payment,
      'priceLightPayment': priceLightPayment,
      'dateActivation': dateActivation.toString(),
      'dateInactivation': dateInactivation.toString(),
      'image': image,
    };
  }

  copyWith({
    int? id,
    bool? isActive,
    String? discountName,
    String? description,
    String? discountType,
    double? priceOf,
    double? priceBy,
    double? resultPrecification,
    double? pricePercentage,
    int? percentage,
    double? resultPercentage,
    int? light,
    int? payment,
    double? priceLightPayment,
    DateTime? dateActivation,
    DateTime? dateInactivation,
    String? image,
  }) {
    return DiscountItemModel(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      discountName: discountName ?? this.discountName,
      description: description ?? this.description,
      discountType: discountType ?? this.discountType,
      priceOf: priceOf ?? this.priceOf,
      priceBy: priceBy ?? this.priceBy,
      resultPrecification: resultPrecification ?? this.resultPrecification,
      pricePercentage: pricePercentage ?? this.pricePercentage,
      percentage: percentage ?? this.percentage,
      resultPercentage: resultPercentage ?? this.resultPercentage,
      light: light ?? this.light,
      payment: payment ?? this.payment,
      priceLightPayment: priceLightPayment ?? this.priceLightPayment,
      dateActivation: dateActivation ?? this.dateActivation,
      dateInactivation: dateInactivation ?? this.dateInactivation,
      image: image ?? this.image,
    );
  }
}
