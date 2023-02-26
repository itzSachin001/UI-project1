import 'package:flutter/material.dart';
import 'package:project_assign/widgets/list_item.dart';

import '../models/item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var index = 0;

  final List<Item> _item = [
    Item(id: DateTime.now().toString(),image: 'assets/images/person1.jpg', title: 'Sana',subtitle: 'Hii!',numberOfMessage: 1),
    Item(id: DateTime.now().toString(),image: 'assets/images/person2.jpg', title: 'Sara', isVerified: true,subtitle: 'Hii!',numberOfMessage: 0),
    Item(id: DateTime.now().toString(),image: 'assets/images/person3.jpg', title: 'Shyam', isVerified: true,subtitle: 'Typing...',numberOfMessage: 11),
    Item(id: DateTime.now().toString(),image: 'assets/images/person4.png', title: 'Ram',subtitle: 'Typing...',numberOfMessage: 3),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person1.jpg'),
                      radius: 30,
                    ),
                    Text('Find Flames',style: TextStyle(fontSize: 23,fontFamily: 'TitleFont'),),

                    Icon(Icons.filter_list,size: 35,)
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx,i) => ListItem( _item[i].image, _item[i].title,_item[i].isVerified),
                  itemCount: _item.length,
                ),
              ),

              SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30,right: 30),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          labelText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                      ),
                    ),
                    Container(
                      height: 320,
                      margin: const EdgeInsets.only(top: 50),
                      child: ListView.builder(
                        itemBuilder: (ctx,i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(_item[i].image),
                            radius: 30,
                          ),
                          title: Row(
                            children: [
                              Text(_item[i].title,style: const TextStyle(fontSize: 20,fontFamily: 'Name'),),
                              _item[i].isVerified ? const Icon(Icons.verified,color: Colors.blue,) : const Text('')
                            ],
                          ),
                          subtitle: Text(_item[i].subtitle),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('13:10'),
                              _item[i].numberOfMessage > 0 ? CircleAvatar(
                                radius: 10,
                                child: FittedBox(
                                    child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: _item[i].numberOfMessage > 9 ? const Text('9+') : Text('${_item[i].numberOfMessage}')
                                    )),
                              ) : const Text('')
                            ],
                          ),
                        ),
                        itemCount: _item.length,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (idx){
          index = idx;
          setState(() {

          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.open_in_browser_sharp),label: 'Open in browser'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_calendar_rounded),label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Message')
        ],
      )
    );
  }
}
