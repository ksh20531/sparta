import 'dart:io';
import 'package:console_shop/Product.dart';

class ShoppingMall {
  int totalPrice = 0; // 장바구니 상품 총 가격
  List<Product> productList = []; // 상품 목록
  Set<String> selectedProductList = {}; // 장바구니에 담긴 상품 목록

  ShoppingMall(this.productList);

  /// 상품 목록 출력
  showProducts() {
    for (Product p in productList) {
      stdout.writeln('${p.productName} / ${p.productPrice}원');
    }
  }

  /// 상품을 장바구니에 추가
  addToCart() {
    try {
      int selectedProductPrice = 0; // 선택한 상품의 가격

      // 상품 선택
      stdout.writeln('상품 이름을 입력해 주세요 !');
      String? inputProductName = stdin.readLineSync()!;

      // 선택한 상품을 장바구니에 추가하고, totalPrice 값 증가
      Product selectedProduct = productList.firstWhere(
        (product) => product.productName == inputProductName,
        orElse: () => throw Exception("입력 값이 올바르지 않아요 !"),
      );

      selectedProductPrice = selectedProduct.productPrice;
      selectedProductList.add(selectedProduct.productName);

      // 상품 갯수 입력
      stdout.writeln('상품 개수를 입력해 주세요 !');
      String? stringCnt = stdin.readLineSync()!;
      int quantity = int.parse(stringCnt);

      if (quantity == 0) {
        throw Exception('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      }

      totalPrice += selectedProductPrice * quantity;

      stdout.writeln('장바구니에 상품이 담겼어요 !');
    } catch (e) {
      stdout.writeln('입력 값이 올바르지 않아요 !');
    }
  }

  /// 장바구니에 담긴 상품의 상품 가격의 총 합
  showTotalPrice() {
    String cartProducts = selectedProductList.reduce((c, n) => '$c, $n');
    stdout.writeln('장바구니에 $cartProducts가 담겨있네요. 총 $totalPrice원 입니다!');
  }

  /// 장바구니 초기화
  clearCart() {
    if (totalPrice > 0) {
      stdout.writeln('장바구니를 초기화합니다.');
      totalPrice = 0;
      selectedProductList = {};
    } else {
      stdout.writeln('이미 장바구니가 비었습니다.');
    }
  }
}
