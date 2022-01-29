import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Details',
          style: GoogleFonts.berkshireSwash(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                'Tempore assumenda reprehenderit autem. At repellat similique rerum debitis. Sed voluptas consequuntur assumenda quisquam error temporibus laudantium sed quia.',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(),
                title: Text('Muhammad Buhari'),
                subtitle: Text('29th January, 2022'),
              ),
              Text(
                'Odio deleniti aut eum rerum voluptatem officia occaecati molestias magnam. Vel molestias ut nam incidunt. Ipsa praesentium rerum est deleniti et temporibus officiis eveniet debitis. Maxime vel repellat itaque sed dolorum ducimus quasi aut. Distinctio qui doloribus illo hic. Quod enim distinctio quaerat molestiae esse voluptatem rerum alias eveniet.\nRem nulla et enim. Consequuntur ea ut et delectus et. Amet cum consectetur at adipisci ipsam recusandae alias optio. Asperiores assumenda quia. Ad quam assumenda doloremque.\nTemporibus commodi quam et nisi est esse ea ducimus. Ratione aut cumque nihil voluptate quae tenetur aut adipisci consequuntur. Et ab culpa nihil a.\n\nOdio deleniti aut eum rerum voluptatem officia occaecati molestias magnam. Vel molestias ut nam incidunt. Ipsa praesentium rerum est deleniti et temporibus officiis eveniet debitis. Maxime vel repellat itaque sed dolorum ducimus quasi aut. Distinctio qui doloribus illo hic. Quod enim distinctio quaerat molestiae esse voluptatem rerum alias eveniet.\nRem nulla et enim. Consequuntur ea ut et delectus et. Amet cum consectetur at adipisci ipsam recusandae alias optio. Asperiores assumenda quia. Ad quam assumenda doloremque.\nTemporibus commodi quam et nisi est esse ea ducimus. Ratione aut cumque nihil voluptate quae tenetur aut adipisci consequuntur. Et ab culpa nihil a.',
                style: GoogleFonts.montserrat(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
