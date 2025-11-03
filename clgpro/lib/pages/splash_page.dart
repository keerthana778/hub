import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnim;

  // image url you can replace
  final String imageUrl = 'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=1200&q=80';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Start fade animation
    _controller.forward();

    // After a short delay push (not replace) the HomePage so HomePage can pop back.
    Future.delayed(const Duration(milliseconds: 4500), () {
      // small scale-down of image before navigating for nicer feel (optional)
      _controller.reverse().then((value) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // A pleasant gradient background and subtle decorations
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnim,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFe0f2f1), Color(0xFFb2dfdb)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // decorated circular image card
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      )
                    ],
                    gradient: const RadialGradient(
                      colors: [Colors.white, Color(0xFFE8F5F2)],
                    ),
                  ),
                  child: ClipOval(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: progress.expectedTotalBytes != null
                                  ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stack) => Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.broken_image, size: 56),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // small app title + subtitle with subtle style
                const Text(
                  'Stay HUB',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 0.6),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Find hostels & PGs near your college',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),

                const SizedBox(height: 24),

                // decorative row of small dots
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: i == 2 ? Colors.blueAccent : Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 4, offset: const Offset(0, 2))
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}