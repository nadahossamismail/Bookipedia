SignUpResponse signUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse.fromJson(json);

class SignUpResponse {
  final String status;
  final String message;

  SignUpResponse({
    required this.status,
    required this.message,
  });

  factory SignUpResponse.empty() => SignUpResponse(
        status: "faliure",
        message: "something went wrong",
      );

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"],
        message: json["message"],
      );
}
