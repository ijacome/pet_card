import 'package:flutter/material.dart';
import 'package:pet_card/utils/my_colors.dart';
import 'package:pet_card/utils/responsive.dart';

class GrayBottomShape extends StatelessWidget {
  final double size;

  const GrayBottomShape({Key? key, required this.size})
      : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 0,
      right: 0,
      child: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: MyColors.grayMuted,
          height: 190,
          width: responsive.width / 2 + 60,
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.moveTo(size.width,size.height*0.1020000);
    path.quadraticBezierTo(size.width*0.6037500,size.height*0.1330000,size.width*0.4962500,size.height*0.6080000);
    path.quadraticBezierTo(size.width*0.4818750,size.height*0.7215000,size.width*0.4775000,size.height);
    path.lineTo(size.width,size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
