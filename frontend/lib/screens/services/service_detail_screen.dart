import 'package:flutter/material.dart';
import '../../models/service.dart';

class ServiceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Service service =
        ModalRoute.of(context)!.settings.arguments as Service;

    return Scaffold(
      appBar: AppBar(
        title: Text(service.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category: ${service.category}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Description: ${service.description}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Location: ${service.location}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Contact: ${service.contactInfo}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
