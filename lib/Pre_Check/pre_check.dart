import 'package:flutter/material.dart';
import '../Widgets/custom_appbar.dart';
import '../Widgets/custom_footer.dart';
import '../Widgets/custom_form.dart';

class PreCheck extends StatefulWidget {
  const PreCheck({super.key});

  @override
  State<PreCheck> createState() => _PreCheckState();
}

class _PreCheckState extends State<PreCheck> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  // Container(
                  //   height: 620,
                  //   padding: const EdgeInsets.only(top: 160, right: 15, left: 15),
                  //   decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/precheck/Clip-path-group-21.png'),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       const Text(
                  //         "Global Mobility Capital allows investors to check their eligibility for any Global Residency or Citizenship by Investment Program through the world’s most reputable Due-Diligence firm in 5 days.",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 19,
                  //         ),
                  //       ),
                  //       const Row(
                  //         children: [
                  //           Text(
                  //             "What is Pre-Check",
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 25,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       const Text(
                  //         "Pre-Check® is Global Mobility Capital’s proprietary service that allows investors to effortlessly access their due-diligence background reports. Instead of applying and potentially facing rejections from different countries, Pre-Check provides investors with direct access to the world’s most comprehensive due-diligence database. This ensures that you always receive accurate and trustworthy information. Investors simply need to provide their basic details, and voila!",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //     padding: const EdgeInsets.only(
                  //         top: 70, right: 20, left: 20, bottom: 90),
                  //     decoration: BoxDecoration(color: Color(0xFF35575D)),
                  //     child: CustomForm(formKey: formKey, nameController: nameController, emailController: emailController)
                  // ),
                  CustomForm(formKey:formKey, nameController: nameController, emailController: emailController, phoneController: phoneController,),
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
