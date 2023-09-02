import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FullImageScreen extends StatefulWidget {
  final List? images;

  const FullImageScreen({super.key, this.images});

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22..r,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: widget.images!
                .map(
                  (item) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(item.toString()), fit: BoxFit.fill),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 400,
              viewportFraction: 0.85,
              enlargeCenterPage: true,
              aspectRatio: 1.5,
              // enableInfiniteScroll: false,
              autoPlay: false,
              // disableCenter: true,
            ),
          ),
          SizedBox(height: 100..h)
        ],
      ),
    );
  }
}
