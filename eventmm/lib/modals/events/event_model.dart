//BU MODEL GELISTIRILECEK
//EKLENMESI GEREKENLER
/*
  1- GIDECEK USERLARIN DATASI USER MODEL LIST OLARAK TUTULACAK
  2 - KONUM BILGISI TUTULACAK
  3- CREATOR USER OLARAK TUTULACAK
 */
class EventModel {

  final String eventName;
  final String eventPicUrl;
  final String creatorPicUrl;
  final String creatorName; // bu user olarak tutulacak
  EventModel({required this.eventName,required this.eventPicUrl,required this.creatorPicUrl,required this.creatorName});

}