import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:location_crud_service/data/data_sources/i_location_services/i_location_crud_service.dart';

import '../../data/data_sources/fire_store_data_sources/location_crud_service_geo_fire_point_fire_store_data_source_impl.dart';

void registerLocationCrudServiceGetItDi() {
  /// Service
  sl.registerLazySingleton<ILocationCrudService>(
    () => LocationCrudServiceGeoFirePointFireStoreDataSourceImpl(
      fireStoreDbService: sl(),
      iGeoFireLocationService: sl(),
    ),
  );
}
