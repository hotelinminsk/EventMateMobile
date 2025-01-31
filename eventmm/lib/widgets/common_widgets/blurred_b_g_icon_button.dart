import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBGIconButton extends StatelessWidget {
  const BlurredBGIconButton({super.key,this.icon,this.callBackFunction});
  final Icon? icon;
  final void Function()? callBackFunction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          //FOR BLUR EFFECT DECORATION
        ClipOval(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  shape: BoxShape.circle

                ),
              ),
          ),
        ),
        //THE ACTUAL ICONBUTTON
        if(icon != null)
          Positioned(
              child: IconButton(onPressed: callBackFunction, icon: icon!)
          ),
      ],
    );
  }
}
