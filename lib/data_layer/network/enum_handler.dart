// ignore_for_file: constant_identifier_names

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400; // failure , Api rejected request
  static const int UNAUTHORIZED = 401; // failure , user is unauthorized
  static const int FORBIDDEN = 403;
  static const int INTERNAL_SERVER_ERROR = 500;

// local
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int UnKNOWN = -7;
}

class ResponseMessage {
  static const String SUCCESS = "Sucess!";
  static const String NO_CONTENT = "Sucess!";
  static const String BAD_REQUEST = "Bad request";
  static const String UNAUTHORIZED = "User is unauthorized";
  static const String FORBIDDEN = "Forbidden request";
  static const String INTERNAL_SERVER_ERROR = "Something went wrong";

// local
  static const String CONNECT_TIMEOUT = "Connect time out";
  static const String CANCEL = "Request was cancelled";
  static const String RECIEVE_TIMEOUT = "Recieve time out";
  static const String SEND_TIMEOUT = "Send time out";
  static const String CACHE_ERROR = "Cache error";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";
  static const String UnKNOWN = "Something went wrong";
}
