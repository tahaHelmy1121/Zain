

     import 'package:flutter/material.dart';

import '../../../model/order/orderdetails.dart';

       class OrderDetails extends StatefulWidget {
         final OrderDetailsModel? data;
         const OrderDetails({Key? key,  this.data}) : super(key: key);

         @override
         State<OrderDetails> createState() => _OrderDetailsState();
       }

       class _OrderDetailsState extends State<OrderDetails> {
         @override
         Widget build(BuildContext context) {
           return const Placeholder();
         }
       }
