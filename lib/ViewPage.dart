import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ViewPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://via.placeholder.com/400x250.png?text=Image+1',
    'https://via.placeholder.com/400x250.png?text=Image+2',
    'https://via.placeholder.com/400x250.png?text=Image+3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image slider
            Container(
              height: 200,
              width: double.infinity,
              child: PageView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(imageUrls[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 150,
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child : Text("this is the description"),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 231, 231, 88),
              ),
            ),
            SizedBox(height: 16),
            // Map section
            Container(
              height: 200, // Adjust the height as needed
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(7.956777518171203, 80.75369592789322), // Example coordinates
                    zoom: 12,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 54, 60, 65),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Book",
                  style: TextStyle(
                   fontSize: 17,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                  )
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
