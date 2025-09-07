# location_crud_service

A lightweight and extensible Dart package for updating user location data in Firebase Firestore using GeoFirePoint. This service is ideal for Flutter apps requiring geolocation tracking, real-time location updates, or location-based features with Firestore.

## Features

- Update Firestore documents with current geolocation.
- Uses GeoFirePoint format for location storage.
- Built with clean architecture and dependency injection principles.

## Getting Started

### Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  location_crud_service: <latest_version>
```

Then run:

```bash
flutter pub get
```

### Prerequisites

This package requires:

- A Firestore service implementing `IFireStoreDbService`
- A location provider implementing `ILocationServiceGeoFirePointProvider`

### Register the Service

Use dependency injection to register the service:

```dart
sl.registerLazySingleton<ILocationCrudService>(
  () => LocationCrudServiceGeoFirePointFireStoreDataSourceImpl(
    fireStoreDbService: sl(),
    iGeoFireLocationService: sl(),
  ),
);
```

## Usage

```dart
final locationService = sl<ILocationCrudService>();

final success = await locationService.updateLocation(
  id: "user_123",
  path: "users",
);

if (success) {
  print("Location updated successfully!");
} else {
  print("Failed to update location.");
}
```

## API

### `updateLocation`

```dart
Future<bool> updateLocation({
  required String id,
  required String path,
  String field = "position",
});
```

Updates the document at the specified path and ID with the current GeoFirePoint location.

## Contributing

Contributions are welcome! Please open issues or submit pull requests.

## License

MIT License. See [LICENSE](LICENSE) for details.

