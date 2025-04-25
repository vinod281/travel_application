import 'package:flutter/material.dart';

class TravelPlan extends StatelessWidget {
  const TravelPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Day 1: Arrival in Negombo'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Morning"),
            _buildListTile(
              "Arrive at Bandaranaike International Airport",
              "Transfer to Negombo (Approx. 20 minutes by car).",
              Icons.airport_shuttle,
            ),
            const SizedBox(height: 16),

            _buildSectionTitle("Afternoon"),
            _buildListTile(
              "Visit the Dutch Canal",
              "Explore the canal originally built by the Dutch in the 17th century.",
              Icons.landscape,
            ),
            _buildListTile(
              "Visit the Fish Market",
              "See fishermen unloading their catch and a variety of seafood.",
              Icons.set_meal,
            ),
            _buildListTile(
              "Boat Ride on the Dutch Canal",
              "Enjoy a relaxing boat ride through the tranquil waters.",
              Icons.directions_boat,
            ),
            const SizedBox(height: 16),

            _buildSectionTitle("Evening"),
            _buildListTile(
              "Seafood Dinner",
              "Dine at a beachfront restaurant overlooking the Indian Ocean.",
              Icons.restaurant,
            ),
            _buildListTile(
              "Overnight Stay",
              "Stay overnight in Negombo.",
              Icons.bed,
            ),
            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to Day 2
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Next Day",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData icon) {
    return Card(
      color: Colors.grey[900],
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }
}