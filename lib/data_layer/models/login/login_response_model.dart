LoginResponse loginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse.fromJson(json);

class LoginResponse {
  final String status;
  final User user;
  final String token;

  LoginResponse({
    required this.status,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  factory LoginResponse.empty(
          {status = "Please check your internet connection"}) =>
      LoginResponse(
        status: status,
        user: User(
            id: "",
            name: "",
            email: "",
            createdAt: "",
            password: "",
            passwordChangedAt: "",
            v: 0,
            authenticated: false),
        token: "",
      );
}

class User {
  final String id;
  final String? name;
  final String email;
  final String? password;
  final String? createdAt;
  final bool authenticated;
  final String? passwordChangedAt;
  final int? v;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.authenticated,
    required this.passwordChangedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        createdAt: json["createdAt"],
        authenticated: json["authenticated"],
        passwordChangedAt: json["passwordChangedAt"],
        v: json["__v"],
      );
}
