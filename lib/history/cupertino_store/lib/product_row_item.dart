import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';
import 'model/product.dart';
import 'styles.dart';

///ユーザーのアクションで変動しないのでStateless
class ProductRowItem extends StatelessWidget {
  const ProductRowItem({
    required this.product,
    required this.lastItem,
  });

  ///必須項目requiredとセット
  final Product product;
  final bool lastItem;

  ///ウィジェット（フロント）の作成
  @override
  Widget build(BuildContext context) {
    //SafeArea範囲を指定（テンプレ？）
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
        right: 8,
      ),
      child: Row(
        children: <Widget>[
          ///コンテンツを角丸にするとき使う
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.cover,
              width: 76,
              height: 76,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: Styles.productRowItemName,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    //priceを$表記にする
                    '\$${product.price}',
                    style: Styles.productRowItemPrice,
                  )
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            ///ボタン押下した時のアクション
            onPressed: () {
              final model = Provider.of<AppStateModel>(context, listen: false);
              ///カートに追加するアクション
              model.addProductToCart(product.id);
            },
            child: const Icon(
              CupertinoIcons.plus_circled,
              //ラベル？？
              semanticLabel: 'Add',
            ),
          ),
        ],
      ),
    );

    ///リストで最後の要素だった場合の処理
    if (lastItem) {
      //SafeAreaが格納されている
      return row;
    }
    ///elseだった場合の処理＜追加検索＞
    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: Styles.productRowDivider,
          ),
        ),
      ],
    );
  }
}