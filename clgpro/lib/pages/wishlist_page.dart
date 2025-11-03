import 'package:flutter/material.dart';
import '../data/wishlist_data.dart';
import '../pages/pg_details_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: wishlist.isEmpty
          ? const Center(child: Text('No items in wishlist'))
          : ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final pg = wishlist[index];
                return ListTile(
                  leading: Image.network(pg.imageUrl, width: 50, height: 50),
                  title: Text(pg.name),
                
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        wishlist.remove(pg);
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PgDetailsPage(pg: pg),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}