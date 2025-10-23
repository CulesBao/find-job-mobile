// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_job_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterJobRequestImpl _$$FilterJobRequestImplFromJson(
  Map<String, dynamic> json,
) => _$FilterJobRequestImpl(
  title: json['title'] as String?,
  provinceCode: json['province_code'] as String?,
  jobType: $enumDecodeNullable(_$JobTypeEnumMap, json['job_type']),
  minSalary: (json['min_salary'] as num?)?.toDouble(),
  maxSalary: (json['max_salary'] as num?)?.toDouble(),
  currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']),
  salaryType: $enumDecodeNullable(_$SalaryTypeEnumMap, json['salary_type']),
  education: $enumDecodeNullable(_$EducationEnumMap, json['education']),
);

Map<String, dynamic> _$$FilterJobRequestImplToJson(
  _$FilterJobRequestImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'province_code': instance.provinceCode,
  'job_type': _$JobTypeEnumMap[instance.jobType],
  'min_salary': instance.minSalary,
  'max_salary': instance.maxSalary,
  'currency': _$CurrencyEnumMap[instance.currency],
  'salary_type': _$SalaryTypeEnumMap[instance.salaryType],
  'education': _$EducationEnumMap[instance.education],
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

const _$EducationEnumMap = {
  Education.highSchool: 'HIGH_SCHOOL',
  Education.intermediate: 'INTERMEDIATE',
  Education.graduation: 'GRADUATION',
  Education.masterDegree: 'MASTER_GEGREE',
  Education.bachelorDegree: 'BACHELOR_DEGREE',
};
