import 'package:country_code_picker/country_code_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_credit_transfer_form.dart';
import 'custom_wire_transfer_form.dart';

class CustomForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const CustomForm(
      {super.key,
        required this.formKey,
        required this.nameController,
        required this.emailController,
        required this.phoneController});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  String? selectedPassport;
  bool isPassportFileSelected = false;
  String? selectedID;
  bool isIDFileSelected = false;
  String _selectedPaymentMethod = 'credit card' ;
  bool _isLoading = false;

  void _navigateToWireTransferForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomWireTransferForm()),
    );
  }

  void _handlePaymentChange(String? value) {
    setState(() {
      _selectedPaymentMethod = value!;
    });

  }
  void _navigateToCreditTransferForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomCreditTransferForm()),
    );
  }

  void _choosePassportFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedPassport = result.files.single.name;
        isPassportFileSelected = true;
      });

      print('File selected: ${result.files.single.path}');
    } else {
      setState(() {
        isPassportFileSelected = false; // Mark file as not selected
      });
      print('File selection canceled');
    }
  }


  void _chooseIDFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedID = result.files.single.name;
        isIDFileSelected = true;
      });

      print('File selected: ${result.files.single.path}');
    } else {
      setState(() {
        isIDFileSelected = false;
      });
      print('File selection canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> countryNames = [
      "Afghanistan",
      "Albania",
      "Algeria",
      "Andorra",
      "Angola",
      "Antigua and Barbuda",
      "Argentina",
      "Armenia",
      "Australia",
      "Austria",
      "Azerbaijan",
      "The Bahamas",
      "Bahrain",
      "Bangladesh",
      "Barbados",
      "Belarus",
      "Belgium",
      "Belize",
      "Benin",
      "Bhutan",
      "Bolivia",
      "Bosnia and Herzegovina",
      "Botswana",
      "Brazil",
      "Brunei",
      "Bulgaria",
      "Burkina Faso",
      "Burundi",
      "Cabo Verde",
      "Cambodia",
      "Cameroon",
      "Canada",
      "Central African Republic",
      "Chad",
      "Chile",
      "China",
      "Colombia",
      "Comoros",
      "Congo, Democratic Republic of the",
      "Congo, Republic of the",
      "Costa Rica",
      "Côte d’Ivoire",
      "Croatia",
      "Cuba",
      "Cyprus",
      "Czech Republic",
      "Denmark",
      "Djibouti",
      "Dominica",
      "Dominican Republic",
      "East Timor (Timor-Leste)",
      "Ecuador",
      "Egypt",
      "El Salvador",
      "Equatorial Guinea",
      "Eritrea",
      "Estonia",
      "Eswatini",
      "Ethiopia",
      "Fiji",
      "Finland",
      "France",
      "Gabon",
      "The Gambia",
      "Georgia",
      "Germany",
      "Ghana",
      "Greece",
      "Grenada",
      "Guatemala",
      "Guinea",
      "Guinea-Bissau",
      "Guyana",
      "Haiti",
      "Honduras",
      "Hungary",
      "Iceland",
      "India",
      "Indonesia",
      "Iran",
      "Iraq",
      "Ireland",
      "Israel",
      "Italy",
      "Jamaica",
      "Japan",
      "Jordan",
      "Kazakhstan",
      "Kenya",
      "Kiribati",
      "Korea, North",
      "Korea, South",
      "Kosovo",
      "Kuwait",
      "Kyrgyzstan",
      "Laos",
      "Latvia",
      "Lebanon",
      "Lesotho",
      "Liberia",
      "Libya",
      "Liechtenstein",
      "Lithuania",
      "Luxembourg",
      "Madagascar",
      "Malawi",
      "Malaysia",
      "Maldives",
      "Mali",
      "Malta",
      "Marshall Islands",
      "Mauritania",
      "Mauritius",
      "Mexico",
      "Micronesia, Federated States of",
      "Moldova",
      "Monaco",
      "Mongolia",
      "Montenegro",
      "Morocco",
      "Mozambique",
      "Myanmar (Burma)",
      "Namibia",
      "Nauru",
      "Nepal",
      "Netherlands",
      "New Zealand",
      "Nicaragua",
      "Niger",
      "Nigeria",
      "North Macedonia",
      "Norway",
      "Oman",
      "Pakistan",
      "Palau",
      "Panama",
      "Papua New Guinea",
      "Paraguay",
      "Peru",
      "Philippines",
      "Poland",
      "Portugal",
      "Qatar",
      "Romania",
      "Russia",
      "Rwanda",
      "Saint Kitts and Nevis",
      "Saint Lucia",
      "Saint Vincent and the Grenadines",
      "Samoa",
      "San Marino",
      "Sao Tome and Principe",
      "Saudi Arabia",
      "Senegal",
      "Serbia",
      "Seychelles",
      "Sierra Leone",
      "Singapore",
      "Slovakia",
      "Slovenia",
      "Solomon Islands",
      "Somalia",
      "South Africa",
      "Spain",
      "Sri Lanka",
      "Sudan",
      "Sudan, South",
      "Suriname",
      "Sweden",
      "Switzerland",
      "Syria",
      "Taiwan",
      "Tajikistan",
      "Tanzania",
      "Thailand",
      "Togo",
      "Tonga",
      "Trinidad and Tobago",
      "Tunisia",
      "Turkey",
      "Turkmenistan",
      "Tuvalu",
      "Uganda",
      "Ukraine",
      "United Arab Emirates",
      "United Kingdom",
      "United States",
      "Uruguay",
      "Uzbekistan",
      "Vanuatu",
      "Vatican City",
      "Venezuela",
      "Vietnam",
      "Yemen",
      "Zambia",
      "Zimbabwe"
    ];

    return Container(
      padding: EdgeInsets.only(top: 50, right: 16, left: 16, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Pre-Check by GMC®—a transparent service giving global investors access to world-class due-diligence databases for '
                  'background checks, essential for citizenship or residency applications. This empowers investors to review their reports, ensuring'
                  ' confidence in the process and informed decisions about their investments.',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 19,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                TextFormField(
                  controller: widget.nameController,
                  decoration: InputDecoration(
                    hintText: 'Name, Surname',
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey.shade400,
                        fontSize: 15),
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
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey.shade400,
                        fontSize: 15),
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
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CountryCodePicker(
                          onChanged: (countryCode) {
                            print("Country selected: ${countryCode.dialCode}");
                          },
                          showDropDownButton: true,
                          initialSelection: 'TR',
                          favorite: const ['+90', '+92'],
                          showFlag: true,
                          alignLeft: true,
                          flagWidth: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'e.g. 501 234 56 78',
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey.shade400,
                                fontSize: 15),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            // Simple validation for a valid phone number based on country code
                            final phonePattern = RegExp(r'^[0-9]{10,15}$');
                            if (!phonePattern.hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Nationality",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  items: countryNames.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  onChanged: (String? selectedCountry) {
                    if (selectedCountry != null) {
                      print("Selected country: $selectedCountry");
                    }
                  },
                  validator: (value) =>
                  value == null ? 'Please select your nationality' : null,
                  dropdownColor: Colors.white,
                  menuMaxHeight: 300.0,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage('assets/precheck/passport.png'),
                      size: 24.0,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      "Upload Passport Copy",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Column(
                  children: [
                    OutlinedButton(
                      onPressed: _choosePassportFile,
                      child: const Text(
                        "Choose File",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    if (selectedPassport != null)
                      Text(
                        'Selected file: $selectedPassport',
                        style: TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "*Please upload the bio page of your passport, in clear color scan and in PDF format.",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16.0),
                const Row(
                  children: [
                    ImageIcon(
                      AssetImage('assets/precheck/id.png'),
                      size: 24.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      "Upload ID Copy",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Column(
                  children: [
                    OutlinedButton(
                      onPressed: _chooseIDFile,
                      child: const Text(
                        "Choose File",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    if (selectedID != null)
                      Text(
                        'Selected file: $selectedID',
                        style: TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                  ],
                ),

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
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        height: 50.0,
                        color: Colors.grey.shade100,
                        child: Text('Pre-Check Due Diligence for One'),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(top: 15, left: 20),
                        color: Colors.grey.shade100,
                        child: Text(
                          '€840,00',
                        ),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        height: 50.0,
                        child: Text('VAT (20%)'),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        height: 50.0,
                        child: Text('€168,00'),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        height: 50.0,
                        color: Colors.grey.shade100,
                        child: Text('Grand Total'),
                      ),
                    ),
                    TableCell(
                        child: Container(
                          padding: EdgeInsets.only(top: 15, left: 20),
                          color: Colors.grey.shade100,
                          height: 50.0,
                          child: Text('€1.008,00'),
                        )),
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
            Column(
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: "credit_card",
                      groupValue: _selectedPaymentMethod,
                      onChanged: _handlePaymentChange,
                    ),
                    const Text("Credit Card"),
                    const SizedBox(width: 8.0),
                    SvgPicture.asset('assets/precheck/cards.svg', height: 20),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "wire_transfer",
                      groupValue: _selectedPaymentMethod,
                      onChanged: _handlePaymentChange,
                    ),
                    const Text("Wire Transfer"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFE5C3F),
                  borderRadius: BorderRadius.circular(15)
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 50,
              width: MediaQuery.of(context).size.width / 1.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFE5C3F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: _isLoading
                    ? null
                    : () async {
                  if (widget.formKey.currentState!.validate() &&
                      isPassportFileSelected &&
                      isIDFileSelected) {
                    setState(() {
                      _isLoading = true;
                    });

                    await Future.delayed(const Duration(seconds: 3));

                    setState(() {
                      _isLoading = false;
                    });

                    if (_selectedPaymentMethod == "wire_transfer") {
                      _navigateToWireTransferForm();
                    } else if (_selectedPaymentMethod == "credit_card"){
                      _navigateToCreditTransferForm();
                    };

                  } else {
                    if (!isPassportFileSelected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a passport file')),
                      );
                    }
                    if (!isIDFileSelected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select an ID file')),
                      );
                    }
                  }
                },

                child: _isLoading
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Processing....',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ],
                )
                    : const Text(
                  "Proceed to Payment",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
