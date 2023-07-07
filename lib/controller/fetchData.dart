import 'package:hyperlink_task/helper/product_api.dart';
import 'package:hyperlink_task/model/product_model.dart';
import 'package:mobx/mobx.dart';

part 'fetchData.g.dart';

class FetchData = _FetchData with _$FetchData;

abstract class _FetchData with Store {
  @observable
  ProductModel? productData;

  @observable
  List<Products> cartProduct = [];

  @observable
  int cartLength = 0;

  @observable
  int total = 0;

  @action
  Future<void> getProductData() async {
    productData = await ProductApi().fetchData();
    print(productData);
  }

  @action
  void addToCart(Products product) {
    cartProduct.add(product);
    total = total + product.price!;
    cartLength++;
  }

  @action
  void removeFromCart(Products product) {
    cartProduct.remove(product);
total = total - product.price!;
cartLength--;
  }

}
