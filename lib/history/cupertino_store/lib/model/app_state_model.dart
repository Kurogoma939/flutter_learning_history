// 商品がカートにあるかどうかを管理する


import 'package:flutter/foundation.dart' as foundation;

import 'product.dart';
import 'products_repository.dart';

///　消費税の設定
double _salesTaxRate = 0.06;
///カートの最大個数の設定
double _shippingCostPerItem = 7;

class AppStateModel extends foundation.ChangeNotifier {
  /// 商品リストの定義
  List<Product> _availableProducts = [];

  /// 選択したカテゴリー
  Category _selectedCategory = Category.all;

  /// カートにある商品のIDと個数の定義
  final _productsInCart = <int, int>{};

  Map<int, int> get productsInCart {
    return Map.from(_productsInCart);
  }

  /// 商品個数の合計値
  int get totalCartQuantity {
    return _productsInCart.values.fold(0, (accumulator, value) {
      return accumulator + value;
    });
  }
  ///選択されたカテゴリー
  Category get selectedCategory {
    return _selectedCategory;
  }

  ///小計価格の取得（税込前）
  double get subtotalCost {
    return _productsInCart.keys.map((id) {
      /// 商品個数 * 単価
      return getProductById(id).price * _productsInCart[id]!;
    }).fold(0, (accumulator, extendedPrice) {
      return accumulator + extendedPrice;
    });
  }

  /// 価格の表示（合計：税なし）
  double get shippingCost {
    return _shippingCostPerItem *
        _productsInCart.values.fold(0.0, (accumulator, itemCount) {
          return accumulator + itemCount;
        });
  }

  /// 税込分の表示
  double get tax {
    return subtotalCost * _salesTaxRate;
  }

  /// 合計金額（単価＋税）
  double get totalCost {
    return subtotalCost + shippingCost + tax;
  }

  /// カテゴリーリストを返してる？？
  List<Product> getProducts() {
    if (_selectedCategory == Category.all) {
      return List.from(_availableProducts);
    } else {
      return _availableProducts.where((p) {
        return p.category == _selectedCategory;
      }).toList();
    }
  }

  /// 検索処理のロジック
  /// 検索結果の一覧を表示
  List<Product> search(String searchTerms) {
    return getProducts().where((product) {
      return product.name.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }

  ///一覧からカートに商品を追加するロジック
  void addProductToCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId] = _productsInCart[productId]! + 1;
    }
    ///notifyListenersでデータが変わったことを通知する
    ///ChangeNotifierProviderで変更後の値を受け取りビューを変化させる
    notifyListeners();
  }

  /// カートから商品を削除するロジック
  void removeItemFromCart(int productId) {
    if (_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        _productsInCart[productId] = _productsInCart[productId]! - 1;
      }
    }
    ///notifyListenersでデータが変わったことを通知する
    ///ChangeNotifierProviderで変更後の値を受け取りビューを変化させる
    notifyListeners();
  }

  /// IDと一致する商品を取得
  Product getProductById(int id) {
    return _availableProducts.firstWhere((p) => p.id == id);
  }

  /// カート前削除
  void clearCart() {
    _productsInCart.clear();
    notifyListeners();
  }

  /// Availableな商品リストを取得する
  void loadProducts() {
    _availableProducts = ProductsRepository.loadProducts(Category.all);
    notifyListeners();
  }

  ///カテゴリーの指定
  void setCategory(Category newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }
}