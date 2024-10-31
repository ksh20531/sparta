import 'dart:io';
import 'package:console_shop/Product.dart';
import 'package:console_shop/ShoppingMall.dart';

void main(List<String> arguments) {
  Product shirt = Product('셔츠', 45000);
  Product onepice = Product('원피스', 30000);
  Product tShirt = Product('반팔티', 35000);
  Product short = Product('반바지', 38000);
  Product socks = Product('양말', 5000);
  List<Product> productList = [shirt, onepice, tShirt, short, socks];

  ShoppingMall shoppingMall = ShoppingMall();

  while (true) {
    stdout.writeln(
        '-----------------------------------------------------------------------------------');
    stdout.writeln(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    stdout.writeln(
        '-----------------------------------------------------------------------------------');

    try {
      int selectedMenu = int.parse(stdin.readLineSync()!);
      switch (selectedMenu) {
        case 1:
          shoppingMall.showProducts(productList);
          break;
        case 2:
          shoppingMall.addToCart(productList);
          break;
        case 3:
          shoppingMall.showTotalPrice();
          break;
        case 4:
          stdout.writeln("정말 종료하시겠습니까?");
          if (int.parse(stdin.readLineSync()!) == 5) {
            stdout.writeln("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
            return;
          } else {
            stdout.writeln("종료하지 않습니다.");
          }
          break;
        case 6:
          shoppingMall.clearCart();
          break;
        default:
          stdout.writeln("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
          break;
      }
    } catch (e) {
      stdout.writeln("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
      continue;
    }
  }
}
