import 'package:firestore_db_impl/data/data_sources/firestore_db_service_impl.dart';
import 'package:firestore_db_impl/data/data_sources/i_data_sources/i_firestor_bd_service.dart';
import 'package:flutter/material.dart';
import 'package:location_crud_service/data/data_sources/fire_store_data_sources/location_crud_service_geo_fire_point_fire_store_data_source_impl.dart';
import 'package:location_crud_service/data/data_sources/i_location_services/i_location_crud_service.dart';
import 'package:location_crud_service/location_crud_service.dart';
import 'package:get_it/get_it.dart';
import 'package:location_reader/data/data_sources/i_location_services/i_location_service_geo_fire_point_provider.dart';

final sl = GetIt.instance;

void main() {
  // Assume implementations of the following services are registered here:
  sl.registerLazySingleton<IFireStoreDbService>(() => FireStoreDbServiceImpl());
  // sl.registerLazySingleton<ILocationServiceGeoFirePointProvider>(() => GeoFireLocationServiceImpl());

  // Register the location CRUD service
  sl.registerLazySingleton<ILocationCrudService>(
        () => LocationCrudServiceGeoFirePointFireStoreDataSourceImpl(
      fireStoreDbService: sl(),
      iGeoFireLocationService: sl(),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location CRUD Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LocationUpdatePage(),
    );
  }
}

class LocationUpdatePage extends StatelessWidget {
  const LocationUpdatePage({super.key});

  Future<void> _updateLocation() async {
    final locationService = sl<ILocationCrudService>();

    final success = await locationService.updateLocation(
      id: "user_123",
      path: "users",
    );

    debugPrint(success ? "Location updated!" : "Failed to update location.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location CRUD Service")),
      body: Center(
        child: ElevatedButton(
          onPressed: _updateLocation,
          child: const Text("Update Location"),
        ),
      ),
    );
  }
}