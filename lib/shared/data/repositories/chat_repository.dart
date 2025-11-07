import 'package:find_job_mobile/shared/data/api/chat_api_service.dart';
import 'package:find_job_mobile/shared/data/dto/chat_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';

class ChatRepository {
  final ChatApiService _apiService;

  ChatRepository(this._apiService);

  Future<BaseResponse<String>> getReply(ChatRequest request) async {
    try {
      return await _apiService.getReply(request);
    } catch (e) {
      rethrow;
    }
  }
}
