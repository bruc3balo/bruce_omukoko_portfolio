import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:bruce_omukoko_portfolio/utils/reusable_widgets.dart';
import 'package:bruce_omukoko_portfolio/utils/validations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phone_form_field/phone_form_field.dart';

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
          return ContactMeDialog();
        },
      ),
      icon: Icon(Icons.contact_page_outlined),
    );

class Message {
  final String type;
  final String message;
  final String? number;
  final String? email;
  final DateTime sentAt;
  Message({
    required this.type,
    required this.message,
    this.number,
    this.email,
    required this.sentAt,
  });

  static Message fromJson(Map<String, dynamic> json) {
    return Message(
      type: json['type'],
      message: json['message'],
      number: json['number'],
      email: json['email'],
      sentAt: json['sent_at'],
    );
  }

  Map<String, dynamic> get toJson => {
        'type': type,
        'message': message,
        'number': number,
        'email': email,
        'sent_at' : sentAt,
      };
}

class ContactMeDialog extends StatelessWidget {
  ContactMeDialog({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController messageController = TextEditingController();
  final PhoneController numberController = PhoneController();
  final TextEditingController emailController = TextEditingController();
  final ValueNotifier<ContactSubject> subjectNotifier =
      ValueNotifier(ContactSubject.other);
  final List<ContactSubject> subjects = ContactSubject.values;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 12.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
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
              child: Form(
                key: _formKey,
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
                        child: ValueListenableBuilder(
                            valueListenable: subjectNotifier,
                            builder: (_, subject, __) {
                              return DropDownMenuButton<ContactSubject>(
                                initialSelection: subjects
                                    .where((e) => e == subject)
                                    .firstOrNull,
                                isEquals: (a, b) => a == b,
                                label: (i) => i.value,
                                onSelect: (i) => subjectNotifier.value = i,
                                options: subjects,
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: messageController,
                          decoration: const InputDecoration(
                            labelText: "Message",
                          ),
                          validator: (m) {
                            if (m == null) return "Please leave a message";

                            if (m.length < 5) {
                              return "Please describe so i can get back to you";
                            }

                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhoneNumberTextField(
                          phoneController: numberController,
                          onChanged: ({required code, required complete}) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: "Email address",
                          ),
                          validator: emailValidationErrorNotRequired,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cancel"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  var valid =
                                      _formKey.currentState?.validate() ??
                                          false;
                                  if (!valid) return;
                                  var message = Message(
                                    type: subjectNotifier.value.value,
                                    message: messageController.text,
                                    number: '${numberController.value.countryCode}${numberController.value.nsn}',
                                    email: emailController.text,
                                    sentAt: DateTime.now(),
                                  );

                                  print("Saving message");

                                  var db = FirebaseFirestore.instance;

                                  var collection = 'message/${message.type}/${message.sentAt.day}-${message.sentAt.month}-${message.sentAt.year}';

                                  final ref = db.collection(collection)
                                      .withConverter<Message>(
                                    fromFirestore: (snapshots, _) {
                                      return Message.fromJson(
                                        snapshots.data()!,
                                      );
                                    },
                                    toFirestore: (movie, _) {
                                      return movie.toJson;
                                    },
                                  );


                                  try {
                                    var doc = await ref.add(message);
                                  } catch(e) {
                                    print(e.toString());
                                  }

                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text("Send"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
