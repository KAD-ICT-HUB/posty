import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posty/models/post.dart';
import 'package:posty/utilities/constants.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  String? authorId;
  _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      // Post data = Post(
      //   title: _titleController.text,
      //   body: _bodyController.text,
      //   authorId: authorId!,
      //   timestamp: Timestamp.now(),
      // );
      await posts
          .add({
            'title': _titleController.text,
            'body': _bodyController.text,
            'authorId': authorId!,
            'timestamp': Timestamp.now(),
          })
          .then(
            (value) => FlushbarHelper.createSuccess(
              message: 'Post added successfully',
              duration: const Duration(seconds: 3),
            ).show(context),
          )
          .catchError((error) {
            FlushbarHelper.createError(message: error.toString()).show(context);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Post',
          style: GoogleFonts.berkshireSwash(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 15),
              TextFormField(
                maxLines: 2,
                controller: _titleController,
                decoration: InputDecoration(
                  label: const Text('Title'),
                  hintText: 'Type your title here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                maxLines: 20,
                controller: _bodyController,
                decoration: InputDecoration(
                  label: const Text('Body'),
                  hintText: 'Type your body here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    final user = snapshot.data;
                    authorId = user?.uid;
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: user?.photoURL != null
                          ? CircleAvatar(
                              backgroundImage:
                                  NetworkImage('${user?.photoURL}'),
                            )
                          : const SizedBox.shrink(),
                      title: Text('${user?.displayName}'),
                      subtitle:
                          Text('${today.day} ${today.month} ${today.year}'),
                    );
                  }),
              const SizedBox(height: 15),
              InkWell(
                onTap: () => _submit(),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Post',
                      style: GoogleFonts.berkshireSwash(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
