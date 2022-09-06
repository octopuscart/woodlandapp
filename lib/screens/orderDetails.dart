import 'package:flutter/material.dart';
import 'package:woodlandshk/modals/datatypes.dart';
import '../controllers/apiController.dart';
import 'ui.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key, required this.orderDetails}) : super(key: key);
  final Order orderDetails;
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Order orderobj = Order.fromJson({
    "id": "",
    "address1": "",
    "address2": "",
    "state": "",
    "city": "",
    "cart": [],
    "zipcode": "",
    "country": "",
    "user_id": "",
    "status": "",
    "order_no": "",
    "total_quantity": "",
    "sub_total_price": "",
    "credit_price": "",
    "shipping_price": "",
    "total_price": "",
    "payment_mode": "",
    "amount_in_word": "",
    "name": "",
    "email": "",
    "contact_no": "",
    "measurement_style": "",
    "order_date": "",
    "order_time": "",
    "delivery_date": "",
    "delivery_time": "",
    "order_key": "",
    "order_seen": ""
  });
  @override
  void initState() {
    setState(() {
      orderobj = widget.orderDetails;
    });

    super.initState();
  }

  UI uiobj = UI();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(orderobj.order_no),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [uiobj.orderDetailsBlock(orderobj)],
        ),
      ),
    );
  }
}
