// ignore_for_file: non_constant_identifier_names

import 'app_database.dart';

class UsrLoginModel {
  String? first_name;
  String? last_name;
  String? email;
  String? phone;
  String? password;
  UsrLoginModel(
      {this.first_name, this.last_name, this.email, this.phone, this.password});

  factory UsrLoginModel.fromMap(Map<String, dynamic> map) {
    return UsrLoginModel(
      first_name: map[AppDatabase.FIRST_NAME],
      last_name: map[AppDatabase.LAST_NAME],
      email: map[AppDatabase.USER_COLUMN_EMAIL],
      phone: map[AppDatabase.USER_COLUMN_PHONE],
      password: map[AppDatabase.USER_COLUMN_PASSWORD],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      AppDatabase.FIRST_NAME:first_name,
      AppDatabase.LAST_NAME:last_name,
      AppDatabase.USER_COLUMN_EMAIL: email,
      AppDatabase.USER_COLUMN_PHONE: phone,
      AppDatabase.USER_COLUMN_PASSWORD: password
    };
  }
}
