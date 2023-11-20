import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app/models/BlogModel.dart';

class BlogDetails extends StatelessWidget {
  final Results blog;

  const BlogDetails({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat.yMMMMd().format(DateTime.parse(blog.publishedAt));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Blog Detail",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(blog.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    blog.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '${blog.newsSite}',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$formattedDate',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    blog.summary,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 140,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: FloatingActionButton(
            onPressed: () {
              _launchUrl(blog.url);
            },
            backgroundColor: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.newspaper_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  "See more...",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception("Gagal membuka url : ${_url}");
    }
  }
}
