import 'package:flutter/material.dart';
import 'package:map_app/payment_page/paymentpage.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<String> services = ['Washing', 'Ironing', 'Dry Cleaning'];
  final List<String> items = [
    'Shirt',
    'Pant',
    'Blazer',
    'T-shirt',
    'Other Clothes'
  ];
  final Map<String, double> itemCosts = {
    'Shirt': 10.0,
    'Pant': 15.0,
    'Blazer': 20.0,
    'T-shirt': 8.0,
    'Other Clothes': 12.0,
  };

  final Map<String, double> serviceCosts = {
    'Washing': 5.0,
    'Ironing': 3.0,
    'Dry Cleaning': 7.0,
  };

  Map<String, bool> selectedServices = {};
  Map<String, int> selectedItems = {};

double calculateTotalCost() {
  double totalCost = 0.0;

  // Calculate total cost of selected services
  selectedServices.forEach((service, isSelected) {
    if (isSelected) {
      totalCost += serviceCosts[service]!;
    }
  });

  // Calculate total cost of selected items
  selectedItems.forEach((item, quantity) {
    totalCost += itemCosts[item]! * quantity;
  });

  return totalCost;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Select Services and Items',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          for (String service in services)
            CheckboxListTile(
              title: Text(service, style: const TextStyle(fontSize: 18.0)),
              value: selectedServices.containsKey(service)
                  ? selectedServices[service]
                  : false,
              onChanged: (bool? value) {
                setState(() {
                  selectedServices[service] = value!;
                });
              },
              secondary: service == 'Ironing'
                  ? const Icon(Icons.iron, size: 30)
                  : service == 'Dry Cleaning'
                      ? const Icon(Icons.cleaning_services, size: 30)
                      : const Icon(Icons.local_laundry_service, size: 30),
            ),
          const Divider(),
          for (String item in items)
            ListTile(
              title: Text(item, style: const TextStyle(fontSize: 18.0)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: selectedItems.containsKey(item) &&
                            selectedItems[item]! > 0
                        ? () {
                            setState(() {
                              selectedItems[item] =
                                  (selectedItems[item]! - 1).clamp(0, 99);
                            });
                          }
                        : null,
                  ),
                  Text(
                    selectedItems.containsKey(item)
                        ? '${selectedItems[item]} x'
                        : '0 x',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        selectedItems[item] = (selectedItems[item] ?? 0) + 1;
                      });
                    },
                  ),
                ],
              ),
              leading: Image.asset(
                'assets/images/$item.jpeg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          const Divider(),
          ListTile(
            title: const Text(
              'Total Cost:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              '\$${calculateTotalCost().toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
         Padding(
  padding: const EdgeInsets.only(top: 25.0),
  child: ElevatedButton(
    onPressed: () {
      if (calculateTotalCost() > 0 && selectedItems.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PaymentPage()),
        );
      }
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue),
    ),
    child: const Padding(
      padding:  EdgeInsets.all(16.0),
      child: Text(
        'Pay Now',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),

        ],
      ),
    );
  }
}
