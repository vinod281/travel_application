import 'package:flutter/material.dart';


class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Text("Picture"),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.grey[200],
              child: Text("Description of the place."),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text("See on the map"),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Book"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
