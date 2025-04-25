import 'package:flutter/material.dart';
import 'package:travel_app/Models/travelCardModel.dart';
import 'package:travel_app/Widgets/TravelCard.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
            const Color.fromARGB(255, 14, 14, 14), // Highlight color
        unselectedItemColor: Colors.grey, // Default color
        showUnselectedLabels: true, // Show labels for unselected items
      ),
    );
  }

  _body() {
  return Stack(
    children: [
      SingleChildScrollView(
        child: Column(
          children: [
            _searchBar(),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Events",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 85, 85, 85),
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
            ),

            _carousel(),
            _categoryCard(),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Destination Plans",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 85, 85, 85),
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
            ),

            // GridView inside a Column
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling
                children: [
                  
                  _cards(),
                  _cards(),
                  _cards(),
                ],
              ),
            ),
          ],
        ),
      ),
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
                "https://www.ateasehotel.com/wp-content/uploads/2022/03/Round-tour-sri-lanka-at-ease--1024x576.png",
            description: "Awesome Things to do in Unawatuna"
            ),
        clr: Colors.black,
            
            );
  }

  _categoryCard() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            CategoryCard(
                icon: Icons.hotel, title: "Hotels", color: Colors.blueAccent),
            CategoryCard(
                icon: Icons.directions_car,
                title: "Vehicles",
                color: Colors.orangeAccent),
            CategoryCard(icon: Icons.map, title: "Guides", color: Colors.cyan),
            CategoryCard(
                icon: Icons.people, title: "People", color: Colors.green),
          ],
        ),
      ),
    );
  }

  _carousel() {
    return Center(
      child: Column(
        children: [
          CarouselSlider(
            items: [
              TravelCard(
                  tCard: TCard(
                      title: "Sigiriya",
                      imageURL:
                          "https://youmeunderthepalmtree.com/wp-content/uploads/2021/06/20190926_080608-1024x768.jpg",
                      description: "Sigiriya Rock (1785)"),clr: Colors.white,),
              TravelCard(
                  tCard: TCard(
                      title: "Sigiriya",
                      imageURL:
                          "https://beyondescapes.com/uploads/excursions/BW4YPnXzX3u1.jpg",
                      description: "Sigiriya Rock (1785)"),clr: Colors.white,),
              TravelCard(
                  tCard: TCard(
                      title: "Sigiriya",
                      imageURL:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm13ec-g2lYYJ54zzkAZKgMCq8qVMUiR0ZNg&s",
                      description: "Sigiriya Rock (1785)"),clr: Colors.white,),
              TravelCard(
                  tCard: TCard(
                      title: "Sigiriya",
                      imageURL:
                          "https://www.distinctdestinations.in/DistinctDestinationsBackEndImg/BlogImage/kandy-perahera-a-many-splendoured-spectacle-L-distinctdestinations.jpg",
                      description: "Sigiriya Rock (1785)"),clr: Colors.white,),
            ],
            options: CarouselOptions(
              height: 220,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
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
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
