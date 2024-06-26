import 'package:bookipedia/main.dart';

class ApiEndpoints {
  static const String appBaseUrl = "https://bookipedia-backend.onrender.com";
  static const String signUpEndPoint = "/auth/signup";
  static const String verifyAccountEndPoint = "/auth/confirm-your-account";
  static const String loginEndPoint = "/auth/login";
  static const String forgotPasswordEndPoint = "/auth/forget-password";
  static const String resetPasswordEndPoint = "/auth/reset-password";
  static const String changeEmailEndPoint = "/auth/change-email";
  static const String resetEmailEndPoint = "/auth/change-email";
  static const String updateUserDataEndPoint = "/auth/update-user-data";
  static const String updatePasswordEndPoint = "/auth/update-password";
  static const String resendVerificationEmailEndPoint =
      "/auth/resend-verification-email";
  static const String getAllBooks = "/book";
  static const String addDocument = "/document";
  static const String getAllUserDocuments = "/document";
  static const String deleteDocument = "/document/";
  static const String getDocumentFile = "/document/file/";
}

class ApiHeaders {
  static Map<String, dynamic> tokenHeader = {
    'Authorization': 'Bearer ${preferences.get('token')}'
  };
}
