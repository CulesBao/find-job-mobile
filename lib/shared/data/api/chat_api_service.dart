import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/dto/chat_request.dart';

part 'chat_api_service.g.dart';

@RestApi()
abstract class ChatApiService {
  factory ChatApiService(Dio dio, {String? baseUrl}) = _ChatApiService;

  @POST('/chat/')
  Future<BaseResponse<String>> getReply(@Body() ChatRequest request);
}
