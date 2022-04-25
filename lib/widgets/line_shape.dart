import 'package:flutter/material.dart';
import 'package:pet_card/utils/my_colors.dart';
import 'package:pet_card/utils/responsive.dart';

class LineShape extends StatelessWidget {
  final double size;

  const LineShape({Key? key, required this.size})
      : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      top: -3,
      left: -3,
      child: SizedBox(
        height: 210,
        width: responsive.width / 2 + 100,
        child: CustomPaint(
          painter: CurvePainter(),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = MyColors.ripeOrange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(size.width*0.6562500,0);
    path.quadraticBezierTo(size.width*0.6928125,size.height*0.5160000,size.width*0.4912500,size.height*0.5720000);
    path.cubicTo(size.width*0.3346875,size.height*0.6020000,size.width*0.2703125,size.height*0.3460000,0,size.height*0.4640000);
    path.quadraticBezierTo(0,size.height*0.3145000,0,0);
    path.lineTo(size.width*0.6562500,0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
