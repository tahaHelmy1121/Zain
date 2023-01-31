import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/datasourse/dynamic/chat/chat.dart';
import '../../../../model/chat/chat.dart';


class ChatDetails extends StatefulWidget {
   int? changed ;

  ChatDetails({ this.changed});

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  int xdCustomer = 0;

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  String val = "";
   Timer? timer;


  @override
  void initState() {
    super.initState();
    getCustomerId();


  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.changed==1)?  FutureBuilder(
        future: ChatData.getChat(xdCustomer),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.none:
              return const Text("");
            default:
              if (snapshot.hasError) {
                return const Text("");
              } else {
                List<ShowChatModel> chatData = snapshot.data;


                return ListView.builder(
                  // reverse: true,
                    itemCount: chatData.length,
                    itemBuilder: (context, position) {
                      return (chatData[position].type == 1)
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (chatData[position].msgType == 0)
                              ? Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            width: 150,
                            height: 70,
                            child: Text(
                              chatData[position].message.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1,
                                  fontFamily: "BigVesta",
                                  fontWeight: FontWeight.w500),
                              maxLines: 4,
                            ),
                          )
                              : Container(
                            margin: const EdgeInsets.all(8),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(7),
                              image: DecorationImage(
                                image: NetworkImage(
                                    chatData[position].message),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          (chatData[position].msgType == 0)
                              ? Container(
                            decoration: const BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(15),
                            width: 150,
                            height: 70,
                            child: Text(
                              chatData[position].message.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1,
                                  fontFamily: "BigVesta",
                                  fontWeight: FontWeight.w500),
                              maxLines: 4,
                            ),
                          )
                              : Container(
                            margin: const EdgeInsets.all(8),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(7),
                              image: DecorationImage(
                                image: NetworkImage(
                                    chatData[position].message),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      );

                    }


                );

              }

          }

        }
    ):FutureBuilder(
        future: ChatData.getChat(xdCustomer),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.none:
              return const Text("");
            default:
              if (snapshot.hasError) {
                return const Text("");
              } else {
                List<ShowChatModel> chatData = snapshot.data;


                return ListView.builder(
                  // reverse: true,
                    itemCount: chatData.length,
                    itemBuilder: (context, position) {
                      return (chatData[position].type == 1)
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (chatData[position].msgType == 0)
                              ? Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            width: 150,
                            height: 70,
                            child: Text(
                              chatData[position].message.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1,
                                  fontFamily: "BigVesta",
                                  fontWeight: FontWeight.w500),
                              maxLines: 4,
                            ),
                          )
                              : Container(
                            margin: const EdgeInsets.all(8),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(7),
                              image: DecorationImage(
                                image: NetworkImage(
                                    chatData[position].message),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          (chatData[position].msgType == 0)
                              ? Container(
                            decoration: const BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(15),
                            width: 150,
                            height: 70,
                            child: Text(
                              chatData[position].message.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1,
                                  fontFamily: "BigVesta",
                                  fontWeight: FontWeight.w500),
                              maxLines: 4,
                            ),
                          )
                              : Container(
                            margin: const EdgeInsets.all(8),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(7),
                              image: DecorationImage(
                                image: NetworkImage(
                                    chatData[position].message),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      );

                    }


                );

              }

          }

        }
    );

  }
}
