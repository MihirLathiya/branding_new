import 'package:branding/constant/constant.dart';
import 'package:branding/constant/font_style.dart';
import 'package:flutter/material.dart';

class HeadingTile extends StatelessWidget {
  const HeadingTile({
    super.key,
    this.name,
    this.viewMore,
  });
  final String? name;
  final GestureTapCallback? viewMore;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstant.commonPadding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name!,
            style: FontTextStyle.kBlack18W600Poppins,
          ),
          TextButton(
            onPressed: viewMore,
            child: Text(
              'View more',
              style: FontTextStyle.k16W900Poppins,
            ),
          )
        ],
      ),
    );
  }
}
