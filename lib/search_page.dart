import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _HomeState();
}

class _HomeState extends State<SearchPage> {
  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();
  
  // Sample list of destinations
  List<String> destinations = [
    "Sigiriya Rock",
    "Eiffel Tower",
    "Great Wall of China",
    "Grand Canyon",
   
  ];
  List<String> filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    filteredDestinations = destinations;
  }

  // Filter search results
  void _filterSearch(String query) {
    setState(() {
      filteredDestinations = destinations
          .where((destination) => destination.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // Handle bottom navigation bar taps
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
                controller: _searchController,
                onChanged: _filterSearch,
                decoration: InputDecoration(
                  hintText: "Search destinations...",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),

            SizedBox(height: 10),

            // 🔹 Search Results
            Expanded(
              child: filteredDestinations.isEmpty
                  ? Center(child: Text("No results found"))
                  : ListView.builder(
                      itemCount: filteredDestinations.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.location_on, color: Colors.blue),
                          title: Text(filteredDestinations[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Color.fromARGB(255, 23, 195, 66),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
