import 'package:flutter/material.dart';
import 'package:fire_flutter_app_test/theme/color.dart';
import 'package:fire_flutter_app_test/widgets/favorite_box.dart';
import '../screens/single_cart_screen.dart';
import '../utils/data.dart';
import 'custom_image.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    Key? key,
    required this.data,
    this.width = 280,
    this.height = 300,
    this.onTap,
    this.onTapFavorite,
    required this.index,
  }) : super(key: key);

  final data;
  final double width;
  final double height;
  final GestureTapCallback? onTapFavorite;
  final GestureTapCallback? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(); // Trigger the onTap function if it's provided
        } else {
          // Navigate to your destination screen
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleCartScreen(
                      data: features[index],
                    )), // Replace YourDestinationScreen() with the screen you want to navigate to
          );
        }
      },
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            Container(
              width: width - 20,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildName(),
                  SizedBox(
                    height: 5,
                  ),
                  _buildInfo(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      data["name"],
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18,
        color: AppColor.textColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data["type"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.labelColor,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              data["price"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        FavoriteBox(
          size: 16,
          onTap: onTapFavorite,
          isFavorited: data["is_favorited"],
        )
      ],
    );
  }

  Widget _buildImage() {
    return CustomImage(
      data["image"],
      width: double.infinity,
      height: 190,
      radius: 15,
    );
  }
}
