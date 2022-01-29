import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posty/screens/manage_posts_screen.dart';
import 'package:posty/widgets/post_card.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.blog),
        title: Text(
          'Posty',
          style: GoogleFonts.berkshireSwash(fontSize: 28),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.signInAlt),
          ),
        ],
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
              builder: (_) => const ManagePostsScreen(),
            ),
          );
        },
        label: Text(
          'Manage Posts',
          style: GoogleFonts.berkshireSwash(fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
