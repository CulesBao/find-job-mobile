import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/account_dto.dart';
import 'package:find_job_mobile/shared/data/models/auth_response.dart';
import 'package:find_job_mobile/shared/data/dto/login_request.dart';
import 'package:find_job_mobile/shared/data/dto/register_request.dart';
import 'package:find_job_mobile/shared/data/dto/verify_code_request.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  @POST('/auth/register')
  Future<BaseResponse<AccountDto>> register(@Body() RegisterRequest request);

  @POST('/auth/login')
  Future<BaseResponse<AuthResponse>> login(@Body() LoginRequest request);

  @PUT('/auth/verify/{accountId}')
  Future<BaseResponse<void>> verifyCode(
    @Path('accountId') String accountId,
    @Body() VerifyCodeRequest request,
  );

  @POST('/auth/logout')
  Future<BaseResponse<void>> logout();
}
