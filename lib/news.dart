import 'package:flutter/material.dart';
import 'package:news_app/api/news_datasource.dart';
import 'package:news_app/models/NewsModel.dart';
import 'package:news_app/news_detail.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Berita Terkini",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: _buildListNewsBody(),
    );
  }

  Widget _buildListNewsBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: ApiDataSource.instance.loadNews(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            News news = News.fromJson(snapshot.data);
            return _buildSuccessSection(news);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(News results) {
    return ListView.builder(
      itemCount: results.results.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(results.results[index]);
      },
    );
  }

  Widget _buildItemUsers(Results news) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsDetail(
            news: news,
          );
        }));
      },
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Image.network(
                  news.imageUrl,
                  width: 200,
                  height: 100,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(height: 8.0),
                    Text(news.newsSite),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
