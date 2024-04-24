class SaveDiscountArgs {
  final bool isActive;
  final String discountName;
  final String description;
  final String discountType;
  final String priceOf;
  final String priceBy;
  final String? resultPrecification;
  final String pricePercentage;
  final String percentage;
  final String? resultPercentage;
  final String light;
  final String payment;
  final String priceLightPayment;
  final DateTime? dateActivation;
  final DateTime? dateInactivation;
  final String image;

  SaveDiscountArgs({
    this.isActive = false,
    required this.discountName,
    required this.description,
    required this.discountType,
    required this.priceOf,
    required this.priceBy,
    this.resultPrecification,
    required this.pricePercentage,
    required this.percentage,
    this.resultPercentage,
    required this.light,
    required this.payment,
    required this.priceLightPayment,
    required this.dateActivation,
    required this.dateInactivation,
    required this.image,
  });
}
