// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_job_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateJobRequestImpl _$$CreateJobRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateJobRequestImpl(
  title: json['title'] as String,
  description: json['description'] as String?,
  responsibility: json['responsibility'] as String?,
  education: $enumDecodeNullable(_$EducationEnumMap, json['education']),
  jobType: $enumDecodeNullable(_$JobTypeEnumMap, json['job_type']),
  minSalary: (json['min_salary'] as num?)?.toDouble(),
  maxSalary: (json['max_salary'] as num?)?.toDouble(),
  salaryType: $enumDecodeNullable(_$SalaryTypeEnumMap, json['salary_type']),
  currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']),
  expiredAt: json['expired_at'] as String?,
);

Map<String, dynamic> _$$CreateJobRequestImplToJson(
  _$CreateJobRequestImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'responsibility': instance.responsibility,
  'education': _$EducationEnumMap[instance.education],
  'job_type': _$JobTypeEnumMap[instance.jobType],
  'min_salary': instance.minSalary,
  'max_salary': instance.maxSalary,
  'salary_type': _$SalaryTypeEnumMap[instance.salaryType],
  'currency': _$CurrencyEnumMap[instance.currency],
  'expired_at': instance.expiredAt,
};

const _$EducationEnumMap = {
  Education.highSchool: 'HIGH_SCHOOL',
  Education.intermediate: 'INTERMEDIATE',
  Education.graduation: 'GRADUATION',
  Education.masterDegree: 'MASTER_DEGREE',
  Education.bachelorDegree: 'BACHELOR_DEGREE',
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
