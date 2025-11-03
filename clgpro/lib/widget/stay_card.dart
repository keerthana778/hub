import 'package:clgpro/data/pg_data.dart';
//import 'package:clgpro/modals/pg.dart';
import 'package:flutter/material.dart';


class StayCard extends StatelessWidget {
  final PG stay;
  final VoidCallback onAddToWishlist;
  final VoidCallback onTap;

  const StayCard({
    super.key,
    required this.stay,
    required this.onAddToWishlist,
    required this.onTap, required Null Function() onWishlistToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(stay.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
        title: Text(stay.name),
        subtitle: Text('${stay.rent} • ${stay.location}'),
        trailing: IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: onAddToWishlist,
        ),
        onTap: onTap,
      ),
    );
  }
}