import 'package:eventmm/consts/colorsconsts.dart';
import 'package:flutter/material.dart';

class HomePageBackground extends StatelessWidget {
  const HomePageBackground({super.key,required this.screenHeight,required this.screenWidth});
  final screenHeight;
  final screenWidth;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context); //Theme data of widget tree
    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFFD700),
            Colors.white24
          ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        //color: Colors.blueGrey.shade500,
        height: screenHeight,
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path = Path();
    Offset curveStartPoint = Offset(0,size.height * 0.40); //first offset from x = 0 y = height * 0.8
    Offset curveEndPoint = Offset(size.width, size.height); //second offsett x =width, y = height * 0.8

    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    //first create a line to start.x start.y from 0 , 0

    path.quadraticBezierTo(size.width/2, size.height/2, curveEndPoint.dx, curveEndPoint.dy);
    //then take base of the curve as width/2 as x end height as y
    path.lineTo(size.width, 0);
    //last paint the blank portion
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return true;
  }
}