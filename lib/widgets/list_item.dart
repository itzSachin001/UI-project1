import 'package:flutter/material.dart';

import '../models/item.dart';

class ListItem extends StatelessWidget {

  final String image;
  final String title;
  bool isVerified;

  ListItem(this.image,this.title,this.isVerified);

  Widget listItem(String image , String title,bool isVerified){
    return Container(
      height: 200,
      width: 100,
      margin: const EdgeInsets.all(10),

      child: Stack(
        children: [
          Container(
            height: 145,
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
              )
            ),
            // child: Image.asset(image,fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: SizedBox(
                height:35,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,style: const TextStyle(fontFamily: 'TitleFont')),
                      isVerified ? const Icon(Icons.verified,color: Colors.blue,) : const Text('')
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  listItem(image,title,isVerified);
  }
}
