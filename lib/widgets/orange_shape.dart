import 'package:flutter/material.dart';
import 'package:pet_card/utils/my_colors.dart';
import 'package:pet_card/utils/responsive.dart';

class OrangeShape extends StatelessWidget {
  final double size;

  const OrangeShape({Key? key, required this.size})
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
          color: MyColors.ripeOrange,
          height: 190,
          width: responsive.width / 2,
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
    path.moveTo(size.width,0);
    path.quadraticBezierTo(size.width*0.9462500,size.height*-0.0065000,size.width*0.9050000,size.height*0.3520000);
    path.cubicTo(size.width*0.8087500,size.height*0.8355000,size.width*0.1937500,size.height*0.5165000,0,size.height);
    path.quadraticBezierTo(size.width*0.2500000,size.height,size.width,size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
