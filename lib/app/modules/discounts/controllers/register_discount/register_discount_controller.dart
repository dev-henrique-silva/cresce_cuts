import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/discount_database.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/i_discount_database.dart';
import 'package:valevantagens/app/modules/discounts/utils/args/save_discount_args.dart';
import 'package:valevantagens/app/modules/discounts/utils/date_activation_inactivation.dart';
import 'package:valevantagens/app/utils/formatter/formatter.dart';

part 'register_discount_controller.g.dart';

class RegisterDiscountController = _RegisterDiscountControllerBase
    with _$RegisterDiscountController;

abstract class _RegisterDiscountControllerBase with Store {
  final IDiscountDatabase _discountDatabase;

  _RegisterDiscountControllerBase({required DiscountDatabase discountDatabase})
      : _discountDatabase = discountDatabase;

  @observable
  SaveDiscountArgs? args;

  @observable
  File? imageFile;

  @observable
  DateTime? activationDate;

  @observable
  DateTime? inactivationDate;

  @observable
  bool isDiscountActive = false;

  @action
  Future<void> insertDiscount({required DiscountItemModel discountItem}) async {
    await _discountDatabase.insert(discountItem.toMapSqlfiteDatabase());
  }

  @action
  Future<void> updateDiscount({required DiscountItemModel discountItem}) async {
    await _discountDatabase.update(discountItem.toMapSqlfiteDatabase());
  }

  @action
  getImageGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }

  @action
  double calculatePercentage({
    double? price,
    int? percentage,
    String? discountType,
  }) {
    if (discountType == 'Percentual' && price != null && percentage != null) {
      final result = (price * percentage) / 100;
      return double.tryParse(result.toStringAsFixed(2)) ?? 0.0;
    }
    return 0.0;
  }

  @action
  double subtractNumbers({
    double? priceOf,
    double? priceBy,
    String? discountType,
  }) {
    if (discountType == 'Precificação' && priceOf != null && priceBy != null) {
      return priceOf - priceBy;
    }
    return 0.0;
  }

  @action
  bool validateFields({required SaveDiscountArgs args}) {
    List<String> fields = [
      args.discountName,
      args.description,
      args.discountType,
      args.image,
    ];

    for (String field in fields) {
      if (field.isEmpty) {
        return false;
      }
    }

    if (activationDate == null || inactivationDate == null) {
      return false;
    }

    if (args.image.isEmpty || imageFile == null) {
      return false;
    }

    if (!validateFieldsPrecification(args) &&
        !validateFieldsPercentage(args) &&
        !validateFieldsLightPayment(args)) {
      return false;
    }

    return true;
  }

  bool validateFieldsPrecification(SaveDiscountArgs args) {
    List<String> fieldsPrecification = [
      args.priceOf,
      args.priceBy,
    ];

    for (String field in fieldsPrecification) {
      if (field.isEmpty) {
        return false;
      }
    }

    return true;
  }

  bool validateFieldsPercentage(SaveDiscountArgs args) {
    List<String> fieldsPercentage = [
      args.pricePercentage,
      args.percentage,
    ];

    for (String field in fieldsPercentage) {
      if (field.isEmpty) {
        return false;
      }
    }

    return true;
  }

  bool validateFieldsLightPayment(SaveDiscountArgs args) {
    List<String> fieldsLightPayment = [
      args.light,
      args.payment,
      args.priceLightPayment,
    ];

    for (String field in fieldsLightPayment) {
      if (field.isEmpty) {
        return false;
      }
    }

    return true;
  }

  @action
  void saveDiscount({required SaveDiscountArgs args}) {
    final discount = DiscountItemModel(
      isActive: validateDiscountIsActive(
        activationDate: args.dateActivation,
        inactivationDate: args.dateInactivation,
      ),
      discountName: args.discountName,
      description: args.description,
      discountType: args.discountType,
      priceOf: Formatter.toCurrecyDolar(args.priceOf),
      priceBy: Formatter.toCurrecyDolar(args.priceBy),
      resultPrecification: subtractNumbers(
        priceOf: Formatter.toCurrecyDolar(args.priceOf),
        priceBy: Formatter.toCurrecyDolar(args.priceBy),
        discountType: args.discountType,
      ),
      pricePercentage: Formatter.toCurrecyDolar(args.pricePercentage),
      percentage: Formatter.StringToInt(args.percentage),
      resultPercentage: calculatePercentage(
        price: Formatter.toCurrecyDolar(args.pricePercentage),
        percentage: Formatter.StringToInt(args.percentage),
        discountType: args.discountType,
      ),
      light: Formatter.StringToInt(args.light),
      payment: Formatter.StringToInt(args.payment),
      priceLightPayment: Formatter.toCurrecyDolar(args.priceLightPayment),
      dateActivation: args.dateActivation,
      dateInactivation: args.dateInactivation,
      image: args.image,
    );

    insertDiscount(
      discountItem: discount,
    );
  }
}
