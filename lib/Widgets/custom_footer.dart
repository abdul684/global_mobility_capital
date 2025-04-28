import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child:  Container(
          padding: const EdgeInsets.only(
              top: 70, right: 20, left: 20, bottom: 90),
          decoration: BoxDecoration(color: Color(0xFF3F5A5F)),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  height: 90,
                  'assets/precheck/preview.png',
                ),
              ),
              Center(
                child: Text(
                  'Global Mobility Capital',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  'Move your dreams beyond borders',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),

              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/precheck/r c.svg',
                  height: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Ruhi Emser Street, No.1,Floor',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  ' 4 Beykoz, Istanbul,.TUkriye |',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  ' 34820',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Legal Disclaimer',
                          style: TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          ' | ',
                          style: TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Company Description
                    const Text(
                      'Global Mobility Capital©2024\nis a Buyuk Ates Danismanlik LTD Brand',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 20),

                    // Services Section
                    Column(
                      children: const [
                        Text(
                          'Citizenship',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Residency',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Real Estate',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Investment',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    const SizedBox(height: 10),
                    SvgPicture.asset('assets/precheck/imc.svg'),
                    const SizedBox(height: 20),

                    // About Us, Blog, Contact Us
                    Column(
                      children: const [
                        Text(
                          'About Us',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Blog',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Contact Us',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Social Media Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.message, color: Colors.white),
                        SizedBox(width: 15),
                        Icon(Icons.camera_alt,
                            color: Colors.white), // Example for Instagram
                        SizedBox(width: 15),
                        Icon(Icons.email, color: Colors.white),
                        SizedBox(width: 15),
                        Icon(Icons.link,
                            color: Colors.white), // Example for LinkedIn
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
