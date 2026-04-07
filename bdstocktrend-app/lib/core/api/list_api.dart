class ListAPI {
  ListAPI._();

  static const String register = "/api/auth/register";
  static const String login = "/api/auth/login";
  static const String users = "/api/users";

  static const String dashboard = "/api/dashboard-statistics";
  static const String companies = "/api/companies";

  static const String companyDetails = "/api/companies/{id}";

  static const String updateProfile = "/api/users/profile";
  static const String changePassword = "/api/auth/change-password";
}
