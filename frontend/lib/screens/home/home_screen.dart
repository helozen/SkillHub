import 'package:flutter/material.dart';
import '../../services/service_service.dart';
import '../../models/service.dart';
import '../../widgets/service_card.dart';
import '../../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ServiceService serviceService = ServiceService();
  late Future<List<Service>> services;

  @override
  void initState() {
    super.initState();
    services = serviceService.fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SkillHub - Home'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<Service>>(
        future: services,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No services available.'));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((service) => ServiceCard(service: service))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
