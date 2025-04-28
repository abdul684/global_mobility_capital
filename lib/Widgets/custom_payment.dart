import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../Pre_Check/pre_check.dart';
import 'custom_appbar.dart';
import 'custom_footer.dart';

class CustomPayment extends StatefulWidget {
  final GlobalKey<FormState> formsKey;
  final TextEditingController namesController;
  final TextEditingController emailsController;
  final TextEditingController phonesController;

  const CustomPayment({
    super.key,
    required this.formsKey,
    required this.namesController,
    required this.emailsController,
    required this.phonesController,
  });

  @override
  State<CustomPayment> createState() => _CustomPaymentState();
}

class _CustomPaymentState extends State<CustomPayment> {
  bool isChecked = false;
  bool _isLoading = false;

  void _submitForm() {
    if (widget.formsKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Form submitted successfully!')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 50, right: 16, left: 16, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to Pre-Check by GMC®—a transparent service giving global investors access to world-class due-diligence databases for '
                              'background checks, essential for citizenship or residency applications. This empowers investors to review their reports, ensuring'
                              ' confidence in the process and informed decisions about their investments.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 19,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Invoice',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Please provide the information below for the invoice.',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        Form(
                          key: widget.formsKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: widget.namesController,
                                decoration: InputDecoration(
                                  hintText: 'Full Legal Name-Surname',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.grey.shade400,
                                    fontSize: 17,
                                  ),
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
                                controller: widget.emailsController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.grey.shade400,
                                    fontSize: 17,
                                  ),
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
                              ),
                              const SizedBox(height: 16.0),
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
                                        showCountryOnly: false,
                                        showOnlyCountryWhenClosed: false,
                                        alignLeft: true,
                                        flagWidth: 30,
                                        padding: const EdgeInsets.symmetric(horizontal: 0),
                                      ),
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'e.g. 501 234 56 78',
                                          hintStyle: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.grey.shade400,
                                              fontSize: 17),
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
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'ID',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.grey.shade400,
                                      fontSize: 17),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your ID';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const Text(
                              '*If the invoice is for a company.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFE5C3F),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFE5C3F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: _isLoading
                                ? null
                                : () {
                              _submitForm();
                              if (widget.formsKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PreCheck()),
                                );
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
                                : const Text('Submit',style: TextStyle(fontSize: 16, color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomFooter(),
                ],
              ),
              const CustomAppbar(),
            ],
          ),
        ),
      ),
    );
  }
}
