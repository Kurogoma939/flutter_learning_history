//上部検索バーの部分

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'styles.dart';

//バーの表記は固定なので、StatelessでOK
class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.controller,
    required this.focusNode,
  });

  //文字入力だけ行うのでTextEditingController
  final TextEditingController controller;
  //フォーカルされてるかの確認をするのでFocusNode
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      //検索窓のスタイル
      decoration: BoxDecoration(
        color: Styles.searchBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      //上下左右のpadding
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        //要素の横並び
        child: Row(
          //アイコン
          children: [
            const Icon(
              CupertinoIcons.search,
              color: Styles.searchIconColor,
            ),
            //検索バー
            Expanded(
              child: CupertinoTextField(
                controller: controller,
                focusNode: focusNode,
                style: Styles.searchText,
                cursorColor: Styles.searchCursorColor,
                decoration: null,
              ),
            ),
            //カーソルを合わせたときの動作？
            GestureDetector(
              onTap: controller.clear,
              child: const Icon(
                CupertinoIcons.clear_thick_circled,
                color: Styles.searchIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}