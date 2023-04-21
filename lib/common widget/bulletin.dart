import 'package:branding/constant/color.dart';
import 'package:branding/controller/edit_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

bulletin(
    {Color borderColor = AppColor.bulletBlack,
    Color tickColor = AppColor.bulletOrange}) {
  return Container(
    height: 10.sp,
    width: 10.sp,
    decoration: BoxDecoration(
      color: tickColor,
      shape: BoxShape.circle,
      border: Border.all(color: borderColor, width: 1.5),
    ),
  );
}

// TextStyle size8WeightBoldWhite =
//     TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 8.sp);
// TextStyle size8WeightBoldBlack =
//     TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 8.sp);
// TextStyle size6WeightBoldBlack =
//     TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 6.sp);
// TextStyle size6WeightBoldWhite =
//     TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 6.sp);

class TextSize8WeightBoldWhite extends StatelessWidget {
  final String? text;
  final EditPostController? controller;
  const TextSize8WeightBoldWhite({Key? key, this.text, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.getFont('${controller?.fonts[controller!.selectFont]}',
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 8.sp),
    );
  }
}

class TextSize8WeightBoldBlack extends StatelessWidget {
  final String? text;
  final EditPostController? controller;
  const TextSize8WeightBoldBlack({Key? key, this.text, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.getFont('${controller?.fonts[controller!.selectFont]}',
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 8.sp),
    );
  }
}

class TextSize6WeightBoldBlack extends StatelessWidget {
  final String? text;
  final EditPostController? controller;
  const TextSize6WeightBoldBlack({Key? key, this.text, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.getFont('${controller?.fonts[controller!.selectFont]}',
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 6.sp),
    );
  }
}

class TextSize6WeightBoldWhite extends StatelessWidget {
  final String? text;
  final EditPostController? controller;
  const TextSize6WeightBoldWhite({Key? key, this.text, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.getFont('${controller?.fonts[controller!.selectFont]}',
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 6.sp),
    );
  }
}
