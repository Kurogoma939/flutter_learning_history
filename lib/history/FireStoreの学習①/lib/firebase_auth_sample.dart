//（エラー出るのでコードはコメントアウト）

///  メールアドレスを使った登録
// final User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
// email: email, password: password)).user;

///  ログイン認証
// User user = (await FirebaseAuth.instance.signInWithEmailAndPassword((
//  email: email, password: password)).user;

///再設定メールについて
///firebaseコンソール => Authentication => Templateから作成
// await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

///認証エラーについて（バリデーション）
// try{
//   ' ログイン認証,登録処理'
// }catch(e){
//     Flusher(
//       message:e.toString().replaceAll(RegExp(r'\[.*\]'), ''),
//       flusherPosition: FlusherPosition.TOP,
//       backgroundColor: Colors.deepOrangeAccent,
//       margin: EdgeInsets.all(8),
//       borderRadius: 8,
//       duration: Duration(seconds: 5),
//       )..show(context);
// }
