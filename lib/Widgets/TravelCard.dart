import 'package:flutter/material.dart';
import 'package:travel_app/Models/travelCardModel.dart';
import 'package:travel_app/Widgets/PlanCard.dart';

class TravelCard extends StatelessWidget {

  final TCard tCard;
  final Color clr;

  const TravelCard({super.key,required this.tCard,required this.clr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color:Colors.grey.withOpacity(0.1),
          child: Stack(
            children: [
              // Background Image
              Image.network(
                tCard.imageURL,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
                
              // Dark Gradient Overlay
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
                
              // Text & Button
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tCard.title,
                      style: TextStyle(
                        color:clr,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      tCard.description,
                      style: TextStyle(
                        color:clr,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Explore Now"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
