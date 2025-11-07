import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/dto/chat_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/repositories/chat_repository.dart';

class ChatService {
  final ChatRepository _repository = getIt<ChatRepository>();

  Future<BaseResponse<String>> sendMessage(String message) async {
    final trimmed = message.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('message must not be empty');
    }
    final request = ChatRequest(message: trimmed);
    return await _repository.getReply(request);
  }
}
