// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_discount_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterDiscountController on _RegisterDiscountControllerBase, Store {
  late final _$argsAtom =
      Atom(name: '_RegisterDiscountControllerBase.args', context: context);

  @override
  DiscountArgs? get args {
    _$argsAtom.reportRead();
    return super.args;
  }

  @override
  set args(DiscountArgs? value) {
    _$argsAtom.reportWrite(value, super.args, () {
      super.args = value;
    });
  }

  late final _$imageFileAtom =
      Atom(name: '_RegisterDiscountControllerBase.imageFile', context: context);

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$activationDateAtom = Atom(
      name: '_RegisterDiscountControllerBase.activationDate', context: context);

  @override
  DateTime? get activationDate {
    _$activationDateAtom.reportRead();
    return super.activationDate;
  }

  @override
  set activationDate(DateTime? value) {
    _$activationDateAtom.reportWrite(value, super.activationDate, () {
      super.activationDate = value;
    });
  }

  late final _$inactivationDateAtom = Atom(
      name: '_RegisterDiscountControllerBase.inactivationDate',
      context: context);

  @override
  DateTime? get inactivationDate {
    _$inactivationDateAtom.reportRead();
    return super.inactivationDate;
  }

  @override
  set inactivationDate(DateTime? value) {
    _$inactivationDateAtom.reportWrite(value, super.inactivationDate, () {
      super.inactivationDate = value;
    });
  }

  late final _$isDiscountActiveAtom = Atom(
      name: '_RegisterDiscountControllerBase.isDiscountActive',
      context: context);

  @override
  bool get isDiscountActive {
    _$isDiscountActiveAtom.reportRead();
    return super.isDiscountActive;
  }

  @override
  set isDiscountActive(bool value) {
    _$isDiscountActiveAtom.reportWrite(value, super.isDiscountActive, () {
      super.isDiscountActive = value;
    });
  }

  late final _$insertDiscountAsyncAction = AsyncAction(
      '_RegisterDiscountControllerBase.insertDiscount',
      context: context);

  @override
  Future<void> insertDiscount({required DiscountItemModel discountItem}) {
    return _$insertDiscountAsyncAction
        .run(() => super.insertDiscount(discountItem: discountItem));
  }

  late final _$updateDiscountAsyncAction = AsyncAction(
      '_RegisterDiscountControllerBase.updateDiscount',
      context: context);

  @override
  Future<void> updateDiscount({required DiscountItemModel discountItem}) {
    return _$updateDiscountAsyncAction
        .run(() => super.updateDiscount(discountItem: discountItem));
  }

  late final _$getImageGalleryAsyncAction = AsyncAction(
      '_RegisterDiscountControllerBase.getImageGallery',
      context: context);

  @override
  Future getImageGallery() {
    return _$getImageGalleryAsyncAction.run(() => super.getImageGallery());
  }

  late final _$_RegisterDiscountControllerBaseActionController =
      ActionController(
          name: '_RegisterDiscountControllerBase', context: context);

  @override
  double calculatePercentage(
      {double? price, int? percentage, String? discountType}) {
    final _$actionInfo =
        _$_RegisterDiscountControllerBaseActionController.startAction(
            name: '_RegisterDiscountControllerBase.calculatePercentage');
    try {
      return super.calculatePercentage(
          price: price, percentage: percentage, discountType: discountType);
    } finally {
      _$_RegisterDiscountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double subtractNumbers(
      {double? priceOf, double? priceBy, String? discountType}) {
    final _$actionInfo = _$_RegisterDiscountControllerBaseActionController
        .startAction(name: '_RegisterDiscountControllerBase.subtractNumbers');
    try {
      return super.subtractNumbers(
          priceOf: priceOf, priceBy: priceBy, discountType: discountType);
    } finally {
      _$_RegisterDiscountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActivationInactivationDate(
      {String? activation, String? inactivation}) {
    final _$actionInfo =
        _$_RegisterDiscountControllerBaseActionController.startAction(
            name:
                '_RegisterDiscountControllerBase.setActivationInactivationDate');
    try {
      return super.setActivationInactivationDate(
          activation: activation, inactivation: inactivation);
    } finally {
      _$_RegisterDiscountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImageDiscount({String? image, File? imageFile}) {
    final _$actionInfo = _$_RegisterDiscountControllerBaseActionController
        .startAction(name: '_RegisterDiscountControllerBase.setImageDiscount');
    try {
      return super.setImageDiscount(image: image, imageFile: imageFile);
    } finally {
      _$_RegisterDiscountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateFields({required DiscountArgs args}) {
    final _$actionInfo = _$_RegisterDiscountControllerBaseActionController
        .startAction(name: '_RegisterDiscountControllerBase.validateFields');
    try {
      return super.validateFields(args: args);
    } finally {
      _$_RegisterDiscountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveDiscount({required DiscountArgs args}) {
    final _$actionInfo = _$_RegisterDiscountControllerBaseActionController
        .startAction(name: '_RegisterDiscountControllerBase.saveDiscount');
    try {
      return super.saveDiscount(args: args);
    } finally {
      _$_RegisterDiscountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
args: ${args},
imageFile: ${imageFile},
activationDate: ${activationDate},
inactivationDate: ${inactivationDate},
isDiscountActive: ${isDiscountActive}
    ''';
  }
}
