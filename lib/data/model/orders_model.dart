class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivary;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersRating;
  String? ordersNoterating;
  String? ordersDatetime;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrdersModel({
    this.ordersId,
    this.ordersUsersid,
    this.ordersAddress,
    this.ordersType,
    this.ordersPricedelivary,
    this.ordersPrice,
    this.ordersTotalprice,
    this.ordersCoupon,
    this.ordersRating,
    this.ordersNoterating,
    this.ordersDatetime,
    this.ordersPaymentmethod,
    this.ordersStatus,
    this.addressId,
    this.addressUsersid,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'].toString();
    ordersUsersid = json['orders_usersid'].toString();
    ordersAddress = json['orders_address'].toString();
    ordersType = json['orders_type'].toString();
    ordersPricedelivary = json['orders_pricedelivary'].toString();
    ordersPrice = json['orders_price'].toString();
    ordersTotalprice = json['orders_totalprice'].toString();
    ordersCoupon = json['orders_coupon'].toString();
    ordersRating = json['orders_rating'].toString();
    ordersNoterating = json['orders_noterating'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethod = json['orders_paymentmethod'].toString();
    ordersStatus = json['orders_status'].toString();
    addressId = json['address_id'].toString();
    addressUsersid = json['address_usersid'].toString();
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'].toString();
    addressLong = json['address_long'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivary'] = ordersPricedelivary;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['orders_datetime'] = ordersDatetime;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
