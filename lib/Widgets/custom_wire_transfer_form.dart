import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'custom_appbar.dart';
import 'custom_footer.dart';
import 'custom_payment.dart';

class CustomWireTransferForm extends StatefulWidget {

  const CustomWireTransferForm({super.key});

  @override
  State<CustomWireTransferForm> createState() => _CustomWireTransferFormState();
}

class _CustomWireTransferFormState extends State<CustomWireTransferForm> {
  final GlobalKey<FormState> formsKey = GlobalKey<FormState>();
  final TextEditingController namesController = TextEditingController();
  final TextEditingController emailsController = TextEditingController();
  final TextEditingController phonesController = TextEditingController();


  String? selectedTransactionCopy;
  bool isTransactionCopySelected = false;
  bool _isLoading = false;


  void _chooseTransactionCopy() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Specify allowed file types
    );

    if (result != null) {
      setState(() {
        selectedTransactionCopy = result.files.single.name;
        isTransactionCopySelected = true;
      });

      print('File selected: ${result.files.single.path}');
    } else {
      setState(() {
        isTransactionCopySelected = false;
      });
      print('File selection canceled');
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
                    padding:
                    EdgeInsets.only(top: 50, right: 16, left: 16, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
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
                          height: 30,
                        ),
                        Text(
                          'Wire Transfer',
                          style: TextStyle(
                              color: Colors.teal.shade700,
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '*Please wire the payment to one of the given bank accounts below.\n\n'
                              '**Once the payment reaches the bank account, an invoice will be sent to your e-mail '
                              'and the pre-check procedure will begin.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: Table(
                            border: TableBorder.symmetric(
                              inside: BorderSide(color: Colors.grey.shade300),
                            ),
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                        ),
                                        height: 60.0,
                                        color: Colors.grey.shade100,
                                        child: Text(
                                          'Bank',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ))),
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                        ),
                                        height: 60.0,
                                        color: Colors.grey.shade100,
                                        child: Text(
                                          'Details',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )))
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                        ),
                                        height: 80.0,
                                        child: Text(
                                          'Ziraat Bank Turkey\nEuro €',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        ))),
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                        ),
                                        height: 80.0,
                                        child: Text(
                                          'IBAN: TR00129012138012107912198\nSWIFT: TCZRBTX',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        )))
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(top: 20),
                                        height: 80.0,
                                        color: Colors.grey.shade100,
                                        child: Text(
                                          'Wio Bank UAE\nEuro €',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        ))),
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(top: 20),
                                        height: 80.0,
                                        color: Colors.grey.shade100,
                                        child: Text(
                                          'IBAN: TR00129012138012107912198\nSWIFT: TCZRBTX',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        )))
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                        ),
                                        height: 80.0,
                                        child: Text(
                                          'Garanti Bank TurkeyEuro €',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        ))),
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                        ),
                                        height: 80.0,
                                        child: Text(
                                          'IBAN: TR00129012138012107912198\nSWIFT: TCZRBTX',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        )))
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(top: 20),
                                        height: 80.0,
                                        color: Colors.grey.shade100,
                                        child: Text(
                                          'AltPay Latvia\nEuro €',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        ))),
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.only(top: 20),
                                        height: 80.0,
                                        color: Colors.grey.shade100,
                                        child: Text(
                                          'IBAN: TR00129012138012107912198\nSWIFT: TCZRBTX',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        )))
                              ]),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Account Holder Name: Büyük ateş Danışmanlık Limited Şirketi',
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Account Holder Address: Ruhi Esmer Sokak, No:1, Kat:4, Kavacık, İstanbul, Türkiye, 34820',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Please provide your full legal name and that the payment is for pre-check service in the purpose of transaction part.',
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                                Text(
                                  'Upload Transaction Copy',
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
                                    onPressed: _chooseTransactionCopy,
                                    child: Text(
                                      'Choose File',
                                      style: TextStyle(color: Colors.black87),
                                    )),
                                SizedBox(height: 16.0),
                                if (selectedTransactionCopy != null)
                                  Text(
                                    'Selected file: $selectedTransactionCopy',
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
                        const SizedBox(height: 15.0),
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: _isLoading
                                ? null
                                : () async {
                              if (selectedTransactionCopy == null || selectedTransactionCopy!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select a transaction copy before proceeding.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              setState(() {
                                _isLoading = true;
                              });

                              await Future.delayed(const Duration(seconds: 3));

                              setState(() {
                                _isLoading = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Completed')),
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CustomPayment(
                                    formsKey: formsKey,
                                    namesController: namesController,
                                    emailsController: emailsController,
                                    phonesController: phonesController,
                                  ),
                                ),
                              );
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
                              "Complete Payment",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
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
