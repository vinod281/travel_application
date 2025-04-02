import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();

  // Sample list of destinations with images and descriptions
  List<Map<String, String>> destinations = [
    {
      "name": "Sigiriya Rock",
      "image": "https://beyondescapes.com/uploads/excursions/BW4YPnXzX3u1.jpg",
      "description": "An ancient rock fortress in Sri Lanka."
    },
    {
      "name": "Eiffel Tower",
      "image": "https://cdn.britannica.com/67/5867-050-7BC6D0F7/Eiffel-Tower-Seine-River-Paris.jpg",
      "description": "One of the most famous landmarks in Paris, France."
    },
    {
      "name": "Great Wall of China",
      "image": "https://www.travelchinaguide.com/images/photogallery/2013/greatwall/badaling/great-wall-290.jpg",
      "description": "A historical fortification stretching across northern China."
    },
    {
      "name": "Grand Canyon",
      "image": "https://www.nps.gov/grca/planyourvisit/images/grandview.jpg",
      "description": "A breathtaking natural wonder in Arizona, USA."
    },
  ];

  List<Map<String, String>> filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    filteredDestinations = destinations;
  }

  // 🔹 Filter search results
  void _filterSearch(String query) {
    setState(() {
      filteredDestinations = destinations
          .where((destination) =>
              destination["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // 🔹 Handle bottom navigation bar taps
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
        title: const Text(
          "TRAVERSE",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://imgcdn.stablediffusionweb.com/2024/12/24/f5b4d099-5591-4656-a0fe-436aa1a15709.jpg"),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
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
                decoration: const InputDecoration(
                  hintText: "Search destinations...",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Search Results
            Expanded(
              child: filteredDestinations.isEmpty
                  ? const Center(child: Text("No results found"))
                  : ListView.builder(
                      itemCount: filteredDestinations.length,
                      itemBuilder: (context, index) {
                        return SearchResultCard(
                          title: filteredDestinations[index]["name"]!,
                          imageUrl: filteredDestinations[index]["image"]!,
                          description: filteredDestinations[index]["description"]!,
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
        selectedItemColor: const Color.fromARGB(255, 23, 195, 66),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

// 🔹 Search Result Card Widget
class SearchResultCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const SearchResultCard({
    required this.title,
    required this.imageUrl,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}
