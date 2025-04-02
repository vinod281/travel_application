import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // Track the selected tab

  // Function to handle navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            backgroundImage: NetworkImage(
                "https://imgcdn.stablediffusionweb.com/2024/12/24/f5b4d099-5591-4656-a0fe-436aa1a15709.jpg"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔹 Search Bar
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search here...",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Icon(Icons.star_border, color: Colors.grey),
                    ),
                  ),
                  border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),

            SizedBox(height: 20), // Spacing

            // 🔹 Surf Trips Card
            TravelCard(),

            SizedBox(height: 20), // Spacing

            // 🔹 Category Cards
            SizedBox(
              height: 120, // Set a fixed height for the GridView
              child: GridView.count(
                crossAxisCount: 3, // 3 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                
                children: [
                  CategoryCard(
                      icon: Icons.hotel, title: "Hotels", color: Colors.blue),
                  CategoryCard(
                      icon: Icons.people,
                      title: "Friends",
                      color: Colors.green),
                  CategoryCard(
                      icon: Icons.directions_car,
                      title: "Cars",
                      color: Colors.orange),
                ],
              ),
            ),

            SizedBox(height: 20), // Spacing

            // 🔹 Popular Destinations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Destinations",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Spacing

            Column(
              children: [
                // Destination 1
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.storiesbysoumya.com/wp-content/uploads/2021/11/sigiriya-rock-fortress.jpg"),
                  ),
                  title: Text("Sigiriya Rock"),
                  subtitle: Text("Sri Lanka"),
                  trailing: Icon(Icons.favorite_border),
                ),

                // Destination 2
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.storiesbysoumya.com/wp-content/uploads/2021/11/sigiriya-rock-fortress.jpg"),
                  ),
                  title: Text("Sigiriya Rock"),
                  subtitle: Text("Sri Lanka"),
                  trailing: Icon(Icons.favorite_border),
                ),

                // Destination 3
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.storiesbysoumya.com/wp-content/uploads/2021/11/sigiriya-rock-fortress.jpg"),
                  ),
                  title: Text("Sigiriya Rock"),
                  subtitle: Text("Sri Lanka"),
                  trailing: Icon(Icons.favorite_border),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Highlight the selected item
        onTap: _onItemTapped, // Handle taps
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 23, 195, 66), // Highlight color
        unselectedItemColor: Colors.grey, // Default color
        showUnselectedLabels: true, // Show labels for unselected items
      ),
    );
  }
}

// 🔹 Surf Trips Card Widget
class TravelCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          // Background Image
          Image.network(
            "https://www.storiesbysoumya.com/wp-content/uploads/2021/11/sigiriya-rock-fortress.jpg",
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
                  "Sigiriya Rock",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Travelers share their favorite destinations",
                  style: TextStyle(
                    color: Colors.white70,
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
    );
  }
}

// 🔹 Category Card Widget
class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const CategoryCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.withOpacity(0.1), // Transparent background
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 30),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "Deals",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
