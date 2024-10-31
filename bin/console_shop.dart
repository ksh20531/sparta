import 'dart:io';

void main(List<String> arguments) {
  List<int> menus = [1, 2, 3, 4];

  while (true) {
    stdout.writeln(
        '-----------------------------------------------------------------------------------');
    stdout.writeln(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    stdout.writeln(
        '-----------------------------------------------------------------------------------');

    try {
      int selectedMenu = int.parse(stdin.readLineSync()!);
      if (selectedMenu != 4 && menus.contains(selectedMenu)) {
        stdout.writeln('선택한 메뉴 : $selectedMenu');
      } else if (selectedMenu == 4) {
        stdout.writeln("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
        break;
      }
    } catch (e) {
      continue;
    }
  }
}
