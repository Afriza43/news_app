import 'package:flutter/material.dart';
import 'package:news_app/api/report_datasource.dart';
import 'package:news_app/models/ReportModel.dart';
import 'package:news_app/report_detail.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Laporan Terkini",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: _buildListReportBody(),
    );
  }

  Widget _buildListReportBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: ApiDataSource.instance.loadReport(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            Report report = Report.fromJson(snapshot.data);
            return _buildSuccessSection(report);
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

  Widget _buildSuccessSection(Report results) {
    return ListView.builder(
      itemCount: results.results.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(results.results[index]);
      },
    );
  }

  Widget _buildItemUsers(Results report) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ReportDetail(
            report: report,
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
                  report.imageUrl,
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
                      report.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(height: 8.0),
                    Text(report.newsSite),
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
