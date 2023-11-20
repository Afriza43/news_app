import 'package:flutter/material.dart';
import 'package:news_app/models/BlogModel.dart';

class BlogsDetails extends StatelessWidget {
  final Results blog;

  const BlogsDetails({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Detail'),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Image.network(blog.imageUrl),
          ),
          Text(
            blog.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              blog.summary,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('blog Site: ${blog.newsSite}'),
          SizedBox(height: 20),
          Text('Published At: ${blog.publishedAt}'),
          SizedBox(height: 20),
          Text('Updated At: ${blog.updatedAt}'),
          SizedBox(height: 20),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
