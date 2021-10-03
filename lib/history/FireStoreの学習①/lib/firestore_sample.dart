///firestoreのサンプルコード

///通常のアクセス（Read）
// FirebaseFirestore.instance
//     .collection('testCollection1')
//     .doc('testDocument1')
//     .get()
//     .then((ref){
//       print(ref.get('testField1'));
// })

///サブコレクションにアクセス（Read）
// FirebaseFirestore.instance
//     .doc('testCollection1/testDocument1/testSubCollection1/testSubDocument1')
//     .get()
//     .then((ref){
//       print(ref.get('testSubField1'));
// })

///追加（Create）・更新（Read）
// FirebaseFirestore.instance
//     .doc('autoCollection1/autoDocument1')
//     .set({'autofield: "abcd'});

/// ドキュメントIDを指定しない方法
// FirebaseFirestore.instance
//     .collection('testCollection1')
//     .set({'autofield: "xyz'});
// ※前のデータを消したくなければmergeをすると良い

///削除
// FirebaseFirestore.instance
//     .doc('autoCollection1/autoDocument1')
//     .delete();

///バラバラで参照する方法（先に対象だけ指定 => あとで絞り込み）
// 先に取得
// CollectionReference collection = FirebaseFirestore.instance
//     .collection('testCollection1');

// あとで絞り込み
// DocumentReference document = FirebaseFirestore.instance
//     .collection('testCollection1')
//     .doc('testDocument1');
