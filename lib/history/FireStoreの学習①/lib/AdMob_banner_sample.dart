// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// import 'AdBanner.dart';
//
// void main() {
//   //初期化
//   WidgetsFlutterBinding.ensureInitialized();
//   MobileAds.instance.initialize();
//   runApp(MyApp());
// }
//
// class MyClass {
//   // バナー用の変数
//   BannerAd? myBanner;
//
//   @override
//   void initState() {
//     // 初期化
//     FirebaseAdMob.instance.initialize(appId: AdManager.appId);
//     // インスタンスの作成
//     myBanner = BannerAd(
//       //adUnitId: BannerAd.testAdUnitId, // テスト用
//       adUnitId: AdManager.bannerAdUnitId, // 本番用
//       size: AdSize.smartBanner, // 目的のサイズに合わせる
//       listener: (MobileAdEvent event) {
//         print("BannerAd event is $event");
//       },
//       request: null,
//     );
//     // 表示
//     myBanner!
//       ..load()
//       ..show(anchorType: AnchorType.bottom);
//     // その他のinitstate
//   }
//
//   @override
//   void dispose() {
//     // 廃棄
//     myBanner?.dispose();
//     // その他のdispose
//   }
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   //中略
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // カウンタの偶奇で表示を切り替えて、バナーを表示(今回はラージサイズ)
//             if (_counter % 2 != 0) AdBanner(size: AdSize.largeBanner),
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
