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
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contact Me"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Please drop a way i can get back to you as soon as i see it",
                ),
                DropDownMenuButton<ContactSubject>(
                  isEquals: (a, b) => a == b,
                  label: (i) => i.value,
                  onSelect: (i) {},
                  options: ContactSubject.values,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Body",
                  ),
                  validator: emailValidationErrorNotRequired,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                PhoneNumberTextField(
                  onChanged: ({required code, required complete}) {},
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email address",
                  ),
                  validator: emailValidationErrorNotRequired,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: RotatedBox(
                    quarterTurns: 55,
                    child: Icon(Icons.send),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Icon(Icons.cancel),
                ),
              ],
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
  other("Other");

  final String value;

  const ContactSubject(this.value);
}
