import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:bruce_omukoko_portfolio/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactMePage extends StatelessWidget {
  const ContactMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Contact Me",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 60,
                color: orange,
              ),
            ),
          ),
          ElevatedButton.icon(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.black)
            ),
            label: const Text("Send me an email"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (c) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: Card(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Subject",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),


                          DropDownMenuButton<ContactSubject>(
                            options: ContactSubject.values,
                            isEquals: (a, b) => a == b,
                            onSelect: (a) async {
                              bool success = await sendEmail(
                                subject: a.value,
                                brief: 'Brief',
                                email: 'bruceaomukoko@gmail.com',
                              );

                              if(success && c.mounted) {
                                Navigator.of(c).pop();
                              }
                            },
                            label: (a) => a.value,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.email_outlined),
          ),
        ],
      ),
    );
  }
}

enum ContactSubject {
  consult("Consult"),
  job("Job"),
  contract("Contract"),
  other("Other"),
  feedback("Feedback");

  final String value;

  const ContactSubject(this.value);
}
