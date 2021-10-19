
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';



class Gallery extends StatelessWidget {
  static const routeName = '/news-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Gallery"),
        ),
        body: Container(
          padding: EdgeInsets.all(2.0),
          child: SingleChildScrollView(
             child: InkWell(

                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Gridview())),
             
            //  scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  buildCard(),
                  buildCard(),
                  buildCard(),
               
                ],
              )
          )
             ),
        )
     
    );
  }
  Card buildCard() {
    var ran = Random();
   
    var cardImage = NetworkImage(
        'https://source.unsplash.com/random/800x600?events&' +
           ran.nextInt(100).toString());
    var supportingText =
        '  ';
    return Card(
        elevation: 2.0,
        child: Column(
          children: [
            ListTile(
              //title: Text(heading),
              //subtitle: Text(subheading),
             // trailing: Icon(Icons.favorite_outline),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
        
          ],
        ));
  }

  
  
}

// ignore: must_be_immutable
class Gridview extends StatelessWidget {
   static const routeName = '/gallery-screen';
 List<String> images = [
   
   //"assets/images/countries.jpg",
   "assets/images/culturalday.jpg",
   "assets/images/rugby.jpg",
   "assets/images/samoa.jpg",
   "assets/images/openday.jpg",
   "assets/images/graduation.jpg",
   "assets/images/seniorgrad.png",
   "assets/images/chancellor.jpg",
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      
      body: GridView.custom(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,crossAxisSpacing: 2, mainAxisSpacing: 2,
          
        ),
        // ignore: non_constant_identifier_names
        childrenDelegate: SliverChildBuilderDelegate((BuildContext, index){
            return Image.asset(images[index], fit: BoxFit.cover,);
          },
          childCount: 8,
        ),
        padding: EdgeInsets.all(10),
        
        
        shrinkWrap: true,
      )
    );
  }
 
}