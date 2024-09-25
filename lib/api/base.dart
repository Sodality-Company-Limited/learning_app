import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'dart:io';

class ApiService {
  final Dio dio;

  ApiService() : dio = Dio() {
    _initializeCacheStore();
  }

  Future<void> _initializeCacheStore() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final cacheStore = HiveCacheStore('${directory.path}/dio_cache');

      // Cache options
      final cacheOptions = CacheOptions(
        store: cacheStore,
        policy: CachePolicy.request,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: Duration(days: 7),
      );

      dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
    } catch (e) {
      print("Failed to initialize cache: $e");
    }
  }

  Future<Response?> fetchData(String url) async {
    try {
      final response = await dio.get(
        url,
        options: Options(
          extra: {'cache_policy': CachePolicy.refresh},
        ),
      );
      return response;
    } on DioException catch (e) {
      print("Error: ${e.message}");
      return null;
    }
  }
}
