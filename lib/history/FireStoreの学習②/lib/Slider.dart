// import 'package:flutter/material.dart';
// import 'mydata.dart';
// import 'package:provider/provider.dart';
//
// class MySlider extends StatefulWidget {
//   @override
//   createState() => _MySliderState();
// }
// class _MySliderState extends State<MySlider> {
//   @override
//   Widget build(BuildContext context) {
//     return Slider(
//         // value: mydata.value, onChanged: (value) => mydata.value = value);
//         value: context.select((MyData mydata) => mydata.value),
//         onChanged: (value) => context.read<MyData>().value = value
//     );
//   }
// }