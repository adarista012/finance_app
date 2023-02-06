bool isValidName(String text) {
  return RegExp(r"^[a-zA-Z]+$").hasMatch(text);
}
