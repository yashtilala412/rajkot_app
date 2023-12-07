import 'package:flutter/material.dart';
import 'package:fire_flutter_app_test/theme/color.dart';
import 'package:fire_flutter_app_test/widgets/custom_image.dart';
import '../widgets/favorite_box.dart';

class SingleCartScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  SingleCartScreen({
    Key? key,
    required this.data,
    this.height = 300,
    this.onTapFavorite,
  }) : super(key: key);

  final double height;
  final GestureTapCallback? onTapFavorite;

  @override
  State<SingleCartScreen> createState() => _SingleCartScreenState();
}

class _SingleCartScreenState extends State<SingleCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildName(),
                    SizedBox(height: 5),
                    _buildInfo(),
                    SizedBox(height: 10),
                    _buildDescription(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      widget.data["name"] ?? '',
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
              widget.data["type"] ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.labelColor,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.data["price"] ?? '',
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
          onTap: widget.onTapFavorite,
          isFavorited: widget.data["is_favorited"] ?? false,
        )
      ],
    );
  }

  Widget _buildImage() {
    return CustomImage(
      widget.data["image"] ?? '',
      width: double.infinity,
      height: 190,
      radius: 15,
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.data["description"] ?? '',
      style: TextStyle(
        color: AppColor.textColor,
        fontSize: 14,
      ),
    );
  }
}
