// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:global_mobility_capital/Pre_Check/pre_check.dart';
// import 'package:global_mobility_capital/Screens/webview_screen.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//
//   late PersistentTabController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//   }
//
//
//   List<Widget> _buildScreens() {
//     return [
//       const WebPageScreen(
//           url: 'https://glmbcp.com/'),
//       const PreCheck(),
//       Container(color: Colors.white,
//           child: Center(child: Image.asset('assets/images/soon.png',height: 200,width: 200,))),
//     ];
//   }
//
//
//
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     TextStyle menuTextStyle = const TextStyle(
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       fontFamily: 'Poppins',
//     );
//
//     return [
//       PersistentBottomNavBarItem(
//         icon: SvgPicture.asset('assets/images/home s.svg'),
//         inactiveIcon: SvgPicture.asset('assets/images/home us.svg'),
//         title: "Home",
//         textStyle: menuTextStyle,
//         activeColorSecondary: Colors.white,
//         activeColorPrimary: const Color(0xFFD8745E),
//         inactiveColorPrimary: Colors.black,
//       ),
//       PersistentBottomNavBarItem(
//         icon: SvgPicture.asset('assets/images/check s.svg'),
//         inactiveIcon: SvgPicture.asset('assets/images/check.svg'),
//         title: "Pre-Check",
//         textStyle: menuTextStyle,
//         activeColorSecondary: Colors.white,
//         activeColorPrimary: const Color(0xFFD8745E),
//         inactiveColorPrimary: Colors.black,
//       ),
//       PersistentBottomNavBarItem(
//         icon: SvgPicture.asset('assets/images/user s.svg'),
//         inactiveIcon: SvgPicture.asset('assets/images/user us.svg'),
//         title: "Pass Cal",
//         textStyle: menuTextStyle,
//         activeColorSecondary: Colors.white,
//         activeColorPrimary: const Color(0xFFD8745E),
//         inactiveColorPrimary: Colors.black,
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       backgroundColor: Colors.white,
//       confineToSafeArea: true,
//       stateManagement: true,
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       navBarStyle: NavBarStyle.style7,
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_mobility_capitall/Screens/webview_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../Pre_Check/pre_check.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const WebPageScreen(
        url: 'https://glmbcp.com/',
      ),
      const PreCheck(),
      Container(color: Colors.white, child: Center(child: Image.asset('assets/images/soon.png', height: 200, width: 200,))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    TextStyle menuTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );

    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/images/home s.svg'),
        inactiveIcon: SvgPicture.asset('assets/images/home us.svg'),
        title: "Home",
        textStyle: menuTextStyle,
        activeColorSecondary: Colors.white,
        activeColorPrimary: const Color(0xFFD8745E),
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/images/check s.svg'),
        inactiveIcon: SvgPicture.asset('assets/images/check.svg'),
        title: "Pre-Check",
        textStyle: menuTextStyle,
        activeColorSecondary: Colors.white,
        activeColorPrimary: const Color(0xFFD8745E),
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/images/user s.svg'),
        inactiveIcon: SvgPicture.asset('assets/images/user us.svg'),
        title: "Pass Cal",
        textStyle: menuTextStyle,
        activeColorSecondary: Colors.white,
        activeColorPrimary: const Color(0xFFD8745E),
        inactiveColorPrimary: Colors.black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      confineToSafeArea: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}
