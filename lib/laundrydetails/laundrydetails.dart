import "package:flutter/material.dart";
import "package:map_app/Laundrysingle/laundrysingledetails.dart";

class LaundryDetails extends StatefulWidget {
  const LaundryDetails({super.key});

  @override
  State<LaundryDetails> createState() => _LaundryDetailsState();
}

class _LaundryDetailsState extends State<LaundryDetails> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Color.fromARGB(240, 255, 255, 255),
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(224, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "Laundry Near Me ",
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        body: ListView(
          children: [
            _buildLaundryItem(
              context,
              'Sunshine Laundry',
              'assets/images/laundryimage1.jpeg',
              4.0,
              '1234 Main St, City',
              ['Wash', 'Dry Clean', 'Fold']
            ),
            _buildLaundryItem(
              context,
              'Quick Clean',
              'assets/images/laundryimage2.jpeg',
              4.5,
              '5678 Elm St, Town',
              ['Wash', 'Iron', 'Alteration'],
            ),
            _buildLaundryItem(
              context,
              ' We Wash',
              'assets/images/laundryimage3.jpeg',
              4.2,
              '91011 Oak St, Village',
              ['Wash', 'Dry Clean', 'Iron']
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLaundryItem(
    BuildContext context,
    String name,
    String imagePath,
    double rating,
    String address,
    List<String> services,
  ) {
    return GestureDetector(
      onTap: () {
        // Handle the tap, such as navigating to a new page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  LaundryDetailPage(name: name , rating: rating,address: address,services: services ,imagepath: imagePath),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 115,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Address: $address',
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
