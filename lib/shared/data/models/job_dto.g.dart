// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobDtoImpl _$$JobDtoImplFromJson(Map<String, dynamic> json) => _$JobDtoImpl(
  id: json['id'] as String,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  description: json['description'] as String?,
  education: json['education'] as String?,
  expiredAt: json['expired_at'] as String?,
  jobType: $enumDecodeNullable(_$JobTypeEnumMap, json['job_type']),
  maxSalary: (json['max_salary'] as num?)?.toDouble(),
  minSalary: (json['min_salary'] as num?)?.toDouble(),
  responsibility: json['responsibility'] as String?,
  salaryType: $enumDecodeNullable(_$SalaryTypeEnumMap, json['salary_type']),
  title: json['title'] as String,
  employerId: json['employer_id'] as String?,
  currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']),
  employerName: json['employer_name'] as String?,
  employerLogoUrl: json['employer_logo_url'] as String?,
  appliedCount: (json['applied_count'] as num?)?.toInt(),
  e: json['e'] as String?,
);

Map<String, dynamic> _$$JobDtoImplToJson(_$JobDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'description': instance.description,
      'education': instance.education,
      'expired_at': instance.expiredAt,
      'job_type': _$JobTypeEnumMap[instance.jobType],
      'max_salary': instance.maxSalary,
      'min_salary': instance.minSalary,
      'responsibility': instance.responsibility,
      'salary_type': _$SalaryTypeEnumMap[instance.salaryType],
      'title': instance.title,
      'employer_id': instance.employerId,
      'currency': _$CurrencyEnumMap[instance.currency],
      'employer_name': instance.employerName,
      'employer_logo_url': instance.employerLogoUrl,
      'applied_count': instance.appliedCount,
      'e': instance.e,
    };

const _$JobTypeEnumMap = {
  JobType.softwareEngineer: 'SOFTWARE_ENGINEER',
  JobType.frontendDeveloper: 'FRONTEND_DEVELOPER',
  JobType.backendDeveloper: 'BACKEND_DEVELOPER',
  JobType.fullstackDeveloper: 'FULLSTACK_DEVELOPER',
  JobType.mobileDeveloper: 'MOBILE_DEVELOPER',
  JobType.dataScientist: 'DATA_SCIENTIST',
  JobType.machineLearningEngineer: 'MACHINE_LEARNING_ENGINEER',
  JobType.devopsEngineer: 'DEVOPS_ENGINEER',
  JobType.qaTester: 'QA_TESTER',
  JobType.uiUxDesigner: 'UI_UX_DESIGNER',
  JobType.itSupport: 'IT_SUPPORT',
  JobType.networkEngineer: 'NETWORK_ENGINEER',
  JobType.cyberSecuritySpecialist: 'CYBER_SECURITY_SPECIALIST',
};

const _$SalaryTypeEnumMap = {
  SalaryType.hourly: 'HOURLY',
  SalaryType.daily: 'DAILY',
  SalaryType.weekly: 'WEEKLY',
  SalaryType.monthly: 'MONTHLY',
  SalaryType.annual: 'ANNUAL',
  SalaryType.commission: 'COMMISSION',
  SalaryType.pieceRate: 'PIECE_RATE',
  SalaryType.bonus: 'BONUS',
  SalaryType.contract: 'CONTRACT',
  SalaryType.profitSharing: 'PROFIT_SHARING',
};

const _$CurrencyEnumMap = {
  Currency.usd: 'USD',
  Currency.eur: 'EUR',
  Currency.jpy: 'JPY',
  Currency.gbp: 'GBP',
  Currency.aud: 'AUD',
  Currency.cad: 'CAD',
  Currency.chf: 'CHF',
  Currency.cny: 'CNY',
  Currency.hkd: 'HKD',
  Currency.sgd: 'SGD',
  Currency.krw: 'KRW',
  Currency.inr: 'INR',
  Currency.vnd: 'VND',
};
