import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "TRAVERSE",
          style: TextStyle(

            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            
          ),
        ),

        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/4122/4122901.png"),
          ),
          
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon( Icons.menu, color: Colors.black),
            ),
        ],
        
        
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ]
              ),

              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search here...",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),

                      child: Icon(Icons.star_border,color: Colors.grey,),
                    )
                  ),

                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15), 
                ),
              ),
            ),
          ],
        ),
      ),
      
      
      
    );
  }
}
