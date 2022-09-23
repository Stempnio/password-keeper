class Credentials {
  late String websiteURL;
  late String login;
  late String passwordHash;

  Credentials(
      {required this.websiteURL,
      required this.login,
      required this.passwordHash});
}
