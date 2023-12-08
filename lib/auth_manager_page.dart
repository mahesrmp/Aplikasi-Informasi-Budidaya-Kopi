class AuthManager {
  static int?
      userId; // Gunakan nullable int untuk menandakan bahwa belum ada user yang login

  static void login(int id) {
    userId = id;
  }

  static void logout() {
    userId = null;
  }

  static bool isLoggedIn() {
    return userId != null;
  }

  static int? getUserId() {
    return userId;
  }
}
