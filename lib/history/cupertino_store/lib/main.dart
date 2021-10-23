// cupertinoという便利機能を入れる。
//外部パッケージのインポート
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

//外部ファイル（テンプレート）の読み込み
import 'app.dart';
import 'model/app_state_model.dart';

//Flutterには必須
void main() {
  return runApp(
    //状態変化を検知し、モデルを切り替えるもの
    ChangeNotifierProvider<AppStateModel>(
      //providerの書き方
      //app_state_model.dartを呼び出している
      create: (context) => AppStateModel()..loadProducts(),
      //app.dart（別のベースファイル）にあるクラスを呼び出す。
      child: CupertinoStoreApp(),
    ),
  );
}

/**
 * 全体処理として、
 * フロントエンドのページファイル
 * バックエンドとなるモデルファイルを呼び出している
 */

