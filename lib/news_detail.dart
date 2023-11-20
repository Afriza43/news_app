import 'package:flutter/material.dart';
import 'package:news_app/models/NewsModel.dart';

class NewsDetail extends StatelessWidget {
  final Results news;

  const NewsDetail({Key? key, required this.news}) : super(key: key);

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
            child: Image.network(news.imageUrl),
          ),
          Text(
            news.title,
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
              news.summary,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('News Site: ${news.newsSite}'),
          SizedBox(height: 20),
          Text('Published At: ${news.publishedAt}'),
          SizedBox(height: 20),
          Text('Updated At: ${news.updatedAt}'),
          SizedBox(height: 20),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
