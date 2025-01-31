import 'package:eventmm/consts/colorsconsts.dart';
import 'package:flutter/material.dart';

class ParticipateTile extends StatelessWidget {
  const ParticipateTile({super.key,required this.userProfilePicUrl,required this.rating,required this.userName});
  final String userProfilePicUrl; // bunlari duzenlecek ve sadece User modeli alacak
  final String userName;
  final double rating;

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12,left: 12,right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: goldenM100,
                    width: 2
                  )
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(userProfilePicUrl),
                ),
              ),
              SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star,color: goldenM100,size: 16,),
                      SizedBox(width: 4,),
                      Text("${rating}/5",style: TextStyle(
                        color: goldenM100,
                        fontSize: 12,
                        fontStyle: FontStyle.italic
                      ),)
                    ],
                  )
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}
