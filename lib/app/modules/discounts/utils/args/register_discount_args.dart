class RegisterDiscountArgs {
  final bool isActive;
  final String? title;
  final String? description;
  final String? discountType;
  final String? price;
  final String? priceOf;
  final String? priceBy;
  final String? pricePercentage;
  final String? percentage;
  final String? light;
  final String? payment;
  final String? priceLightPayment;
  final String? image;
  final bool discountForPrice;
  final bool discountForPercentage;
  final bool discountForLightPayment;
  final String? dateActivation;
  final String? dateInactivation;

  RegisterDiscountArgs({
    this.isActive = false,
    this.title,
    this.description,
    this.discountType,
    this.price,
    this.priceOf,
    this.priceBy,
    this.percentage,
    this.light,
    this.payment,
    this.pricePercentage,
    this.priceLightPayment,
    this.image,
    this.discountForPrice = false,
    this.discountForPercentage = false,
    this.discountForLightPayment = false,
    this.dateActivation,
    this.dateInactivation,
  });

  copyWith({
    bool? isActive,
    String? title,
    String? description,
    String? discountType,
    String? price,
    String? priceOf,
    String? priceBy,
    String? percentage,
    String? light,
    String? payment,
    String? pricePercentage,
    String? priceLightPayment,
    String? image,
    bool? discountForPrice,
    bool? discountForPercentage,
    bool? discountForLightPayment,
    String? dateActivation,
    String? dateInactivation,
  }) {
    return RegisterDiscountArgs(
      isActive: isActive ?? this.isActive,
      title: title ?? this.title,
      description: description ?? this.description,
      discountType: discountType ?? this.discountType,
      price: price ?? this.price,
      priceOf: priceOf ?? this.priceOf,
      priceBy: priceBy ?? this.priceBy,
      percentage: percentage ?? this.percentage,
      light: light ?? this.light,
      payment: payment ?? this.payment,
      pricePercentage: pricePercentage ?? this.pricePercentage,
      priceLightPayment: priceLightPayment ?? this.priceLightPayment,
      image: image ?? this.image,
      discountForPrice: discountForPrice ?? this.discountForPrice,
      discountForPercentage:
          discountForPercentage ?? this.discountForPercentage,
      discountForLightPayment:
          discountForLightPayment ?? this.discountForLightPayment,
      dateActivation: dateActivation ?? this.dateActivation,
      dateInactivation: dateInactivation ?? this.dateInactivation,
    );
  }
}
