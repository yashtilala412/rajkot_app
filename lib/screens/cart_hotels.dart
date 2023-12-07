import 'package:flutter/material.dart';
// import 'package:fire_flutter_app_test/theme/color.dart';
import 'package:fire_flutter_app_test/utils/data.dart';

import '../widgets/recommend_item.dart';

class HotelCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _getRecommend()),
    );
  }

  Widget _getRecommend() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          recommends.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: RecommendItem(
              data: recommends[index],
            ),
          ),
        ),
      ),
    );
  }
}
