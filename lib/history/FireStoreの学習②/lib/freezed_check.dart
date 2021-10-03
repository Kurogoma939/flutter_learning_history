// void func() {
//   // ユーザを3つ作成する。user1とuser3は同じ内容
//   User user1 = User('kazutxt', 30);
//   User user2 = User('kazutxt2', 32);
//   User user3 = User('kazutxt', 30);
//
//   // 表示(toString)
//   print("check1");
//   print(user1);
//
//   // 比較(==)
//   print("check2");
//   if (user1 == user2) print("user1とuser2は同じ人");
//   if (user1 == user3) print("user1とuser3は同じ人");
//
//   // コピーをして新しいインスタンスを作成(user1は変わらない)
//   print("check3");
//   User user4 = user1.copyWith(name: "unknown");
//   print(user1);
//   print(user4);
//
//   // 参照そのものを変えるのはOK
//   print("check4");
//   user2 = user3;
//   print(user2);
//
//   // immutableを破壊するので、以下のような使い方はNG
//   // user1.name = "unknown";
// }
