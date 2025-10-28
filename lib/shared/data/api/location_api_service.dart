import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/base_response.dart';
import '../models/district_dto.dart';
import '../models/province_dto.dart';
import '../dto/provinces_data_wrapper.dart';

part 'location_api_service.g.dart';

@RestApi()
abstract class LocationApiService {
  factory LocationApiService(Dio dio, {String baseUrl}) = _LocationApiService;

  @GET('/provinces')
  Future<dynamic> getProvincesRaw();

  @GET('/districts/{provinceCode}')
  Future<BaseResponse<List<DistrictDto>>> getDistricts(
    @Path('provinceCode') String provinceCode,
  );
}
