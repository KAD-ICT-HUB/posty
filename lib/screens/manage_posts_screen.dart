import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posty/models/post.dart';
import 'package:posty/screens/post_screen.dart';
import 'package:posty/screens/posts_screen.dart';
import 'package:posty/utilities/constants.dart';
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
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => const PostsScreen(),
            ),
          ),
          icon: const Icon(Icons.home),
        ),
        title: Text(
          'Manage Posts',
          style: GoogleFonts.berkshireSwash(),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: posts
              .where('authorId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
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
