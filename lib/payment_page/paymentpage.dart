import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:map_app/home_page/homepage.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title:  const  Center(child: Text('Pay Me' , style: TextStyle(color: Colors.white ,fontStyle: FontStyle.italic , fontWeight: FontWeight.bold),)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                cardBgColor: Colors.black,
                backgroundImage: 'assets/images/card_bg.png',
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              ),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Card Number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid card number';
                        }
                        return null;
                      },
                      onSaved: (value) => cardNumber = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Expiry Date'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid expiry date';
                        }
                        return null;
                      },
                      onSaved: (value) => expiryDate = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Card Holder Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid card holder name';
                        }
                        return null;
                      },
                      onSaved: (value) => cardHolderName = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'CVV'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid CVV';
                        }
                        return null;
                      },
                      onSaved: (value) => cvvCode = value!,
                      onChanged: (value) {
                        setState(() {
                          isCvvFocused = value.length == 3;
                        });
                      },
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: _onSubmit,style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue),),
                      child: const Padding(
                        padding:  EdgeInsets.all(20),
                        child:  Text('Click To Pay' ,style: TextStyle(color: Colors.white),),
                      ),

                      
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
  final form = formKey.currentState;
  if (form!.validate()) {
    form.save();
    // Simulating payment processing
    Future.delayed(const Duration(seconds: 2), () {
      if (true) {
        // Payment successful
        _showDialog('Payment Successful', 'Your payment was processed successfully.', true);
      } 
    });
  }
}

void _showDialog(String title, String message, bool success) {
  showDialog<AlertDialog>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (success) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
}
