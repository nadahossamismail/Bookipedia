ResendVerificationResponse resendVerificationResponseFromJson(
        Map<String, dynamic> json) =>
    ResendVerificationResponse.fromJson(json);

class ResendVerificationResponse {
  final String status;
  final String message;

  ResendVerificationResponse({
    required this.status,
    required this.message,
  });
  factory ResendVerificationResponse.empty() =>
      ResendVerificationResponse(status: "failure", message: "");

  factory ResendVerificationResponse.fromJson(Map<String, dynamic> json) =>
      ResendVerificationResponse(
        status: json["status"],
        message: json["message"],
      );
}
