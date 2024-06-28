import 'package:flutter/material.dart';
import 'package:map_app/services_page/serviceselect.dart';

class LaundryDetailPage extends StatelessWidget {
  final String name;
  final double rating;
  final String address;
  final List<String> services;
  final String imagepath;

  const LaundryDetailPage({
    super.key,
    required this.name,
    required this.rating,
    required this.address,
    required this.services,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[400],
        title: const Center(child:  Text('Laundry Details' , style: TextStyle(color: Colors.white),)),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
        children: [
          // Large image
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              imagepath,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16.0),
          // Name and rating
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // Address
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Address: $address',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          const SizedBox(height: 16.0),
          // Services provided
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Services:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: services
                      .map((service) => Text(
                            '- $service',
                            style: const TextStyle(fontSize: 18.0),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const ServicesPage(),)
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12.0), // Adjust padding here
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Click For Booking',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18), // Increase font size here
              ),
            ),
          )
        ],
      ),
    );
  }
}
