// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetchData.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FetchData on _FetchData, Store {
  late final _$productDataAtom =
      Atom(name: '_FetchData.productData', context: context);

  @override
  ProductModel? get productData {
    _$productDataAtom.reportRead();
    return super.productData;
  }

  @override
  set productData(ProductModel? value) {
    _$productDataAtom.reportWrite(value, super.productData, () {
      super.productData = value;
    });
  }

  late final _$cartProductAtom =
      Atom(name: '_FetchData.cartProduct', context: context);

  @override
  List<Products> get cartProduct {
    _$cartProductAtom.reportRead();
    return super.cartProduct;
  }

  @override
  set cartProduct(List<Products> value) {
    _$cartProductAtom.reportWrite(value, super.cartProduct, () {
      super.cartProduct = value;
    });
  }

  late final _$cartLengthAtom =
      Atom(name: '_FetchData.cartLength', context: context);

  @override
  int get cartLength {
    _$cartLengthAtom.reportRead();
    return super.cartLength;
  }

  @override
  set cartLength(int value) {
    _$cartLengthAtom.reportWrite(value, super.cartLength, () {
      super.cartLength = value;
    });
  }

  late final _$totalAtom = Atom(name: '_FetchData.total', context: context);

  @override
  int get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$getProductDataAsyncAction =
      AsyncAction('_FetchData.getProductData', context: context);

  @override
  Future<void> getProductData() {
    return _$getProductDataAsyncAction.run(() => super.getProductData());
  }

  late final _$_FetchDataActionController =
      ActionController(name: '_FetchData', context: context);

  @override
  void addToCart(Products product) {
    final _$actionInfo =
        _$_FetchDataActionController.startAction(name: '_FetchData.addToCart');
    try {
      return super.addToCart(product);
    } finally {
      _$_FetchDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart(Products product) {
    final _$actionInfo = _$_FetchDataActionController.startAction(
        name: '_FetchData.removeFromCart');
    try {
      return super.removeFromCart(product);
    } finally {
      _$_FetchDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productData: ${productData},
cartProduct: ${cartProduct},
cartLength: ${cartLength},
total: ${total}
    ''';
  }
}
