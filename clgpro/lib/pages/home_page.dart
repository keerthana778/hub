import 'package:flutter/material.dart';
import 'stays_page.dart';
import 'wishlist_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> colleges = [
    {
      'id': 'college1',
      'name': 'M.S. Ramaiah',
      'subtitle': 'mathikere, bangalore-560054',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC59n6Pc4i793rLZtPSFNacfL8VaUOLwENdA&s'
    },
    {
      'id': 'college2',
      'name': 'R.V.C.E',
      'subtitle': 'mysore road, banglore-560059',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2d-Rd1IMnEkLnfPk43bewlmYB2h6c1FCs0g&s'
    },
    {
      'id': 'college3',
      'name': 'B.M.S.C.E.',
      'subtitle': 'Bull temple road, bangalore-560019',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL9_7Av8RGD0bxlYNU_X3apVCoFiLBtwcaFjow2RdjjSDnvbP4IJaX_Nl6&s=10'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select College')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("More", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Wishlist"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const WishlistPage()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: colleges.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // two cards per row
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final college = colleges[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StaysPage(
                      collegeId: college['id']!,
                      collegeName: college['name']!,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.blueAccent, width: 2),
                ),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        college['imageUrl']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.school, size: 100),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      college['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      college['subtitle']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}