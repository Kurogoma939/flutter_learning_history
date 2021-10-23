///定数をまとめて列挙するenum
enum Category {
  all,
  accessories,
  clothing,
  home,
}

/// パラメーターの必須項目を指定
class Product {
  const Product({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.price,
  });

  /// インスタンス生成・定数指定。
  /// いろんな定義後に定数定義することが多い？
  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final int price;

  ///Cupertinoからサンプル取得するためのもの
  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  ///継承した抽象クラス(abstract)のメソッドを使うとき必須になる@overrideアノテーション
  @override
  String toString() => '$name (id=$id)';
}