import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/discount_database.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/i_discount_database.dart';

part 'register_discount_controller.g.dart';

class RegisterDiscountController = _RegisterDiscountControllerBase
    with _$RegisterDiscountController;

abstract class _RegisterDiscountControllerBase with Store {
  final IDiscountDatabase _discountDatabase;

  _RegisterDiscountControllerBase({required DiscountDatabase discountDatabase})
      : _discountDatabase = discountDatabase;

  @observable
  File? imageFile;

  @observable
  DateTime? activationDate;

  @observable
  DateTime? inactivationDate;

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
}
