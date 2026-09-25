// GRAFT Jobs Screen
// Displays job listings for customers and workers

import 'package:flutter/material.dart';
import '../../../core/widgets/empty_state.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  static const List<Map<String, dynamic>> sampleJobs = [
    {
      'title': 'Gardening Service',
      'area': 'Borrowdale',
      'budget': 15.0,
      'currency': 'USD',
    },
    {
      'title': 'Plumbing Repair',
      'area': 'Avondale',
      'budget': 30.0,
      'currency': 'USD',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
      ),
      body: sampleJobs.isEmpty
          ? const NoJobsEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sampleJobs.length,
              itemBuilder: (context, index) {
                final job = sampleJobs[index];
                return Card(
                  child: ListTile(
                    title: Text(job['title']),
                    subtitle: Text(job['area']),
                    trailing: Text('${job['currency']} ${job['budget']}'),
                    onTap: () => _onJobTap(context, job),
                  ),
                );
              },
            ),
    );
  }

  void _onJobTap(BuildContext context, Map<String, dynamic> job) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(job['title']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Area: ${job['area']}'),
            const SizedBox(height: 8),
            Text('Budget: ${job['currency']} ${job['budget']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}