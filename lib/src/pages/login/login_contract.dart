

enum SocialLoginType {
  GOOGLE,
}

class LoginRouteArguments {
  final String name;
  final dynamic arguments;
  final int? id;
  final bool preventDuplicates;
  final Map<String, String>? parameters;

  LoginRouteArguments(this.name, {this.arguments, this.id, this.preventDuplicates = true, this.parameters});
}