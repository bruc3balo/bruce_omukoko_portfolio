String? emailValidationError(String? email) {
  if (email == null || email.isEmpty) return "Email address required";

  bool valid = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  ).hasMatch(email);

  if (!valid) return "Invalid email address";

  return null;
}

String? emailValidationErrorNotRequired(String? email) {
  if (email == null || email.isEmpty) return null;
  return emailValidationError(email);
}
