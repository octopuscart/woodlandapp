import 'package:flutter/material.dart';
import 'package:woodlandshk/modals/datatypes.dart';
import '../controllers/apiController.dart';
import 'ui.dart';
import 'orderDetails.dart';

class OrderReports extends StatefulWidget {
  const OrderReports({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<OrderReports> createState() => _OrderReportsState();
}

class _OrderReportsState extends State<OrderReports>
    with AutomaticKeepAliveClientMixin<OrderReports> {
  String loadingString = "";
  int steps = 0;
  bool enablebutton = false;
  bool loadingdata = true;
  ApiController apiobj = ApiController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  Future<List<Map<String, dynamic>>> getOrderData() async {
    return await apiobj.getDataFromServerList("checkUnseenOrderMobile");
  }

  Future<List<Map<String, dynamic>>> getOrderData2() async {
    return [
      {
        "id": "396",
        "address1": "13 Floor, Hing Ming Building",
        "address2": "41-A Granville Road, TST",
        "state": "",
        "city": "",
        "zipcode": "Tsim Sha Tsui",
        "country": "",
        "user_id": "guest",
        "status": "Confirmation Pending",
        "order_no": "WL20220821396",
        "total_quantity": "1",
        "sub_total_price": "70",
        "credit_price": "0",
        "shipping_price": "0",
        "total_price": "70",
        "payment_mode": "Alipay",
        "amount_in_word": "Only HK seventy    ",
        "name": "PARAG JOGANI",
        "email": "paragjogani@gmail.com",
        "contact_no": "64966751",
        "measurement_style": "",
        "order_date": "2022-08-21",
        "order_time": "12:03:33",
        "delivery_date": "2022-08-21",
        "delivery_time": "12:15",
        "order_key": "6bbf8455a7580bcb15441ab07c424374",
        "order_seen": "0"
      },
      {
        "id": "395",
        "address1": "Room 801, Wing On Plaza",
        "address2": "62 Mody Road, TST",
        "state": "",
        "city": "",
        "zipcode": "Tsim Sha Tsui",
        "country": "",
        "user_id": "guest",
        "status": "Confirmation Pending",
        "order_no": "WL20220817395",
        "total_quantity": "12",
        "sub_total_price": "635",
        "credit_price": "0",
        "shipping_price": "0",
        "total_price": "635",
        "payment_mode": "Alipay",
        "amount_in_word": "Only HK six hundred  and thirty five   ",
        "name": "Karen Yau",
        "email": "karenkkyau@hotmail.com",
        "contact_no": "91997465",
        "measurement_style": "",
        "order_date": "2022-08-17",
        "order_time": "12:11:59",
        "delivery_date": "2022-08-17",
        "delivery_time": "12:15",
        "order_key": "ed349dc427e7bcae4a9aa9995d3779d3",
        "order_seen": "0"
      },
    ];
  }

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  UI uiobj = UI();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Reports"),
      ),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return FutureBuilder<List<Map<String, dynamic>>>(
            future:
                getOrderData(), // a previously-obtained Future<String> or null
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> temporder = snapshot.data![index];
                    OrderBlock orderblock = OrderBlock.fromJson(temporder);
                    Order orderdata = Order.fromJson(temporder);
                    return uiobj.orderBlock(orderblock, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderDetails(orderDetails: orderdata),
                        ),
                      );
                      print(orderdata.cart);
                    });
                  },
                );
              }

              /// handles others as you did on question
              else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
