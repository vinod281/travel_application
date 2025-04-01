import 'package:flutter/material.dart';
import 'package:travel_app/Models/travelCardModel.dart';
import 'package:travel_app/Widgets/TravelCard.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
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
      body: _body(),

      // Navigation bar
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
        selectedItemColor:
            const Color.fromARGB(255, 23, 195, 66), // Highlight color
        unselectedItemColor: Colors.grey, // Default color
        showUnselectedLabels: true, // Show labels for unselected items
      ),
    );
  }

  _body() {
    return Stack(
      children: [
        Column(
          children: [
            _searchBar(),
            _cards(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 150, // Set a fixed height for the GridView
                child: GridView.count(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
              
                  children: [
                    CategoryCard(
                        icon: Icons.hotel, 
                        title: "Hotels", 
                        color: Colors.blue),
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
            ),
          ],
        )
      ],
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
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
    );
  }

  _cards() {
    return TravelCard(
        tCard: TCard(
            title: "Unawatuna",
            imageURL:
                "https://youmeunderthepalmtree.com/wp-content/uploads/2021/06/20190926_080608-1024x768.jpg",
            description: "Awesome Things to do in Unawatuna"));
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const CategoryCard({super.key, 
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
