VerifyAccountResponse verifyAccountResponseModelFromJson(
        Map<String, dynamic> json) =>
    VerifyAccountResponse.fromJson(json);

class VerifyAccountResponse {
  final String status;
  final User user;
  final String token;

  VerifyAccountResponse({
    required this.status,
    required this.user,
    required this.token,
  });
  factory VerifyAccountResponse.empty({required status}) =>
      VerifyAccountResponse(
          token: "",
          status: status,
          user: User(
              id: "",
              name: "",
              email: "",
              password: "",
              createdAt: "",
              authenticated: false,
              passwordChangedAt: "",
              v: 0));

  factory VerifyAccountResponse.fromJson(Map<String, dynamic> json) =>
      VerifyAccountResponse(
        status: json["status"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );
}

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String createdAt;
  final bool authenticated;
  final String passwordChangedAt;
  final int v;

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
