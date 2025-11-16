import 'package:dio/dio.dart';
import 'package:find_job_mobile/shared/data/dto/reset_password_request.dart';
import 'package:find_job_mobile/shared/data/models/account_dto.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'account_api_service.g.dart';

@RestApi()
abstract class AccountApiService {
  factory AccountApiService(Dio dio, {String baseUrl}) = _AccountApiService;

  @GET('/account/')
  Future<BaseResponse<AccountDto>> getMyAccount();

  @PUT('/account/reset-password')
  Future<BaseResponse<void>> resetPassword(
    @Body() ResetPasswordRequest request,
  );
}
