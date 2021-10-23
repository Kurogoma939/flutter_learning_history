import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';
import 'product_row_item.dart';

class ProductListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final products = model.getProducts();
        ///スクロール可能なビュー
        return CustomScrollView(
          semanticChildCount: products.length,
          ///スライド可能なウィジェット
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('All products'),
            ),
            ///スライドするSafeAreaのビューを指定
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                ///delegate 代表、代わりのみたいな意味。どういう。
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        ///リスト長がある分だけ表示、なければnull返す
                    if (index < products.length) {
                      return ProductRowItem(
                        product: products[index],
                        lastItem: index == products.length - 1,
                      );
                    }
                    return null;
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}