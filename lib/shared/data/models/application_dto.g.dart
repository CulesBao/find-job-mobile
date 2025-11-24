// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppliedJobDtoImpl _$$AppliedJobDtoImplFromJson(Map<String, dynamic> json) =>
    _$AppliedJobDtoImpl(
      applicationId: json['application_id'] as String,
      logoUrl: json['logo_url'] as String?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      title: json['title'] as String?,
      minSalary: (json['min_salary'] as num?)?.toDouble(),
      maxSalary: (json['max_salary'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      expiredAt: json['expired_at'] as String?,
      jobProcess: $enumDecodeNullable(
        _$JobProcessEnumMap,
        json['job_proccess'],
      ),
      jobId: json['job_id'] as String?,
    );

Map<String, dynamic> _$$AppliedJobDtoImplToJson(_$AppliedJobDtoImpl instance) =>
    <String, dynamic>{
      'application_id': instance.applicationId,
      'logo_url': instance.logoUrl,
      'name': instance.name,
      'location': instance.location,
      'title': instance.title,
      'min_salary': instance.minSalary,
      'max_salary': instance.maxSalary,
      'currency': instance.currency,
      'expired_at': instance.expiredAt,
      'job_proccess': _$JobProcessEnumMap[instance.jobProcess],
      'job_id': instance.jobId,
    };

const _$JobProcessEnumMap = {
  JobProcess.applicationSubmitted: 'APPLICATION_SUBMITTED',
  JobProcess.applicationReview: 'APPLICATION_REVIEW',
  JobProcess.screening: 'SCREENING',
  JobProcess.phoneInterview: 'PHONE_INTERVIEW',
  JobProcess.technicalTest: 'TECHNICAL_TEST',
  JobProcess.firstInterview: 'FIRST_INTERVIEW',
  JobProcess.secondInterview: 'SECOND_INTERVIEW',
  JobProcess.finalInterview: 'FINAL_INTERVIEW',
  JobProcess.offerNegotiation: 'OFFER_NEGOTIATION',
  JobProcess.offerSent: 'OFFER_SENT',
  JobProcess.offerAccepted: 'OFFER_ACCEPTED',
  JobProcess.hired: 'HIRED',
  JobProcess.onboarding: 'ONBOARDING',
  JobProcess.rejected: 'REJECTED',
  JobProcess.withdrawn: 'WITHDRAWN',
};

_$ApplicationDtoImpl _$$ApplicationDtoImplFromJson(Map<String, dynamic> json) =>
    _$ApplicationDtoImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      coverLetter: json['cover_letter'] as String?,
      cvUrl: json['cv_url'] as String?,
      jobProcess: $enumDecodeNullable(
        _$JobProcessEnumMap,
        json['job_proccess'],
      ),
      jobId: json['job_id'] as String?,
      jobTitle: json['job_title'] as String?,
      companyName: json['company_name'] as String?,
      companyLogo: json['company_logo'] as String?,
      candidateProfile: json['candidate_profile'] == null
          ? null
          : CandidateProfileDto.fromJson(
              json['candidate_profile'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$ApplicationDtoImplToJson(
  _$ApplicationDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'cover_letter': instance.coverLetter,
  'cv_url': instance.cvUrl,
  'job_proccess': _$JobProcessEnumMap[instance.jobProcess],
  'job_id': instance.jobId,
  'job_title': instance.jobTitle,
  'company_name': instance.companyName,
  'company_logo': instance.companyLogo,
  'candidate_profile': instance.candidateProfile,
};

_$ApplicationStatusDtoImpl _$$ApplicationStatusDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ApplicationStatusDtoImpl(
  jobId: json['job_id'] as String,
  hasApplied: json['has_applied'] as bool,
  applicationId: json['application_id'] as String?,
  jobProcess: $enumDecodeNullable(_$JobProcessEnumMap, json['job_proccess']),
  appliedAt: json['applied_at'] == null
      ? null
      : DateTime.parse(json['applied_at'] as String),
);

Map<String, dynamic> _$$ApplicationStatusDtoImplToJson(
  _$ApplicationStatusDtoImpl instance,
) => <String, dynamic>{
  'job_id': instance.jobId,
  'has_applied': instance.hasApplied,
  'application_id': instance.applicationId,
  'job_proccess': _$JobProcessEnumMap[instance.jobProcess],
  'applied_at': instance.appliedAt?.toIso8601String(),
};
