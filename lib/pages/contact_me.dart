import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:bruce_omukoko_portfolio/utils/reusable_widgets.dart';
import 'package:bruce_omukoko_portfolio/utils/validations.dart';
import 'package:flutter/material.dart';

IconButton get emailMe => IconButton(
      onPressed: () => sendEmail(
        subject: 'subject',
        brief: 'Brief',
        email: 'bruceaomukoko@gmail.com',
      ),
      icon: const Icon(Icons.email_outlined),
    );

IconButton contactMe(BuildContext context) => IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (c) {
          return const ContactMeDialog();
        },
      ),
      icon: Icon(Icons.contact_page_outlined),
    );

class ContactMeDialog extends StatelessWidget {
  const ContactMeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 12.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 350,
          minWidth: 300,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text("Contact Me"),
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Feel free to drop me a message using the contact form below. I'll make sure to respond promptly upon receiving your message. Your feedback and inquiries are highly valued, and I look forward to hearing from you.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: DropDownMenuButton<ContactSubject>(
                        isEquals: (a, b) => a == b,
                        label: (i) => i.value,
                        onSelect: (i) {},
                        options: ContactSubject.values,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Message",
                        ),
                        validator: emailValidationErrorNotRequired,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PhoneNumberTextField(
                        onChanged: ({required code, required complete}) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email address",
                        ),
                        validator: emailValidationErrorNotRequired,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: RotatedBox(
                          quarterTurns: 0,
                          child: Icon(Icons.send),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Icon(Icons.cancel),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ContactSubject {
  consult("Consult"),
  job("Job"),
  contract("Contract"),
  feedback("Feedback"),
  other("Other");

  final String value;

  const ContactSubject(this.value);
}
