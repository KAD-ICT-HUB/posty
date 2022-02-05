import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posty/models/post.dart';
import 'package:posty/screens/post_details_screen.dart';
import 'package:posty/utilities/constants.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);
  final bool user = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => const PostDetails(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: kLigthBoxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.berkshireSwash(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              post.body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    boxShadow: kLigthBoxShadow,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Muhammad Buhari',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Friday 28th, 2022.',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                if (user)
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_circle_rounded,
                      size: 35,
                      color: Colors.red,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
