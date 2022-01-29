import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                decoration: InputDecoration(
                  label: const Text('Body'),
                  hintText: 'Type your body here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(),
                title: Text('Muhammad Buhari'),
                subtitle: Text('29th January 2022'),
              ),
              const SizedBox(height: 15),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
