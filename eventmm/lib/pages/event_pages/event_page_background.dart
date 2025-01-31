import 'package:flutter/material.dart';
class EventPageBackground extends StatelessWidget {
  const EventPageBackground({super.key,required this.eventPicUrl,required this.deviceSize});
  final Size deviceSize;
  final String eventPicUrl;

  @override
  Widget build(BuildContext context) {
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
        height: deviceSize.height,
      ),
    );
  }
}
class BottomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path = Path();
    Offset curveStartPoint = Offset(0,size.height * 0.30); //first offset from x = 0 y = height * 0.8
    Offset curveEndPoint = Offset(size.width, size.height * 0.8); //second offsett x =width, y = height * 0.8

    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    //first create a line to start.x start.y from 0 , 0

    path.quadraticBezierTo(size.width * .40, size.height*0.60, curveEndPoint.dx, curveEndPoint.dy);
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

