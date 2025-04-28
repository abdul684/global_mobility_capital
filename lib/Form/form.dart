import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Matches the light grey background
      body: Container(padding: EdgeInsets.only(top: 200,right: 50,left: 40),
        decoration: BoxDecoration(
            color: Colors.teal.shade900
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 50,right: 16, left: 16, bottom: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: // Top padding
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'Name, Surname',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            )),
                        const SizedBox(width: 16.0),
                        Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: CountryCodePicker(
                                      onChanged: (countryCode) {
                                        print("Country selected: ${countryCode.dialCode}");
                                      },
                                      initialSelection: 'TR', // Default country code
                                      favorite: const ['+92', 'Pakistan'],
                                      showFlag: true,
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                      alignLeft: false,
                                    ),
                                    hintText: 'e.g 501 234 56 78',
                                    labelStyle: const TextStyle(color: Colors.black54),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 12.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                              labelText: "Nationality",
                              labelStyle: const TextStyle(color: Colors.black54),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: "",
                                child: Text("Choose"),
                              ),
                              DropdownMenuItem(
                                value: "TR",
                                child: Text("Turkey"),
                              ),
                              DropdownMenuItem(
                                value: "PAK",
                                child: Text("Pakistan"),
                              ),
                              DropdownMenuItem(
                                value: "US",
                                child: Text("Unites States"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.upload_file_outlined),
                            SizedBox(width: 8.0),
                            Text(
                              "Upload Passport Copy",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text("Choose File",
                              style: TextStyle(color: Colors.black87)),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          "*Please upload the bio page of your passport, in clear color scan and in PDF format.",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 16.0),
                        const Row(
                          children: [
                            Icon(Icons.drive_folder_upload),
                            SizedBox(width: 8.0),
                            Text(
                              "Upload ID Copy",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey.shade400),
                          ),
                          onPressed: () {},
                          child: const Text("Choose File",
                              style: TextStyle(color: Colors.black87)),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          "*Please upload the bio page of your ID, in clear color scan and in PDF format.",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(1),
                        },
                        border: TableBorder.symmetric(
                          inside: BorderSide(color: Colors.grey.shade300),
                        ),
                        children: const [
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Pre-Check Due Diligence for One',
                                  style: TextStyle(fontSize: 15)),
                            ),
                            Text('€840,00', style: TextStyle(fontSize: 15)),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('VAT (20%)', style: TextStyle(fontSize: 15)),
                            ),
                            Text('€168,00', style: TextStyle(fontSize: 15)),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Grand Total',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Text(
                              '€1,008.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ])
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Choose Payment Method',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Please choose your payment method',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Radio(
                            value: "credit_card", groupValue: "payment", onChanged: (_) {}),
                        const Text("Credit Card"),
                        const SizedBox(width: 8.0),
                        const Icon(Icons.credit_card, size: 20),
                        Radio(
                            value: "wire_transfer",
                            groupValue: "payment",
                            onChanged: (_) {}),
                        const Text("Wire Transfer"),
                      ],
                    ),
                    const SizedBox(height: 8.0),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  const Color(0xFFFE5C3F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text(
                        "Proceed to Payment",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
