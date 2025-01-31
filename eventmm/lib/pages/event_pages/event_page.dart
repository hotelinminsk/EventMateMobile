import 'dart:ui';

import 'package:eventmm/consts/colorsconsts.dart';
import 'package:eventmm/widgets/event_page_widgets/participate_tile.dart';
import 'package:flutter/material.dart';
import 'package:eventmm/modals/events/event_model.dart';
import 'package:eventmm/pages/event_pages/event_page_background.dart';
import 'package:eventmm/widgets/common_widgets/blurred_b_g_icon_button.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            EventPageBackground(eventPicUrl: event.eventPicUrl, deviceSize: deviceSize),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlurredBGIconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
                          callBackFunction: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.red),
                            Text(
                              "Konum Bilgisi",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        BlurredBGIconButton(
                          icon: Icon(Icons.favorite_border, color: Colors.black, size: 24),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey,
                      ),
                      height: deviceSize.height * 0.85,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Aligns everything to the left
                          children: [
                            Stack(
                              children: [
                                // Arka Plan Resmi
                                Container(
                                  height: deviceSize.height * 0.8 * 0.5,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(event.eventPicUrl), // Burayı NetworkImage ile değiştirebilirsin.
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)
                                    ),
                                  ),
                                ),
                                // Bulanık Arka Plan
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  right: 0,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.5),
                                        padding: EdgeInsets.all(16), // İçerik için padding
                                        child: Text(
                                          event.eventName.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between avatar and button
                                children: [
                                  // Left part with Avatar, Name, and Rating
                                  Row(
                                    children: [
                                      // Profile Picture with Border
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: goldenM100, // Border color
                                            width: 2,           // Border width
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: AssetImage(event.creatorPicUrl),
                                        ),
                                      ),
                                      SizedBox(width: 12), // Add spacing between avatar and name
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                                        children: [
                                          // Creator Name
                                          Text(
                                            event.creatorName,
                                            style: TextStyle(
                                              color: goldenM100,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // Star Rating
                                          Row(
                                            children: [
                                              Icon(Icons.star, color: goldenM100, size: 18),
                                              SizedBox(width: 4), // Space between star and rating
                                              Text(
                                                "3.67/5",
                                                style: TextStyle(
                                                  color: goldenM100,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Katıl Button on the right
                                  GestureDetector(
                                    onTap: (){
                                      print("Katila basti!");
                                    }, //KATIL ISLEVI
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.yellowAccent[700], // Button color
                                        borderRadius: BorderRadius.circular(8),
                                        // Rounded corners
                                      ),
                                      child: Text(
                                        'KATIL',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Divider below the button section
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              child: Divider(
                                color: Colors.grey[400], // Divider color
                                thickness: 1, // Divider thickness
                              ),
                            ),
                            // Centered description section
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Center(
                                child: Text(
                                  "This is a modern description of the event, offering details such as time, place, and additional information.",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center, // Centers the text
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              child: Divider(
                                color: Colors.grey[400], // Divider color
                                thickness: 1, // Divider thickness
                              ),
                            ),

                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.people,color: Colors.grey[600],),
                                        SizedBox(width: 8,),
                                        Text(
                                          "Katilimcilar: 24/50", //Duzenlenecek
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    LinearProgressIndicator(
                                      value: 24 / 50, //bunu bir sekilde alicaz
                                      backgroundColor: Colors.grey[300],
                                      color: goldenM100,
                                      minHeight: 8,
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "26 Kisi daha katilabilir",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              child: Divider(
                                color: Colors.grey[400], // Divider color
                                thickness: 1, // Divider thickness
                              ),
                            ),
                            ParticipateTile(userProfilePicUrl: "assets/images/pp.jpg", rating: 3.4, userName: "deneme Katilimci"),
                            ParticipateTile(userProfilePicUrl: "assets/images/pp.jpg", rating: 3.44, userName: "deneme Katilimci2"),
                            ParticipateTile(userProfilePicUrl: "assets/images/pp.jpg", rating: 3.455, userName: "deneme Katilimci3"),

                          ],
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


