import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_candidate_dto.freezed.dart';
part 'saved_candidate_dto.g.dart';

/// Simplified DTO for saved candidates list (different from full CandidateProfileDto)
/// API returns: {id, first_name, last_name, location (string), avatar_url}
@freezed
class SavedCandidateDto with _$SavedCandidateDto {
  const factory SavedCandidateDto({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String location, // Just a string like "Văn Chấn, Yên Bái", not an object
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _SavedCandidateDto;

  factory SavedCandidateDto.fromJson(Map<String, dynamic> json) =>
      _$SavedCandidateDtoFromJson(json);
}
