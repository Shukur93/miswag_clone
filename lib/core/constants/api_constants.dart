class ApiConstants {
  // *-*-*-*-*-*-*- BASE 'URL' *-*-*-*-*-*-*-
  // static const String apiBaseUrl = "http://10.0.0.206:5119/";
  static const String apiBaseUrl = "https://ma.tabadul.iq:5144/";
  //
  // *-*-*- SUB *-*-*-
  //
  //

  static const String login = "api/account/login";
  static const String register = "api/Account/Registeration";
  static const String verifyOtp = "api/account/VerifyOtp";
  static const String resendOtp = "api/account/ResendOtp";
  static const String forgetPassword = "api/account/ForgotPassword";
  static const String verifyForgetPassword =
      "api/account/VerifyForgotPasswordOtp";
  static const String confirmChangeForgetPassword =
      "api/account/ChangeForgotPassword";
  static const String resendOtpOnForgetPassword =
      "api/account/ResendForgotPasswordOtp";

  // Voucher
  static const String getProfile = "api/Profile/ GetProfile";
  static const String homePageData = "api/Voucher/GetHomePageData";
  static const String getItems = "api/Voucher/GetItems";
  static const String getCategories = 'api/Voucher/GetCategories';
  static const String getProviders = "api/Voucher/GetProviders";

  // Profile
  static const String editProfile = "api/profile/EditProfile";
  static const String changePassword = "api/profile/ChangePassword";
  static const String verifyPhoneOtpOnEditProfile =
      "api/profile/VerifyPhoneOtp";
  static const String resendOtpOnEditProfile =
      "api/profile/ResendEditProfileOtp";
  static const String deleteProfile = "api/Profile/DeleteProfile";

// Order
  static const String getOrders = "api/Order/GetOrders";
  static const String getOrder = "api/Order/GetOrder";
  static const String addOrder = "api/Order/AddOrder";
  static const String orderPaymentResult = "api/Order/OrderPaymentResult";

//
//
}
