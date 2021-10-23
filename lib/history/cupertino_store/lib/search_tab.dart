import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

/**
 * 検索タブの表示に必要なものをインポート
 * ・全体のバックエンドを管理する？app_state_model.dart
 * ・商品部分のパーツ
 * ・上部の検索バー
 * ・スタイルシート
 */
import 'model/app_state_model.dart';
import 'product_row_item.dart';
import 'search_bar.dart';
import 'styles.dart';

//ユーザーのアクションによって変化するのでStatefulにする。
//中身はほぼテンプレート
class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() {
    return _SearchTabState();
  }
}
//Statefulウィジェットには必ず対応するようなStateクラスを作成
class _SearchTabState extends State<SearchTab> {
  //処理をするコントローラーの定義　この辺もモデルには必須
  late final TextEditingController _controller;
  //Text（インプット）フィールドにフォーカスが当たっているかの判別(focusNode）
  //Inputには必須属性
  late final FocusNode _focusNode;
  //項目指定？
  String _terms = '';

  //初期ステートの設定
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  //ステートが不要になった時（カーソル外れたり対象外になった時）用（必須かな）
  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  //インプットエリアの入力値の変化に合わせた処理（必須）
  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  //Widgetなのでフロント部分。
  //Searchタブは上に検索部分があるのでそれのウィジェット
  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  //全体のビューの描画（Productsページと同じ部分）
  @override
  Widget build(BuildContext context) {
    //全体を管理するAppStateModelを取得
    final model = Provider.of<AppStateModel>(context);
    //ここわからん？？？
    final results = model.search(_terms);
    //表示範囲のスタイル設定したりビューを書いている
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Styles.scaffoldBackground,
      ),
      //SafeArea：上下のカメラやボタンを避けた、共通してレイアウトを描画できる範囲に画面を出す。
      child: SafeArea(
        child: Column(
          children: [
            _buildSearchBox(),
            //商品リストの表示
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ProductRowItem(
                  product: results[index],
                  lastItem: index == results.length - 1,
                ),
                itemCount: results.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}