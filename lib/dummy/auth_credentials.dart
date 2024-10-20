class AuthService {
  // Data dummy untuk validasi login
  static const String validEmail = 'user@mail.com';
  static const String validPassword = 'pass123';

  // Fungsi untuk mengecek kredensial
  static bool login(String email, String password) {
    return email == validEmail && password == validPassword;
  }
}
