//パッケージのインポート
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

// Styleを統一するための抽象クラス
abstract class Styles {
  //商品リスト1つのスタイル
  static const TextStyle productRowItemName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  //商品の合計表示のスタイル
  static const TextStyle productRowTotal = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  //商品価格のスタイル
  static const TextStyle productRowItemPrice = TextStyle(
    color: Color(0xFF8E8E93),
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );

  //検索バーの文字スタイル
  static const TextStyle searchText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  //Deliver timeの入力エリアの設定
  static const TextStyle deliveryTimeLabel = TextStyle(
    color: Color(0xFFC2C2C2),
    fontWeight: FontWeight.w300,
  );

  //Deliver timeをセレクトで選べるような設定。Cupertinoのやつ
  static const TextStyle deliveryTime = TextStyle(
    //Cupertino特有のスタイル。
    color: CupertinoColors.inactiveGray,
  );

  //商品リストの区切り線のスタイル
  static const Color productRowDivider = Color(0xFFD9D9D9);
  //Scaffold（足場)=全体のベースとなる背景のスタイル
  static const Color scaffoldBackground = Color(0xfff0f0f0);
  //検索エリアの背景色の設定（グレーに）
  static const Color searchBackground = Color(0xffe0e0e0);
  //フォームに入力するときのバーの色のスタイル「|」
  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);
  //「🔍」の色
  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);
}