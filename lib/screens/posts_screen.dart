import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posty/models/post.dart';
import 'package:posty/screens/manage_posts_screen.dart';
import 'package:posty/utilities/constants.dart';
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
      body: StreamBuilder<QuerySnapshot>(
          stream: posts.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  final post = Post.fromMap(snapshot.data?.docs[index].data()
                      as Map<String, dynamic>);
                  return PostCard(post: post);
                });
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
