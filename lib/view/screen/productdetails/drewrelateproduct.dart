import 'package:flutter/material.dart';
import 'package:shop/view/screen/productdetails/productdetails.dart';

import '../../../model/productdetails/productdetailsmodel.dart';


class DrewRelateProducts extends StatefulWidget {
  final ModelDetails data;

  DrewRelateProducts({required this.data});

  @override
  _DrewRelateProductsState createState() => _DrewRelateProductsState();
}

class _DrewRelateProductsState extends State<DrewRelateProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: widget.data.relates!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, position) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductDetails(
                        productId: widget.data.relates![position].id,
                        name: widget.data.relates![position].name!,
                      );
                    }));
                  },
                  child: Container(
                    width: 200,
                    height: 350,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    (widget.data.relates![position].image!),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.data.relates![position].name!,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                fontSize: 10),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          (widget.data.relates![position].discountPrice == null)
                              ? Text(
                                  "EGP ${widget.data.relates![position].price.toString()}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1,
                                      fontSize: 14),
                                )
                              : Column(
                                  children: [
                                    Text(
                                      "EGP ${widget.data.relates![position].discountPrice.toString()}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Nunito",
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "EGP ${widget.data.relates![position].price.toString()}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.orangeAccent.shade200,
                                          fontFamily: "Nunito",
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(
                            "assets/image/—Pngtree—vector new tag icon_3989600.png")),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
