import 'package:flutter/material.dart';
import '../data/pg_data.dart';
import '../data/wishlist_data.dart';
//import '../modals/pg.dart';
import 'pg_details_page.dart';


class StaysPage extends StatelessWidget {
  final String collegeId;
  final String collegeName;

  const StaysPage({super.key, required this.collegeId, required this.collegeName});

  @override
  Widget build(BuildContext context) {
    List<PG> stays = pgList.where((pg) => pg.collegeId == collegeId).toList();

    return Scaffold(
      appBar: AppBar(title: Text("$collegeName - PGs")),
      body: ListView.builder(
        itemCount: stays.length,
        itemBuilder: (context, index) {
          final stay = stays[index];
          return Card(
            child: ListTile(
              leading: Image.network(stay.imageUrl, width: 80, fit: BoxFit.cover),
              title: Text(stay.name),
              subtitle: Text("${stay.location} • ₹${stay.price}"),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // ignore: collection_methods_unrelated_type
                  if (!wishlist.contains(stay)) {
                    // ignore: unnecessary_cast
                    wishlist.add(stay as PG);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${stay.name} added to wishlist")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${stay.name} is already in wishlist")),
                    );
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PgDetailsPage(pg: stay),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}