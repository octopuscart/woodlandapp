import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:woodlandshk/modals/datatypes.dart';

class UI {
  Widget textBlock(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget smallTextBlock(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
    );
  }

  Widget smallTextBlockNormal(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 13),
    );
  }

  Widget tableCell(String text) {
    return Container(
      height: 30,
      child: this.textBlock(text),
    );
  }

  Widget tableCellNormal(String text) {
    return Container(
      height: 30,
      child: this.smallTextBlockNormal(text),
    );
  }

  Widget orderBlock(OrderBlock orderBlock, onPressed) {
    bool orderseen = orderBlock.order_seen != "0";
    return Card(
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    GFListTile(
                      avatar: CircleAvatar(child: Icon(Icons.person)),
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      titleText: orderBlock.name,
                      subTitleText: orderBlock.email,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Table(
                            border: TableBorder.all(
                              color: Colors.white,
                            ),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(100),
                              1: FixedColumnWidth(150),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  this.tableCell("Order No."),
                                  this.tableCell(orderBlock.order_no),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  this.tableCell("Total Amount"),
                                  this.tableCell(orderBlock.total_price),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  this.tableCell("Total Qnty."),
                                  this.tableCell(orderBlock.total_quantity),
                                ],
                              ),
                            ]),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        this.smallTextBlock(orderBlock.order_date),
                        this.smallTextBlock(orderBlock.order_time),
                        Divider(),
                        GFIconButton(
                          color: Colors.orangeAccent,
                          onPressed: onPressed,
                          icon: Icon(Icons.arrow_forward),
                          shape: GFIconButtonShape.circle,
                        ),
                      ],
                    ),
                    Chip(
                      backgroundColor: orderseen ? Colors.green : Colors.red,
                      label: Text(
                        orderseen ? "Seen" : "Unseen",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget orderDetailsBlock(Order orderBlock) {
    bool ispickup = orderBlock.zipcode == "Pickup";
    bool orderseen = orderBlock.order_seen != "0";
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          GFListTile(
            avatar: CircleAvatar(child: Icon(Icons.person)),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            titleText: orderBlock.name,
            subTitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                this.textBlock(orderBlock.email),
                SizedBox(
                  height: 5,
                ),
                this.textBlock(orderBlock.contact_no),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    this.textBlock("Address"),
                    Text(orderBlock.address1 + " " + orderBlock.address2),
                    Text(orderBlock.city +
                        " " +
                        orderBlock.state +
                        " " +
                        orderBlock.country),
                    ispickup
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              this.textBlock("Delivery"),
                              this.smallTextBlockNormal(
                                  orderBlock.delivery_date +
                                      " " +
                                      orderBlock.delivery_time),
                            ],
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Table(
                        border: TableBorder.all(
                          color: Colors.white,
                        ),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(110),
                          1: FixedColumnWidth(150),
                        },
                        children: <TableRow>[
                          TableRow(
                            children: <Widget>[
                              this.tableCell("Order No."),
                              this.tableCellNormal(orderBlock.order_no),
                            ],
                          ),
                          TableRow(
                            children: <Widget>[
                              this.tableCell("Order Date"),
                              this.tableCellNormal(orderBlock.order_date),
                            ],
                          ),
                          TableRow(
                            children: <Widget>[
                              this.tableCell("Order Time"),
                              this.tableCellNormal(orderBlock.order_time),
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              this.smallBlock("Payment Mode", orderBlock.payment_mode),
              this.smallBlock("Total Qnty", orderBlock.total_quantity),
              this.smallBlock("Total Amount", orderBlock.total_price),
            ],
          ),
          Divider(),
          Column(
              children: List.generate(
            orderBlock.cart.length,
            (index) {
              Map cardobj = orderBlock.cart[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    cardobj["file_name"],
                    height: 75.0,
                    width: 50.0,
                  ),
                ),
                title: Text(cardobj["title"]),
                subtitle: Text("Quantity: " + cardobj["quantity"]),
                trailing: this.textBlock(cardobj["total_price"]),
              );
            },
          )),
        ],
      ),
    );
  }

  Widget smallBlock(String title, String value) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.amber,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget countCard(
      {required String title,
      required String count,
      double width = 200,
      Color color = Colors.lightGreen,
      Color textcolor = Colors.white,
      bool loading = false}) {
    return Container(
      width: width,
      child: GFCard(
          color: color,
          boxFit: BoxFit.cover,
          // image: Image.asset('your asset image'),
          title: GFListTile(
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12, color: textcolor, fontWeight: FontWeight.bold),
            ),
          ),
          content: loading
              ? Container(
                  width: 30,
                  height: 30,
                  child: LinearProgressIndicator(
                    color: Colors.green.shade400,
                    backgroundColor: Colors.lightGreen.shade300,
                    minHeight: 30,
                  ),
                )
              : Text(
                  "$count",
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                )),
    );
  }
}
