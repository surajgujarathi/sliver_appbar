import 'package:flutter/material.dart';

class RidesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 3, // Number of ride items
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RideCard(
              title: 'ride to ${['cochi', 'vayanad', 'kerala'][index]} hills',
              organizerName: 'manish surapaneni',
              bikeName: 'TVS',
              distance: '900 km',
              date: 'July 20 2024',
              location: 'hyderabad',
              coRiders: 12,
              imagePath: 'assets/bike.avif', // Add your image asset
            ),
          );
        },
      ),
    );
  }
}

class RideCard extends StatelessWidget {
  final String title;
  final String organizerName;
  final String bikeName;
  final String distance;
  final String date;
  final String location;
  final int coRiders;
  final String imagePath;

  const RideCard({
    required this.title,
    required this.organizerName,
    required this.bikeName,
    required this.distance,
    required this.date,
    required this.location,
    required this.coRiders,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 16.0,
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          organizerName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(bikeName),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text('Co Riders: $coRiders'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.directions, color: Colors.red),
                        const SizedBox(width: 4.0),
                        Text(distance),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.red),
                        const SizedBox(width: 4.0),
                        Text(date),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_city, color: Colors.red),
                        const SizedBox(width: 4.0),
                        Text(location),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
