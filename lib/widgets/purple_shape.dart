import 'package:flutter/material.dart';
import 'package:pet_card/utils/responsive.dart';

class PurpleShape extends StatelessWidget {
  final double size;

  const PurpleShape({Key? key, required this.size})
      : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      top: 0,
      left: 0,
      child: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: Colors.purple.shade800,
          height: 190,
          width: responsive.width - 50,
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
    path.moveTo(0,0);
    path.lineTo(size.width,0);
    path.quadraticBezierTo(size.width*0.8993750,size.height*1.0115000,size.width*0.4850000,size.height*0.6120000);
    path.cubicTo(size.width*0.2184375,size.height*0.2980000,size.width*0.0950000,size.height*0.7295000,size.width*0.0637500,size.height*0.8560000);
    path.quadraticBezierTo(size.width*0.0428125,size.height*0.9595000,0,size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
