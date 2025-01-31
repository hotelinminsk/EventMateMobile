import 'package:eventmm/consts/colorsconsts.dart';
import 'package:eventmm/consts/textconsts.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:eventmm/modals/events/event_model.dart';

class EventCardWidget extends StatefulWidget {
  //THIS CLASS WILL BE MODIFIED TO HOLD EVENT MODALS INSTEAD OF STRINGS
  const EventCardWidget({super.key,required this.event,required this.callBackFunc});
  final void Function(EventModel) callBackFunc;
  final EventModel event;

  @override
  State<EventCardWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.callBackFunc(widget.event);
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 2,

        child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Üst kısımda tarih
                  Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "May",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "18",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Event'i oluşturan kullanıcının profil fotoğrafı
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black,width: 3),
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            widget.event.creatorPicUrl, // Kullanıcı profil fotoğrafı
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Ana görsel
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.event.eventPicUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Etkinlik detayları ve favori butonu
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.event.eventName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          // Favori işlevi
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Gebze, Kocaeli - 180KM", //db den cekilecek
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Katılımcı bilgisi
                  Row(
                    children: [
                      Text(
                        "26 Kisi Katiliyor!",  //databaseden cekilecek
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                  "assets/images/8fd1caba015e7dd39e9e99dd3f2fbf92.jpg"), // Katılımcı resmi
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "+22",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                ],
              ),
            ),
          color: Colors.white,
        ),
    );

  }
}
