import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posty/screens/post_screen.dart';
import 'package:posty/widgets/post_card.dart';

class ManagePostsScreen extends StatefulWidget {
  const ManagePostsScreen({Key? key}) : super(key: key);

  @override
  State<ManagePostsScreen> createState() => _ManagePostsScreenState();
}

class _ManagePostsScreenState extends State<ManagePostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Posts',
          style: GoogleFonts.berkshireSwash(),
        ),
      ),
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
            return const PostCard();
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => const PostScreen(),
            ),
          );
        },
        label: Text(
          'Create Post',
          style: GoogleFonts.berkshireSwash(fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
