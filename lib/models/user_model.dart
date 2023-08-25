class UserModel {
  String id = '';
  String name = '';

  UserModel({
    required this.id,
    required this.name,
  });

  bool get isEmpty => id.isEmpty;

  UserModel.empty();
}

UserModel currentUser = UserModel.empty();
