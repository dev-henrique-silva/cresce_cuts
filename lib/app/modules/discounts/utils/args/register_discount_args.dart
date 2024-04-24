class RegisterDiscountArgs {
  final bool isActive;
  final String? title;
  final String? description;
  final String? discountType;
  final String? price;
  final String? priceOf;
  final String? pricePercentage;
  final String? priceLightPayment;
  final String? image;
  final bool discountForPrice;
  final bool discountForPercentage;
  final bool discountForLightPayment;

  RegisterDiscountArgs({
    this.isActive = false,
    this.title,
    this.description,
    this.discountType,
    this.price,
    this.priceOf,
    this.pricePercentage,
    this.priceLightPayment,
    this.image,
    this.discountForPrice = false,
    this.discountForPercentage = false,
    this.discountForLightPayment = false,
  });

  copyWith({
    bool? isActive,
    String? title,
    String? description,
    String? discountType,
    String? price,
    String? priceOf,
    String? pricePercentage,
    String? priceLightPayment,
    String? image,
    bool? discountForPrice,
    bool? discountForPercentage,
    bool? discountForLightPayment,
  }) {
    return RegisterDiscountArgs(
      title: title ?? this.title,
      description: description ?? this.description,
      discountType: discountType ?? this.discountType,
      price: price ?? this.price,
      priceOf: priceOf ?? this.priceOf,
      pricePercentage: pricePercentage ?? this.pricePercentage,
      priceLightPayment: priceLightPayment ?? this.priceLightPayment,
      image: image ?? this.image,
      discountForPrice: discountForPrice ?? this.discountForPrice,
      discountForPercentage:
          discountForPercentage ?? this.discountForPercentage,
      discountForLightPayment:
          discountForLightPayment ?? this.discountForLightPayment,
    );
  }
}
