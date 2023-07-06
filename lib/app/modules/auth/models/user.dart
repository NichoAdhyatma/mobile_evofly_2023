class UserModel {
  String uid;
  String name;
  String email;

  UserModel.fromJson(dynamic json)
      : uid = json['uid'],
        name = json['name'],
        email = json['email'];
}
