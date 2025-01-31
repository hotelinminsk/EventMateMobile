import 'package:eventmm/consts/colorsconsts.dart';
import 'package:eventmm/consts/textconsts.dart';
import 'package:eventmm/notfiers/app_state.dart';
import 'package:eventmm/pages/event_pages/event_page.dart';
import 'package:eventmm/pages/home_page/home_page_background.dart';
import 'package:eventmm/widgets/home_page_widgets/category_widget.dart';
import 'package:eventmm/widgets/home_page_widgets/event_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modals/events/event_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {

    final categoriesSpaceHolder = [
      "All",
      "Concerts",
      "Sports",
      "Dance",
      "Art"
    ];

    final List<EventModel> events = [
      EventModel(
        eventName: "Sansar Salvo Konseri",
        creatorPicUrl: "assets/images/pp2.png",
        eventPicUrl: "assets/images/pp.jpg",
        creatorName: "Burak Kurucay"
      ),
      EventModel(
        eventName: "Baska bir Event",
        creatorPicUrl: "assets/images/logo.png",
        eventPicUrl: "assets/images/pp2.png",
        creatorName: "Ata Yilmaz"
      ),
      EventModel(
        eventName: "Bambaska bir event",
        creatorPicUrl: "assets/images/pp.jpg",
        eventPicUrl: "assets/images/logo.png",
        creatorName: "Yahya Kuyumcu"
      ),
    ];

    void eventPreqOpener(EventModel event){
        Navigator.of(context).push(MaterialPageRoute<EventPage>(builder: (context){
          return EventPage(event: event,);
        }));
    }


    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){},//floating button for adding a new event
          child: Icon(Icons.add,size: 32,color: Colors.white,),
          backgroundColor: goldenM100,
          elevation: 3,
          enableFeedback: true,
        splashColor: Colors.white,
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 2
          )
        ),

      ),

      endDrawer: Drawer(  //EKRANIN SAGINDA ACILAN DRAWER, DUZENLENECEK

      ),
      backgroundColor: Colors.white,

      body: ChangeNotifierProvider(
        create: (_) => AppState(),
        child: Stack(
          children: [
            HomePageBackground(screenHeight: MediaQuery.of(context).size.height, screenWidth: MediaQuery.of(context).size.width),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,right:16,top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("EventM8",style: fadedTextStyle,),
                          Spacer(),
                          GestureDetector(
                            child: Row(
                              children: [
                                Icon(Icons.location_on,color: Colors.red,size: 16,),
                                Text("Gebze,Kocaeli",style: fadedTextStyle,)//bu konum bilgisini modelden cekecegiz bu placeholder
                              ],
                            ),
                            onTap: (){

                            }, // konum degistirme icin fonksiyon olusturulacak
                          ),
                          Spacer(),
                          Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: (){
                                  //ACILAN DRAWER TASARLANACAK
                                  //LOGOUT - SETTINGS - PROFILE GIBI SEKMELER
                                  Scaffold.of(context).openEndDrawer();
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage("assets/images/pp2.png"),
                                ),
                              );
                            }
                          ) // Profile Clicakble , create an drawer after click
                        ],
                      ),
                    ),
                    //BU HESAP ACIK ISE GORUNMELI
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
                      child: Text("Hello' ${username}!",style: whiteHeadingTextStyle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Consumer<AppState>(
                        builder: (context,AppState,child) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0 ; i < categoriesSpaceHolder.length; i++)CategoryWidget(category: categoriesSpaceHolder[i],catID: i,) // simdilik bi cozum
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                        builder: (child, appState,_)=>Column(
                          children: [
                            for(var event in events)EventCardWidget(event: event, callBackFunc: eventPreqOpener)
                            
                          ],
                        ),
                      ),
                    )
                  ],

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
