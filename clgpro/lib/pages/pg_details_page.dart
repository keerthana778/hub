import 'package:clgpro/data/pg_data.dart';
//import 'package:clgpro/modals/pg.dart';
import 'package:flutter/material.dart';
//import '../data/wishlist_data.dart'; // where PG is defined

class PgDetailsPage extends StatelessWidget {
  final PG pg;

  const PgDetailsPage({Key? key, required this.pg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pg.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              pg.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              pg.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(pg.location, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('₹${pg.price}/month',
                style: const TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 16),
            Text(pg.description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}