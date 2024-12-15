import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.work, size: 40, color: Colors.blue),
        title: Text(service.title),
        subtitle: Text(service.category),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/service-detail',
            arguments: service,
          );
        },
      ),
    );
  }
}
