import 'package:eventmm/consts/colorsconsts.dart';
import 'package:eventmm/consts/textconsts.dart';
import 'package:eventmm/notfiers/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key,required this.category,required this.catID});
  final String category; // this will be fetched from database after we do the backend
  final int catID; // daha sonra degismem lazim simdilik bi cozum
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = catID == appState.selectedCategoryid;

    return GestureDetector(
      onTap: (){
        if(!isSelected){
          appState.changeSelected(catID);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black,width: 1),
          color: isSelected ? Colors.black : Colors.transparent
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //icon also will be choosen
            Icon(Icons.event_available,color: isSelected ? Colors.white : Colors.black,size: 30,),
            SizedBox(height: 10,),
            Text(category,style: TextStyle(color: isSelected ? Colors.white : Colors.black),)
            //Text(category,style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,)
          ],
        ),
      ),
    );
  }
}
