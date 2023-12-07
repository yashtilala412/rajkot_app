import 'package:flutter/material.dart';
import 'package:fire_flutter_app_test/theme/color.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
    required this.title,
    this.onTap,
    this.leadingIcon,
    this.leadingIconColor = Colors.white,
    this.hasToggle = false,
    this.toggleValue = false,
    this.onToggleChanged,
  }) : super(key: key);

  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final String title;
  final GestureTapCallback? onTap;
  final bool hasToggle;
  final bool toggleValue;
  final ValueChanged<bool>? onToggleChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: AppColor.cardColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: hasToggle
              ? _buildItemWithToggle()
              : (leadingIcon != null
                  ? _buildItemWithPrefixIcon()
                  : _buildItem()),
        ),
      ),
    );
  }

  Widget _buildPrefixIcon() {
    return leadingIcon != null
        ? Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColor.cardColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              leadingIcon,
              size: 24,
              color: hasToggle
                  ? AppColor.blue
                  : leadingIconColor, // Adjust the icon color here
            ),
          )
        : SizedBox.shrink();
  }

  Widget _buildItemWithPrefixIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPrefixIcon(),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColor.labelColor,
          size: 14,
        )
      ],
    );
  }

  Widget _buildItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColor.labelColor,
          size: 14,
        )
      ],
    );
  }

  Widget _buildItemWithToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Switch(
          value: toggleValue,
          onChanged: onToggleChanged,
          activeColor: AppColor.blue, // Adjust as needed
        ),
      ],
    );
  }
}
