// import 'package:flutter/material.dart';
//
// class CustomAppbar extends StatefulWidget {
//   const CustomAppbar({super.key});
//
//   @override
//   State<CustomAppbar> createState() => _CustomAppbarState();
// }
//
// class _CustomAppbarState extends State<CustomAppbar> {
//   bool _isMenuOpen = false;
//
//   void toggleMenu() {
//     setState(() {
//       _isMenuOpen = !_isMenuOpen;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  GestureDetector(
//               onTap: () {
//                 if (_isMenuOpen) {
//                   setState(() {
//                     _isMenuOpen = false;
//                   });
//                 }
//               },
//               child: Container(
//                 color: Colors.white,
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   height: _isMenuOpen ? 1000 : 80,
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             height: 70,
//                             width: 100,
//                             child: Image.asset(
//                               'assets/images/logo.png',
//                             ),
//                           ),
//                           const Spacer(),
//                           DropdownButton<String>(
//                             value: "1",
//                             icon: const Icon(
//                               Icons.arrow_drop_down,
//                               color: Colors.black,
//                             ),
//                             items: [
//                               DropdownMenuItem<String>(
//                                 value: "1",
//                                 child: Center(
//                                   child: Image.asset(
//                                     'assets/precheck/uk.png',
//                                     height: 15,
//                                   ),
//                                 ),
//                               ),
//                               DropdownMenuItem<String>(
//                                 value: "2",
//                                 child: Center(
//                                   child: Image.asset(
//                                     'assets/precheck/turkey.png',
//                                     height: 15,
//                                   ),
//                                 ),
//                               )
//                             ],
//                             onChanged: (_value) {},
//                           ),
//                           IconButton(
//                             icon: Icon(
//                               _isMenuOpen ? Icons.close : Icons.menu,
//                               color: Colors.black,
//                             ),
//                             onPressed: toggleMenu,
//                           ),
//                         ],
//                       ),
//                       if (_isMenuOpen)
//                            Expanded(
//                              child: AnimatedOpacity(
//                               duration: const Duration(milliseconds: 300),
//                               opacity: _isMenuOpen ? 1.0 : 0.0,
//                               child: ListView(
//                                 shrinkWrap: true,
//
//                                 children: [
//                                   ListTile(
//                                     title: const Text('Citizenship'),
//                                     onTap: () {
//                                       toggleMenu();
//                                     },
//                                   ),
//                                   ListTile(
//                                     title: const Text('Residency'),
//                                     onTap: () {
//                                       toggleMenu();
//                                     },
//                                   ),
//                                   ListTile(
//                                     title: const Text('Real Estate'),
//                                     onTap: () {
//                                       toggleMenu();
//                                     },
//                                   ),
//                                   ListTile(
//                                     title: const Text('Investment'),
//                                     onTap: () {
//                                       toggleMenu();
//                                     },
//                                   ),
//                                   ListTile(
//                                     title: const Text('Pre-Check'),
//                                     onTap: () {
//                                       toggleMenu();
//                                     },
//                                   ),
//                                   ListTile(
//                                     title: const Text('Blog'),
//                                     onTap: () {
//                                       toggleMenu();
//                                     },
//                                   ),
//                                   ListTile(
//                                     title: const Text('Contact Us'),
//                                     onTap: () {
//                                       toggleMenu();
//                                     },
//                                   ),
//                                   ListTile(
//                                     title: const Text('About Us'),
//                                     onTap: () {
//                                       toggleMenu();
//                                     },
//                                   ),
//                                 ],
//                               ),
//                                                        ),
//                            ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//
//   }
// }


import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Pre-Check',
        style: TextStyle(
            color: Colors.teal.shade700,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
