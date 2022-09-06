class HomeData {
  final String order_data;
  final String total_user;
  final String total_unseen_order;
  final String total_unssen_emails;
  HomeData({
    required this.order_data,
    required this.total_user,
    required this.total_unseen_order,
    required this.total_unssen_emails,
  });
  Map<String, dynamic> toMap() {
    return {
      'order_data': order_data,
      'total_user': total_user,
      'total_unseen_order': total_unseen_order,
      'total_unssen_emails': total_unssen_emails,
    };
  }

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
        order_data: json["order_data"].toString(),
        total_user: json["total_user"].toString(),
        total_unseen_order: json["total_unseen_order"].toString(),
        total_unssen_emails: json["total_unssen_emails"].toString());
  }
}

class Order {
  final String address1;
  final String address2;
  final String amount_in_word;
  final List cart;
  final String city;
  final String contact_no;
  final String country;
  final String credit_price;
  final String delivery_date;
  final String delivery_time;
  final String email;
  final String id;
  final String measurement_style;
  final String name;
  final String order_date;
  final String order_key;
  final String order_no;
  final String order_seen;
  final String order_time;
  final String payment_mode;
  final String shipping_price;
  final String state;
  final String status;
  final String sub_total_price;
  final String total_price;
  final String total_quantity;
  final String user_id;
  final String zipcode;
  Order({
    required this.address1,
    required this.address2,
    required this.cart,
    required this.amount_in_word,
    required this.city,
    required this.contact_no,
    required this.country,
    required this.credit_price,
    required this.delivery_date,
    required this.delivery_time,
    required this.email,
    required this.id,
    required this.measurement_style,
    required this.name,
    required this.order_date,
    required this.order_key,
    required this.order_no,
    required this.order_seen,
    required this.order_time,
    required this.payment_mode,
    required this.shipping_price,
    required this.state,
    required this.status,
    required this.sub_total_price,
    required this.total_price,
    required this.total_quantity,
    required this.user_id,
    required this.zipcode,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      address1: json["address1"].toString(),
      address2: json["address2"].toString(),
      cart: json["cart"],
      amount_in_word: json["amount_in_word"].toString(),
      city: json["city"].toString(),
      contact_no: json["contact_no"].toString(),
      country: json["country"].toString(),
      credit_price: json["credit_price"].toString(),
      delivery_date: json["delivery_date"].toString(),
      delivery_time: json["delivery_time"].toString(),
      email: json["email"].toString(),
      id: json["id"].toString(),
      measurement_style: json["measurement_style"].toString(),
      name: json["name"].toString(),
      order_key: json["order_key"].toString(),
      order_no: json["order_no"].toString(),
      order_seen: json["order_seen"].toString(),
      order_time: json["order_time"].toString(),
      order_date: json["order_date"].toString(),
      payment_mode: json["payment_mode"].toString(),
      shipping_price: json["shipping_price"].toString(),
      state: json["state"].toString(),
      status: json["status"].toString(),
      sub_total_price: json["sub_total_price"].toString(),
      total_price: json["total_price"].toString(),
      total_quantity: json["total_quantity"].toString(),
      user_id: json["user_id"].toString(),
      zipcode: json["zipcode"].toString(),
    );
  }
}

class OrderBlock {
  final String contact_no;
  final String email;
  final String name;
  final String order_date;
  final String order_no;
  final String order_seen;
  final String order_time;
  final String payment_mode;
  final String total_price;
  final String total_quantity;

  OrderBlock({
    required this.contact_no,
    required this.email,
    required this.name,
    required this.order_date,
    required this.order_no,
    required this.order_seen,
    required this.order_time,
    required this.payment_mode,
    required this.total_price,
    required this.total_quantity,
  });

  factory OrderBlock.fromJson(Map<String, dynamic> json) {
    return OrderBlock(
      contact_no: json["contact_no"].toString(),
      email: json["email"].toString(),
      name: json["name"].toString(),
      order_no: json["order_no"].toString(),
      order_seen: json["order_seen"].toString(),
      order_time: json["order_time"].toString(),
      order_date: json["order_date"].toString(),
      payment_mode: json["payment_mode"].toString(),
      total_price: double.parse(json["total_price"].toString())
          .toStringAsFixed(2)
          .toString(),
      total_quantity: json["total_quantity"].toString(),
    );
  }
}
