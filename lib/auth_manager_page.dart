class Petani {
  int id;
  String username;

  Petani(this.id, this.username);
}

class AuthManager {
  static int? userId;
  static Petani? loggedInPetani;

  static void login(int id, String username) {
    userId = id;
    loggedInPetani = Petani(id, username);
  }

  static void logout() {
    userId = null;
    loggedInPetani = null;
  }

  static bool isLoggedIn() {
    return userId != null;
  }

  static int? getUserId() {
    return userId;
  }

  static String? getUsername() {
    return loggedInPetani?.username;
  }
}
