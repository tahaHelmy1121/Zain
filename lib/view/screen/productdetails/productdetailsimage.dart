
     import 'package:flutter/material.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';
     import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import '../../../core/constant/color.dart';
import '../../../model/productdetails/productdetailsmodel.dart';


    class ProductDetailsImage extends StatefulWidget {
      final ModelDetails data;
      const ProductDetailsImage({Key? key, required this.data}) : super(key: key);

      @override
      State<ProductDetailsImage> createState() => _ProductDetailsImage();
    }

    class _ProductDetailsImage extends State<ProductDetailsImage> {
      @override
      Widget build(BuildContext context) {

        return Container(
            margin: EdgeInsets.only(top: 20),
            height: 300,
            width: double.infinity,
            child: PageView.builder(

                itemCount: widget.data.images?.length,
                itemBuilder: (context, position) {
                  return GestureZoomBox(
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColor.backgroundcolor,
                          borderRadius: BorderRadius.circular(100)),
                      child: FadeInImage(
                        placeholder: ExactAssetImage(
                          (widget.data.categoryId ==20 ||
                              widget.data.categoryId == 12 ||
                              widget.data.categoryId == 14 ||
                              widget.data.categoryId == 15 ||
                              widget.data.categoryId == 16 ||
                              widget.data.categoryId == 17)
                              ? "assets/image/Zain-logos_transparent.png"
                              : "assets/image/Zain-logos_black.png",
                        ),
                        image: NetworkImage(
                            widget.data.images![position].image),
                        fit: BoxFit.contain,
                      ),

                    ),

                  );
})
        );
      }
    }



