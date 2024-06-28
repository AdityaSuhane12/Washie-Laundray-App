import 'package:flutter/material.dart';
import 'package:map_app/Laundrysingle/laundrysingledetails.dart';
import 'package:map_app/laundrydetails/laundrydetails.dart';
import 'package:map_app/tracking_page/track_order.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(240, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40, bottom: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    "Indrapuri colony",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Searchbar(),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        toolbarHeight: 150,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ADITYA',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profilepicture.jpeg'),
                    radius: 50,
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Track Order'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TrackOrderPage()));
              },
            ),
            
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Wrap Scaffold with SingleChildScrollView
        child: Column(
          children: [
            const Topservices(),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 15),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10, left: 30),
                          child: Text("Popular Laundry Near By",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LaundryDetails()),
                                );
                              },
                              child: const Text('view all',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14)),
                            ))
                      ],
                    ),
                  ),
                  const LaundryNear(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(right: 35, bottom: 25),
        child: SearchBar(
          hintText: "Search laundry nearby ",
          hintStyle:
              MaterialStatePropertyAll(TextStyle(fontStyle: FontStyle.italic)),
          leading: Icon(Icons.search),
          constraints: BoxConstraints(minHeight: 50),
        ));
  }
}

class Topservices extends StatefulWidget {
  const Topservices({super.key});

  @override
  State<Topservices> createState() => _TopservicesState();
}

class _TopservicesState extends State<Topservices> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, top: 20),
      child: Container(
        width: 350,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 0),
          child: Column(
            children: [
              const Text(
                'Top Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle button 1 tap
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/topserviceimage1.jpeg',
                          height: 100,
                        ),
                        const SizedBox(height: 10),
                        const Text('WASH',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle button 2 tap
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/topserviceimage2.png',
                          height: 100,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'DRY CLEAN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LaundryNear extends StatefulWidget {
  const LaundryNear({super.key});

  @override
  State<LaundryNear> createState() => _LaundryNearState();
}

class _LaundryNearState extends State<LaundryNear> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildItem(
                context,
                'Shiv Sagar Dry cleaner',
                'assets/images/laundryimage2.jpeg',
                4.3,
                '5678 Elm St, Town',
                ['Wash', 'Iron', 'Alteration']),
            _buildItem(
                context,
                'Sunshine Laundry',
                'assets/images/laundryimage1.jpeg',
                4,
                '1234 Main St, City',
                ['Wash', 'Dry Clean', 'Fold']),
            _buildItem(context, 'We wash', 'assets/images/laundryimage3.jpeg',
                4.4, '91011 Oak St, Village', ['Wash', 'Dry Clean', 'Iron']),
            // Add more laundry suggestions here
          ],
        ),
      ),
    );
  }
}

Widget _buildItem(BuildContext context, String title, String imagePath,
    double rating, String address, List<String> services) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LaundryDetailPage(
                name: title,
                rating: rating,
                address: address,
                services: services,
                imagepath: imagePath)),
      );
    },
    child: Container(
      width: 200,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset(
                  imagePath,
                  height: 150,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
