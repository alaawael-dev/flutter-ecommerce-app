class AppLink {
  static const String server = "http://192.168.1.107/aura";
  static const String test = "$server/test.php";
  // Images
  static const String imagePath = "$server/uploads";
  static const String categories = "$imagePath/categories";
  static const String imageItems = "$imagePath/items";

  // Auth links
  static const String signup = "$server/Auth/signup.php";
  static const String login = "$server/Auth/login.php";
  static const String verifycode = "$server/Auth/verifycode.php";
  // Forget Password links
  static const String checkEmail = "$server/forget/checkemail.php";
  static const String VerifyCodeResetPassword = "$server/forget/verifycode.php";
  static const String resetPassword = "$server/forget/resetpass.php";
  // Home
  static const String home = "$server/home.php";
  // Items
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";
  // Favorite
  static const String addFavorite = "$server/favorite/add.php";
  static const String removeFavorite = "$server/favorite/remove.php";
  static const String viewFavorite = "$server/favorite/view.php";
  static const String deleteFavPage = "$server/favorite/deletefav.php";
  // Cart
  static const String addCart = "$server/cart/add.php";
  static const String viewCart = "$server/cart/view.php";
  static const String deleteCart = "$server/cart/delete.php";
  static const String getCount = "$server/cart/get_count.php";
}
