import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/middleware/mymiddleware.dart';
import 'package:ecommerce/view/screen/auth/forget%20password/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forget%20password/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/successignup.dart';
import 'package:ecommerce/view/screen/auth/forget%20password/successreset.dart';
import 'package:ecommerce/view/screen/auth/forget%20password/verifycode.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/favorite_page.dart';
import 'package:ecommerce/view/screen/home_screen.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/product_details.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // Starting page
  GetPage(name: "/",                           page: () => const Language(), middlewares: [MyMiddleWare()]),
  // Auth
  GetPage(name: AppRoute.login,                page: () => const Login()),
  GetPage(name: AppRoute.signup,               page: () => const Signup()),
  GetPage(name: AppRoute.forgetPassword,       page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode,           page: () => const VerifyCode()),
  GetPage(name: AppRoute.verifyCodeSignUp,     page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.resetPassword,        page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp,        page: () => const SuccessSignUp()),
  // On Boarding
  GetPage(name: AppRoute.onBoarding,           page: () => const OnBoarding()),
  // Home
  GetPage(name: AppRoute.home,                 page: () => const HomeScreen()),
  GetPage(name: AppRoute.items,                page: () => const ItemsPage()),
  GetPage(name: AppRoute.productDetails,       page: () => ProductDetails()),
  GetPage(name: AppRoute.favorite,             page: () => const FavoritePage()),
  GetPage(name: AppRoute.cart,                 page: () => Cart()),
];
