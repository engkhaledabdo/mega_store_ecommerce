import 'package:get/get.dart';

// import 'package:mega_store/test.dart';


import 'core/constant/approutes.dart';
import 'core/middleware/mymiddelware.dart';
import 'view/screen/address/add.dart';
import 'view/screen/address/add_map.dart';
import 'view/screen/address/view.dart';
import 'view/screen/auth/forgetpassword/forgertpasswordverifycode.dart';
import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/signupverifycode.dart';

import 'view/screen/auth/success_signup.dart';
import 'view/screen/cart.dart';
import 'view/screen/checkout.dart';
import 'view/screen/homescreen.dart';
import 'view/screen/items.dart';
import 'view/screen/language.dart';
import 'view/screen/myfavorite.dart';
import 'view/screen/notification.dart';
import 'view/screen/offers.dart';
import 'view/screen/onboarding.dart';
import 'view/screen/orders/archive.dart';
import 'view/screen/orders/orders_details.dart';
import 'view/screen/orders/orders_layout.dart';
import 'view/screen/orders/pinding.dart';
import 'view/screen/productdetails.dart';
import 'view/screen/testapi_view.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => const TestApiView()),
  GetPage(name: AppRoute.language, page: () => const Language()),
  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.forgetPasswordVerfiyCode,
      page: () => const ForgetPasswordVerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.signUpVerifyCode, page: () => const SignUpVerifyCode()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),

  // OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const ObBoarding()),

  // home
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.itemsDetails, page: () => const ItemsDetails()),

  //myFavorite
  GetPage(name: AppRoute.myFavotite, page: () => const MyFavorite()),

  // cart
  GetPage(name: AppRoute.cart, page: () => const Cart()),

  // address
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressAddMap, page: () => const AddressMapAdd()),

  //checkout
  GetPage(name: AppRoute.checkout, page: () => const CheckOut()),
  GetPage(name: AppRoute.orders, page: () => const Orders()),
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchive()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),

  // offers
  GetPage(name: AppRoute.offers, page: () => const OffersView()),
  // offers
  GetPage(name: AppRoute.notifications, page: () => const Notifications()),
];


// Map<String, Widget Function(BuildContext)> routes = {
//   // Auth
//   AppRoute.login: (context) => const Login(),
//   AppRoute.signup: (context) => const SignUp(),
//   AppRoute.forgetPassword: (context) => const ForgetPassword(),
//   AppRoute.forgetPasswordVerfiyCode: (context) =>
//       const ForgetPasswordVerifyCode(),
//   AppRoute.resetPassword: (context) => const ResetPassword(),
//   AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
//   AppRoute.signUpCheckEmail: (context) => const SignUpCheckEmail(),
//   AppRoute.successSignUp: (context) => const SuccessSignUp(),

//   // OnBoarding
//   AppRoute.onBoarding: (context) => const ObBoarding()
// };

