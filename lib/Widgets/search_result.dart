import 'package:flutter/material.dart';
import 'package:travel_app/search_page.dart';

class SearchResultCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const SearchResultCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            width: 70,
            height: 70,
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
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          // Handle tapping on the result (e.g., navigate to details page)
        },
      ),
    );
  }
}
