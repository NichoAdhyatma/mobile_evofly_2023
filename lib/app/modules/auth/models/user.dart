class UserModel {
  String uid;
  String name;
  String email;
  String status;
  bool isMentor;

  UserModel.fromJson(dynamic json)
      : uid = json['uid'],
        name = json['name'],
        email = json['email'],
        status = json['status'],
        isMentor = json['isMentor'];
}
