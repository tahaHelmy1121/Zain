import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../model/homepage/categoriesslider.dart';


class DrewCarousel extends StatefulWidget {
  final List<CategoriesSlider>  data ;

  DrewCarousel({required this.data});

  @override
  _DrewCarouselState createState() => _DrewCarouselState();
}

class _DrewCarouselState extends State<DrewCarousel> {

  ValueNotifier<int>pageIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, position, index) {
              return Container(
                margin: EdgeInsets.all(5),
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.data[position].image!), fit: BoxFit.cover),
                ),
              );
            },
            options: CarouselOptions(
              height: 150,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration:
              Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )
        ),



      ],
    );
  }

}


