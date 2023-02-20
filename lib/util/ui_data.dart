class UIData {
  //Image path
  static const imageDir = 'assets/images';
  static const bg_login = '$imageDir/bg_login.jpg';
  static const bg_register = '$imageDir/bg_register.jpg';

  //Route
  static const route_home = '/home';
  static const route_login = '/login';
  static const route_register = '/register';

  //Text
  static const txt_login = 'Login';
  static const txt_register = 'Register';
  static const txt_username = 'Username';
  static const txt_email = 'Email';
  static const txt_pwd = 'Password';
  static const txt_confirm_pwd = 'Confirm Password';
  static const txt_forgot_pwd = 'Forgot password?';
  static const txt_no_account = 'No account? ';
  static const txt_has_account = 'Got an account? ';
  static const txt_regiser_now = 'Register now!';
  static const txt_login_now = 'Login now!';

  //Error Messages
  static const empty_username_err = "Username can't be blank!";
  static const empty_pwd_err = "Please enter your password!";
  static const empty_confirm_pwd_err = "Please confirm your password!";
  static const wrong_confirm_pwd_err = "Password doesn't match!";
  static const empty_email_err = "Please enter your email!";
  static const wrong_email_format_err = "Invalid email address format!";
}
