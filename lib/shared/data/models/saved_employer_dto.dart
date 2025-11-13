import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_employer_dto.freezed.dart';
part 'saved_employer_dto.g.dart';

/// Simplified DTO for saved employers list (different from full EmployerProfileDto)
/// API returns: {id, name, location (string), logo_url, job_count}
@freezed
class SavedEmployerDto with _$SavedEmployerDto {
  const factory SavedEmployerDto({
    required String id,
    required String name,
    required String location, 
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'job_count') int? jobCount,
  }) = _SavedEmployerDto;

  factory SavedEmployerDto.fromJson(Map<String, dynamic> json) =>
      _$SavedEmployerDtoFromJson(json);
}
