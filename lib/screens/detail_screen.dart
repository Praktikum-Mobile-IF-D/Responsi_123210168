import 'package:flutter/material.dart';
import 'package:responsi/model/job_data.dart';

class DetailScreen extends StatelessWidget {
  final Jobs job;

  DetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(job.jobTitle ?? 'Job Detail')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: job.companyLogo != null
                  ? Image.network(
                job.companyLogo!,
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
              )
                  : Container(), // Placeholder in case there is no logo
            ),
            SizedBox(height: 20), // Space between the logo and company name
            Text(
              job.companyName ?? 'No company',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(job.jobDescription ?? 'No description'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add bookmark logic here
              },
              child: Text('Bookmark'),
            ),
          ],
        ),
      ),
    );
  }
}
