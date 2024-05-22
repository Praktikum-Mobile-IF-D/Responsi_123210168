import 'package:flutter/material.dart';
import 'package:responsi/model/database.dart';
import 'package:responsi/model/job_data.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late BookmarkDB _bookmarkDB;
  late List<int> _bookmarkedJobIds;

  @override
  void initState() {
    super.initState();
    _initializeBookmarkDB();
  }

  Future<void> _initializeBookmarkDB() async {
    _bookmarkDB = await BookmarkDB.open();
    _loadBookmarkedJobs();
  }

  Future<void> _loadBookmarkedJobs() async {
    final bookmarkedJobs = await _bookmarkDB.getBookmarkedJobs();
    setState(() {
      _bookmarkedJobIds = bookmarkedJobs;
    });
  }

  @override
  void dispose() {
    _bookmarkDB.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Jobs'),
      ),
      body: _bookmarkedJobIds.isEmpty
          ? Center(child: Text('No bookmarked jobs'))
          : ListView.builder(
        itemCount: _bookmarkedJobIds.length,
        itemBuilder: (context, index) {
          return _buildJobItem(_bookmarkedJobIds[index]);
        },
      ),
    );
  }

  Widget _buildJobItem(int jobId) {
    // You should retrieve job details based on the job ID from your data source
    // This is just a placeholder
    final job = Jobs(
      id: jobId,
      jobTitle: 'Job Title $jobId',
      companyName: 'Company $jobId',
      jobDescription: 'Job Description for job $jobId',
      companyLogo: 'https://example.com/logo.png',
    );

    return ListTile(
      title: Text(job.jobTitle ?? ''),
      subtitle: Text(job.companyName ?? ''),
      onTap: () {
        // Navigate to job detail screen passing the job details
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DetailScreen(job: job)),
        // );
      },
    );
  }
}
