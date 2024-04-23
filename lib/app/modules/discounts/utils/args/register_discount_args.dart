class RegisterDiscountArgs {
  final String? title;
  final String? description;
  final String? discountType;
  final String? price;
  final String? image;
  final bool discountForPrice;
  final bool discountForPercentage;
  final bool discountForLightPayment;

  RegisterDiscountArgs({
    this.title,
    this.description,
    this.discountType,
    this.price,
    this.image,
    this.discountForPrice = false,
    this.discountForPercentage = false,
    this.discountForLightPayment = false,
  });

  copyWith({
    String? title,
    String? description,
    String? discountType,
    String? price,
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
      image: image ?? this.image,
      discountForPrice: discountForPrice ?? this.discountForPrice,
      discountForPercentage:
          discountForPercentage ?? this.discountForPercentage,
      discountForLightPayment:
          discountForLightPayment ?? this.discountForLightPayment,
    );
  }
}
