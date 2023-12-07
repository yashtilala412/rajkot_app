import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// import 'package:get/get.dart';
import 'package:rajkot_app/theme/color.dart';
import 'package:rajkot_app/utils/data.dart';
import 'package:rajkot_app/widgets/city_item.dart';
import 'package:rajkot_app/widgets/feature_item.dart';
// import 'package:rajkot_app/widgets/notification_box.dart';
import 'package:rajkot_app/widgets/recommend_item.dart';
// import '../widgets/favorite_box.dart';

import 'filter_hotel_screen.dart';

class MallHomePage extends StatefulWidget {
  const MallHomePage({Key? key}) : super(key: key);

  @override
  State<MallHomePage> createState() => _MallHomePageState();
}

class _MallHomePageState extends State<MallHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: _builAppBar(),
          ),
          SliverToBoxAdapter(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _builAppBar() {
    return Row(
      children: [
        Icon(
          Icons.place_outlined,
          color: AppColor.labelColor,
          size: 20,
        ),
        const SizedBox(
          width: 3,
        ),
        const Spacer(),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FilterHotelScreen()), // Replace YourOtherScreen() with the screen you want to navigate to
                );
              },
              child: Text(
                'Find and Book',
                style: TextStyle(
                  color: AppColor.labelColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "The Best Malls & Supermarkets",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          _buildCities(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Featured",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          _buildFeatured(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textColor),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: AppColor.darker),
                ),
              ],
            ),
          ),
          _getRecommend(),
        ],
      ),
    );
  }

  _buildFeatured() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        rajkot_malls.length,
        (index) => FeatureItem(
            data: rajkot_malls[index],
            onTapFavorite: () {
              setState(() {
                rajkot_malls[index]["is_favorited"] =
                    !rajkot_malls[index]["is_favorited"];
              });
            },
            index: index),
      ),
    );
  }

  _getRecommend() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(
              data: recommends[index],
            ),
          ),
        ),
      ),
    );
  }

  _buildCities() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          cities.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CityItem(
              data: cities[index],
            ),
          ),
        ),
      ),
    );
  }
}
