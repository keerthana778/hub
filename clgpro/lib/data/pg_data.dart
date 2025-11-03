class PG {
  final String id;
  final String collegeId;
  final String name;
  final String location;
  final double price;
  final String imageUrl;
  final String description;

  PG({
    required this.id,
    required this.collegeId,
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  String? get collegeName => null;

  get rent => null;
}

List<PG> pgList = [
  // College 1 - 3 PGs
  PG(
    id: 'pg1',
    collegeId: 'college1',
    name: 'Sunrise Boys Hostel',
    location: 'Near Gate 2, Main Road',
    price: 5000,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-vKlddJuZO62kxgqIVTsOcRb4sbrGlB6ASH4EaXfuReLJLraGkoO9KuQ&s',
    description: 'Spacious rooms, 24/7 water, WiFi, mess facility.',
  ),
  PG(
    id: 'pg2',
    collegeId: 'college1',
    name: 'Green View Girls PG',
    location: 'Opposite Metro Station',
    price: 5500,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxaAsm-EV9v0ikztfFw1E0RD7BceT_D_uLJ2kGX32EXQ&s',
    description: 'AC rooms, healthy food, security cameras.',
  ),
  PG(
    id: 'pg3',
    collegeId: 'college1',
    name: 'Elite Comfort PG',
    location: '5 min walk from college',
    price: 6000,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9bR1QKL2CCJvgyKVPlUCJ-WtB1at1O3bcsj1babCT5w&s',
    description: 'Premium rooms, laundry service, gym access.',
  ),

  // College 2 - 2 PGs
  PG(
    id: 'pg4',
    collegeId: 'college2',
    name: 'City Light PG',
    location: 'Beside Mall Road',
    price: 4500,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzMy-KG9jI1Scm6I2pbCv_SqLPaCh_yMyA6qlTm76XMA&s',
    description: 'Budget rooms, homemade food, WiFi included.',
  ),
  PG(
    id: 'pg5',
    collegeId: 'college2',
    name: 'Blue Sky PG',
    location: 'Near Park Street',
    price: 4800,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDuBbK7Oc0iONhuZfJlCF3Ta-9_iurkfhIxrG80oL47w&s',
    description: 'Friendly environment, furnished rooms.',
  ),

  // College 3 - 2 PGs
  PG(
    id: 'pg6',
    collegeId: 'college3',
    name: 'Lake View Hostel',
    location: 'Next to Lake Garden',
    price: 5300,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDuBbK7Oc0iONhuZfJlCF3Ta-9_iurkfhIxrG80oL47w&s',
    description: 'Beautiful view, peaceful environment.',
  ),
  PG(
    id: 'pg7',
    collegeId: 'college3',
    name: 'Mountain Top PG',
    location: 'Hill Road',
    price: 5800,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxaAsm-EV9v0ikztfFw1E0RD7BceT_D_uLJ2kGX32EXQ&s',
    description: 'Scenic surroundings, trekking options nearby.',
  ),
];