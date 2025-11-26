class AppLink {
  static const String server = 'https://www.classyparty.shop/';
  static const String test = "$server/test.php";
  static const String imageSatatic = 'https://www.classyparty.shop/upload';

  // images
  static const String imageCategories = '$imageSatatic/categories';
  static const String imageItems = '$imageSatatic/items';

  // auth
  static const String login = "$server/auth/login.php";
  static const String signUp = "$server/auth/signup.php";
  static const String signUpVerifyCode = "$server/auth/verifycode.php";
  static const String resendVerifyCode = "$server/auth/resendcode.php";

  //forget password
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycodeforgetpassword.php";

  //home
  static const String homepage = "$server/home.php";
  //items
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";

  // product Details
  static const String itemsDetails = "$server/items/items.php";

  // favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFromMyFavorite =
      "$server/favorite/deletefrommyfevorite.php";

  // cart
  static const String cartView = "$server/cart/view.php";
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";

  // address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // coupon
  static const String checkCoupon = "$server/coupon/checkcoupon.php";

  // orders
  static const String checkout = "$server/orders/checkout.php";
  static const String ordersPinding = "$server/orders/pending.php";
  static const String ordersArchive = "$server/orders/archive.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String ordersDelete = "$server/orders/delete.php";

  // notification
  static const String notification = "$server/notification.php";

  // Offers
  static const String offers = "$server/offers.php";

  // rating
  static const String rating = "$server/rating.php";

  // setting // users
  static const String settings = "$server/users.php";

  static const String testapi = "https://jsonplaceholder.typicode.com/posts";
}
