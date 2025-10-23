import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_dto.freezed.dart';
part 'job_dto.g.dart';

enum JobType {
  @JsonValue('SOFTWARE_ENGINEER')
  softwareEngineer,
  @JsonValue('FRONTEND_DEVELOPER')
  frontendDeveloper,
  @JsonValue('BACKEND_DEVELOPER')
  backendDeveloper,
  @JsonValue('FULLSTACK_DEVELOPER')
  fullstackDeveloper,
  @JsonValue('MOBILE_DEVELOPER')
  mobileDeveloper,
  @JsonValue('DATA_SCIENTIST')
  dataScientist,
  @JsonValue('MACHINE_LEARNING_ENGINEER')
  machineLearningEngineer,
  @JsonValue('DEVOPS_ENGINEER')
  devopsEngineer,
  @JsonValue('QA_TESTER')
  qaTester,
  @JsonValue('UI_UX_DESIGNER')
  uiUxDesigner,
  @JsonValue('IT_SUPPORT')
  itSupport,
  @JsonValue('NETWORK_ENGINEER')
  networkEngineer,
  @JsonValue('CYBER_SECURITY_SPECIALIST')
  cyberSecuritySpecialist,
}

enum SalaryType {
  @JsonValue('HOURLY')
  hourly,
  @JsonValue('DAILY')
  daily,
  @JsonValue('WEEKLY')
  weekly,
  @JsonValue('MONTHLY')
  monthly,
  @JsonValue('ANNUAL')
  annual,
  @JsonValue('COMMISSION')
  commission,
  @JsonValue('PIECE_RATE')
  pieceRate,
  @JsonValue('BONUS')
  bonus,
  @JsonValue('CONTRACT')
  contract,
  @JsonValue('PROFIT_SHARING')
  profitSharing,
}

enum Currency {
  @JsonValue('USD')
  usd,
  @JsonValue('EUR')
  eur,
  @JsonValue('JPY')
  jpy,
  @JsonValue('GBP')
  gbp,
  @JsonValue('AUD')
  aud,
  @JsonValue('CAD')
  cad,
  @JsonValue('CHF')
  chf,
  @JsonValue('CNY')
  cny,
  @JsonValue('HKD')
  hkd,
  @JsonValue('SGD')
  sgd,
  @JsonValue('KRW')
  krw,
  @JsonValue('INR')
  inr,
  @JsonValue('VND')
  vnd,
}

@freezed
class JobDto with _$JobDto {
  const factory JobDto({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    String? description,
    String? education,
    @JsonKey(name: 'expired_at') String? expiredAt,
    @JsonKey(name: 'job_type') JobType? jobType,
    @JsonKey(name: 'max_salary') double? maxSalary,
    @JsonKey(name: 'min_salary') double? minSalary,
    String? responsibility,
    @JsonKey(name: 'salary_type') SalaryType? salaryType,
    required String title,
    @JsonKey(name: 'employer_id') String? employerId,
    Currency? currency,
    @JsonKey(name: 'employer_name') required String employerName,
    @JsonKey(name: 'employer_logo_url') required String employerLogoUrl,
    String? e,
  }) = _JobDto;

  factory JobDto.fromJson(Map<String, dynamic> json) => _$JobDtoFromJson(json);
}
