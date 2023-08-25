import 'app_database.dart';

class UsrModel
{
  String? email;
  String? phone;
  String? password;
  UsrModel({this.email,this.phone,this.password});

  factory UsrModel.fromMap(Map<String,dynamic> map)
  {
    return UsrModel(
      email: map[AppDatabase.USER_COLUMN_EMAIL],
      phone:  map[AppDatabase.USER_COLUMN_PHONE],
      password: map[AppDatabase.USER_COLUMN_PASSWORD],
    );
  }

  Map<String,dynamic> toMap()
  {
    return {
      AppDatabase.USER_COLUMN_EMAIL:email,
      AppDatabase.USER_COLUMN_PHONE:phone,
      AppDatabase.USER_COLUMN_PASSWORD:password
    };
  }
}