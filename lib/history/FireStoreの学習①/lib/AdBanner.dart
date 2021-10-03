// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// // StatelessWidgetを継承して作成
// class AdBanner extends StatelessWidget {
//   const AdBanner({
//     required this.size, // サイズは利用時に指定
//   });
//   final AdSize size;
//   Widget build(BuildContext context) {
//     final banner = BannerAd(
//         // サイズ
//         size: size,
//         // 広告ID
//         adUnitId: BannerAd.testAdUnitId,
//         // イベントのコールバック
//         listener: AdListener(
//           onAdLoaded: (Ad ad) => print('Ad loaded.'),
//           onAdFailedToLoad: (Ad ad, LoadAdError error) {
//             print('Ad failed to load: $error');
//           },
//           onAdOpened: (Ad ad) => print('Ad opened.'),
//           onAdClosed: (Ad ad) => print('Ad closed.'),
//           onApplicationExit: (Ad ad) => print('Left application.'),
//         ),
//         // リクエストはデフォルトを使う
//         request: AdRequest())
//       // 表示を行うloadをつける
//       ..load();
//
//     // 戻り値はContainerで包んで返す
//     return Container(
//         width: banner.size.width.toDouble(),
//         height: banner.size.height.toDouble(),
//         child: AdWidget(ad: banner));
//   }
//
// // 広告IDをプラットフォームに合わせて取得
//   static String get bannerAdUnitId {
//     if (Platform.isAndroid) {
//       return "XXX";
//     } else if (Platform.isIOS) {
//       return "XXX";
//     } else {
//       //どちらでもない場合は、テスト用を返す
//       return BannerAd.testAdUnitId;
//     }
//   }
// }
