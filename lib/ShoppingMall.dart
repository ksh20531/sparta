import 'dart:io';
import 'package:console_shop/Product.dart';

class ShoppingMall {
  List<Product> productList = [];
  int totalPrice = 0;

  /// 상품 목록 출력
  showProducts(List<Product> productList) {
    for (Product p in productList) {
      stdout.writeln('${p.productName} / ${p.productPrice}원');
    }
  }

  /// 상품을 장바구니에 추가
  addToCart(List<Product> productList) {
    try {
      int selectedProductPrice = 0;

      stdout.writeln('상품 이름을 입력해 주세요 !');
      String? productName = stdin.readLineSync()!;
      bool isProduct = false;

      for (int i = 0; i < productList.length; i++) {
        if (productList[i].productName == productName) {
          selectedProductPrice = productList[i].productPrice;
          isProduct = true;
          break;
        }
      }

      if (!isProduct) {
        throw Exception();
      }

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
    stdout.writeln('장바구니에 $totalPrice원 어치를 담으셨네요 !');
  }

  /// 카트 초기화
  clearCart() {
    if (totalPrice > 0) {
      stdout.writeln('장바구니를 초기화합니다.');
      totalPrice = 0;
    } else {
      stdout.writeln('이미 장바구니가 비었습니다.');
    }
  }
}
