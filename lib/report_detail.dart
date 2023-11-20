import 'package:flutter/material.dart';
import 'package:news_app/models/ReportModel.dart';

class ReportDetail extends StatelessWidget {
  final Results report;

  const ReportDetail({Key? key, required this.report}) : super(key: key);

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
            child: Image.network(report.imageUrl),
          ),
          Text(
            report.title,
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
              report.summary,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('report Site: ${report.newsSite}'),
          SizedBox(height: 20),
          Text('Published At: ${report.publishedAt}'),
          SizedBox(height: 20),
          Text('Updated At: ${report.updatedAt}'),
          SizedBox(height: 20),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
