import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

enum Provider {
  @JsonValue('GOOGLE')
  google,
  @JsonValue('LOCAL')
  local,
}

enum Role {
  @JsonValue('ADMIN')
  admin,
  @JsonValue('CANDIDATE')
  candidate,
  @JsonValue('EMPLOYER')
  employer,
}

@freezed
class AccountDto with _$AccountDto {
  const factory AccountDto({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    required String email,
    @JsonKey(name: 'is_active') required bool isActive,
    required Provider provider,
    required Role role,
    @JsonKey(name: 'candidate_profile')
    CandidateProfileDto? candidateProfileDto,
    @JsonKey(name: 'employer_profile') EmployerProfileDto? employerProfileDto,
  }) = _AccountDto;

  factory AccountDto.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoFromJson(json);
}
