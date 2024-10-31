import 'dart:io';
import 'package:console_shop/Product.dart';

class ShoppingMall {
  List<Product> productList = [];
  int totalPrice = 0;

  /// 상품 목록 출력
  showProducts(List<Product> productList) {
    for (Product p in productList) {
      stdout.writeln('${p.productName} / ${p.productPrice}');
    }
  }

  /// 상품을 장바구니에 추가
  addToCart() {}

  /// 장바구니에 담긴 상품의 상품 가격의 총 합
  showTotalPrice() {}
}
