import '../api/location_api_service.dart';
import '../models/base_response.dart';
import '../models/district_dto.dart';
import '../models/province_dto.dart';
import '../dto/provinces_data_wrapper.dart';

class LocationRepository {
  final LocationApiService _apiService;

  LocationRepository(this._apiService);

  Future<BaseResponse<ProvincesDataWrapper>> getProvinces() async {
    try {
      final response = await _apiService.getProvincesRaw();

      if (response is! Map<String, dynamic>) {
        throw Exception(
          'Expected response to be Map but got ${response.runtimeType}. Response: $response',
        );
      }

      final message = response['message'] as String;
      final data = response['data'];

      if (data is List<dynamic>) {
        final provincesList = data
            .map((e) => ProvinceDto.fromJson(e as Map<String, dynamic>))
            .toList();

        final provincesWrapper = ProvincesDataWrapper(provinces: provincesList);

        return BaseResponse<ProvincesDataWrapper>(
          message: message,
          data: provincesWrapper,
        );
      } else if (data is Map<String, dynamic> &&
          data.containsKey('provinces')) {
        // Fallback: if backend follows Apidog spec
        final provincesList = (data['provinces'] as List<dynamic>)
            .map((e) => ProvinceDto.fromJson(e as Map<String, dynamic>))
            .toList();

        final provincesWrapper = ProvincesDataWrapper(provinces: provincesList);

        return BaseResponse<ProvincesDataWrapper>(
          message: message,
          data: provincesWrapper,
        );
      } else {
        throw Exception(
          'Unexpected data format. Expected List or Map with provinces key, but got ${data.runtimeType}',
        );
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  Future<BaseResponse<List<DistrictDto>>> getDistricts(
    String provinceCode,
  ) async {
    try {
      return await _apiService.getDistricts(provinceCode);
    } catch (e) {
      rethrow;
    }
  }
}
