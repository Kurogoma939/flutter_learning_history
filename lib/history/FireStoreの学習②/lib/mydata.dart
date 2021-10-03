import 'package:riverpod/riverpod.dart';

//StateNotifierで状態変化を監視する。型はジェネリクスで定義
class MyData extends StateNotifier<double> {
  MyData() : super(0.5);
  void changState(newState) => this.state = newState;
}