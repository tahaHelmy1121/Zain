    import 'dart:convert';

import 'package:http/http.dart'as http;
    import '';
import '../../../../model/chat/chat.dart';
import '../../../constant/urlconnection.dart';

       class ChatData {
         static Future<List<ShowChatModel>> getChat(int customer) async {
           ShowChatModel showChatModel = ShowChatModel();
           List<ShowChatModel> body = [];
           Map<String, dynamic>data = {
             "customer_id": customer
           };
           var respnse = await http.post(
               Uri.http(passeUrl, chatShowUrl), body: data);
           if (respnse.statusCode == 200) {
             var responsebody = jsonDecode(respnse.body);
             for (var item in responsebody) {
               body.add(ShowChatModel(
                 customerId: item["customer_id"],
                 id: item["id"],
                 type: item["type"],
                 createDateTime: item['create_date_time'],
                 describe: item['describe'],
                 discountPrice: item['discount_price'],
                 isRead: item['is_read'],
                 message: item['message'],
                 msgType: item['msg_type'],
                 names: item['names'],
                 productid: item['productid'],
                 products: item['products'],

               ));
             }
           }
           return body;
         }
       }