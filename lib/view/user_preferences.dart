import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1_0/models/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Sarah Abs',
    email: 'sarah.abs@gmail.com',
    about:
        'I earned my bachelors degree in biology from USP and an MS in environmental science and policy at the University of Chicago. Before coming to the University of The South Pacific, I spent time working on environmental and clean energy issues both in the government and nonprofit sectors.',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
