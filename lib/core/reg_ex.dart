class RegEx {
  static final regphone = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
 static final RegExp regpassword = RegExp(
  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]{8,}$'
);
}

