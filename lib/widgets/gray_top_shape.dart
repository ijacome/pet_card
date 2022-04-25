import 'package:flutter/material.dart';
import 'package:pet_card/utils/my_colors.dart';
import 'package:pet_card/utils/responsive.dart';

class GrayTopShape extends StatelessWidget {
  final double size;

  const GrayTopShape({Key? key, required this.size})
      : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      top: 70,
      left: 0,
      child: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: MyColors.grayMuted,
          height: 200,
          width: responsive.width,
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
    path.moveTo(size.width*0.5000000,0);
    path.quadraticBezierTo(size.width*0.2843750,size.height*0.1775000,size.width*0.1925000,size.height*0.2900000);
    path.cubicTo(size.width*0.1250000,size.height*0.3935000,size.width*0.1075000,size.height*0.5745000,size.width*0.0925000,size.height*0.6720000);
    path.quadraticBezierTo(size.width*0.0806250,size.height*0.7740000,0,size.height*0.9000000);
    path.lineTo(0,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
