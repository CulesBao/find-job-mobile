// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppliedJobDto _$AppliedJobDtoFromJson(Map<String, dynamic> json) {
  return _AppliedJobDto.fromJson(json);
}

/// @nodoc
mixin _$AppliedJobDto {
  @JsonKey(name: 'application_id')
  String get applicationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_salary')
  double? get minSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_salary')
  double? get maxSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_at')
  String? get expiredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_proccess')
  JobProcess? get jobProcess => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  String? get jobId => throw _privateConstructorUsedError;

  /// Serializes this AppliedJobDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppliedJobDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppliedJobDtoCopyWith<AppliedJobDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppliedJobDtoCopyWith<$Res> {
  factory $AppliedJobDtoCopyWith(
    AppliedJobDto value,
    $Res Function(AppliedJobDto) then,
  ) = _$AppliedJobDtoCopyWithImpl<$Res, AppliedJobDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'application_id') String applicationId,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'min_salary') double? minSalary,
    @JsonKey(name: 'max_salary') double? maxSalary,
    @JsonKey(name: 'currency') String? currency,
    @JsonKey(name: 'expired_at') String? expiredAt,
    @JsonKey(name: 'job_proccess') JobProcess? jobProcess,
    @JsonKey(name: 'job_id') String? jobId,
  });
}

/// @nodoc
class _$AppliedJobDtoCopyWithImpl<$Res, $Val extends AppliedJobDto>
    implements $AppliedJobDtoCopyWith<$Res> {
  _$AppliedJobDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppliedJobDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? logoUrl = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? title = freezed,
    Object? minSalary = freezed,
    Object? maxSalary = freezed,
    Object? currency = freezed,
    Object? expiredAt = freezed,
    Object? jobProcess = freezed,
    Object? jobId = freezed,
  }) {
    return _then(
      _value.copyWith(
            applicationId: null == applicationId
                ? _value.applicationId
                : applicationId // ignore: cast_nullable_to_non_nullable
                      as String,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            minSalary: freezed == minSalary
                ? _value.minSalary
                : minSalary // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxSalary: freezed == maxSalary
                ? _value.maxSalary
                : maxSalary // ignore: cast_nullable_to_non_nullable
                      as double?,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiredAt: freezed == expiredAt
                ? _value.expiredAt
                : expiredAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobProcess: freezed == jobProcess
                ? _value.jobProcess
                : jobProcess // ignore: cast_nullable_to_non_nullable
                      as JobProcess?,
            jobId: freezed == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppliedJobDtoImplCopyWith<$Res>
    implements $AppliedJobDtoCopyWith<$Res> {
  factory _$$AppliedJobDtoImplCopyWith(
    _$AppliedJobDtoImpl value,
    $Res Function(_$AppliedJobDtoImpl) then,
  ) = __$$AppliedJobDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'application_id') String applicationId,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'min_salary') double? minSalary,
    @JsonKey(name: 'max_salary') double? maxSalary,
    @JsonKey(name: 'currency') String? currency,
    @JsonKey(name: 'expired_at') String? expiredAt,
    @JsonKey(name: 'job_proccess') JobProcess? jobProcess,
    @JsonKey(name: 'job_id') String? jobId,
  });
}

/// @nodoc
class __$$AppliedJobDtoImplCopyWithImpl<$Res>
    extends _$AppliedJobDtoCopyWithImpl<$Res, _$AppliedJobDtoImpl>
    implements _$$AppliedJobDtoImplCopyWith<$Res> {
  __$$AppliedJobDtoImplCopyWithImpl(
    _$AppliedJobDtoImpl _value,
    $Res Function(_$AppliedJobDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppliedJobDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? logoUrl = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? title = freezed,
    Object? minSalary = freezed,
    Object? maxSalary = freezed,
    Object? currency = freezed,
    Object? expiredAt = freezed,
    Object? jobProcess = freezed,
    Object? jobId = freezed,
  }) {
    return _then(
      _$AppliedJobDtoImpl(
        applicationId: null == applicationId
            ? _value.applicationId
            : applicationId // ignore: cast_nullable_to_non_nullable
                  as String,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        minSalary: freezed == minSalary
            ? _value.minSalary
            : minSalary // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxSalary: freezed == maxSalary
            ? _value.maxSalary
            : maxSalary // ignore: cast_nullable_to_non_nullable
                  as double?,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiredAt: freezed == expiredAt
            ? _value.expiredAt
            : expiredAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobProcess: freezed == jobProcess
            ? _value.jobProcess
            : jobProcess // ignore: cast_nullable_to_non_nullable
                  as JobProcess?,
        jobId: freezed == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppliedJobDtoImpl implements _AppliedJobDto {
  const _$AppliedJobDtoImpl({
    @JsonKey(name: 'application_id') required this.applicationId,
    @JsonKey(name: 'logo_url') this.logoUrl,
    @JsonKey(name: 'name') this.name,
    @JsonKey(name: 'location') this.location,
    @JsonKey(name: 'title') this.title,
    @JsonKey(name: 'min_salary') this.minSalary,
    @JsonKey(name: 'max_salary') this.maxSalary,
    @JsonKey(name: 'currency') this.currency,
    @JsonKey(name: 'expired_at') this.expiredAt,
    @JsonKey(name: 'job_proccess') this.jobProcess,
    @JsonKey(name: 'job_id') this.jobId,
  });

  factory _$AppliedJobDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppliedJobDtoImplFromJson(json);

  @override
  @JsonKey(name: 'application_id')
  final String applicationId;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'location')
  final String? location;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'min_salary')
  final double? minSalary;
  @override
  @JsonKey(name: 'max_salary')
  final double? maxSalary;
  @override
  @JsonKey(name: 'currency')
  final String? currency;
  @override
  @JsonKey(name: 'expired_at')
  final String? expiredAt;
  @override
  @JsonKey(name: 'job_proccess')
  final JobProcess? jobProcess;
  @override
  @JsonKey(name: 'job_id')
  final String? jobId;

  @override
  String toString() {
    return 'AppliedJobDto(applicationId: $applicationId, logoUrl: $logoUrl, name: $name, location: $location, title: $title, minSalary: $minSalary, maxSalary: $maxSalary, currency: $currency, expiredAt: $expiredAt, jobProcess: $jobProcess, jobId: $jobId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppliedJobDtoImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.minSalary, minSalary) ||
                other.minSalary == minSalary) &&
            (identical(other.maxSalary, maxSalary) ||
                other.maxSalary == maxSalary) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.jobProcess, jobProcess) ||
                other.jobProcess == jobProcess) &&
            (identical(other.jobId, jobId) || other.jobId == jobId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    applicationId,
    logoUrl,
    name,
    location,
    title,
    minSalary,
    maxSalary,
    currency,
    expiredAt,
    jobProcess,
    jobId,
  );

  /// Create a copy of AppliedJobDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppliedJobDtoImplCopyWith<_$AppliedJobDtoImpl> get copyWith =>
      __$$AppliedJobDtoImplCopyWithImpl<_$AppliedJobDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppliedJobDtoImplToJson(this);
  }
}

abstract class _AppliedJobDto implements AppliedJobDto {
  const factory _AppliedJobDto({
    @JsonKey(name: 'application_id') required final String applicationId,
    @JsonKey(name: 'logo_url') final String? logoUrl,
    @JsonKey(name: 'name') final String? name,
    @JsonKey(name: 'location') final String? location,
    @JsonKey(name: 'title') final String? title,
    @JsonKey(name: 'min_salary') final double? minSalary,
    @JsonKey(name: 'max_salary') final double? maxSalary,
    @JsonKey(name: 'currency') final String? currency,
    @JsonKey(name: 'expired_at') final String? expiredAt,
    @JsonKey(name: 'job_proccess') final JobProcess? jobProcess,
    @JsonKey(name: 'job_id') final String? jobId,
  }) = _$AppliedJobDtoImpl;

  factory _AppliedJobDto.fromJson(Map<String, dynamic> json) =
      _$AppliedJobDtoImpl.fromJson;

  @override
  @JsonKey(name: 'application_id')
  String get applicationId;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'min_salary')
  double? get minSalary;
  @override
  @JsonKey(name: 'max_salary')
  double? get maxSalary;
  @override
  @JsonKey(name: 'currency')
  String? get currency;
  @override
  @JsonKey(name: 'expired_at')
  String? get expiredAt;
  @override
  @JsonKey(name: 'job_proccess')
  JobProcess? get jobProcess;
  @override
  @JsonKey(name: 'job_id')
  String? get jobId;

  /// Create a copy of AppliedJobDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppliedJobDtoImplCopyWith<_$AppliedJobDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationDto _$ApplicationDtoFromJson(Map<String, dynamic> json) {
  return _ApplicationDto.fromJson(json);
}

/// @nodoc
mixin _$ApplicationDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_letter')
  String? get coverLetter => throw _privateConstructorUsedError;
  @JsonKey(name: 'cv_url')
  String? get cvUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_proccess')
  JobProcess? get jobProcess => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  String? get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_title')
  String? get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_logo')
  String? get companyLogo => throw _privateConstructorUsedError;
  @JsonKey(name: 'candidate_profile')
  CandidateProfileDto? get candidateProfile =>
      throw _privateConstructorUsedError;

  /// Serializes this ApplicationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationDtoCopyWith<ApplicationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationDtoCopyWith<$Res> {
  factory $ApplicationDtoCopyWith(
    ApplicationDto value,
    $Res Function(ApplicationDto) then,
  ) = _$ApplicationDtoCopyWithImpl<$Res, ApplicationDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'cover_letter') String? coverLetter,
    @JsonKey(name: 'cv_url') String? cvUrl,
    @JsonKey(name: 'job_proccess') JobProcess? jobProcess,
    @JsonKey(name: 'job_id') String? jobId,
    @JsonKey(name: 'job_title') String? jobTitle,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'company_logo') String? companyLogo,
    @JsonKey(name: 'candidate_profile') CandidateProfileDto? candidateProfile,
  });

  $CandidateProfileDtoCopyWith<$Res>? get candidateProfile;
}

/// @nodoc
class _$ApplicationDtoCopyWithImpl<$Res, $Val extends ApplicationDto>
    implements $ApplicationDtoCopyWith<$Res> {
  _$ApplicationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? coverLetter = freezed,
    Object? cvUrl = freezed,
    Object? jobProcess = freezed,
    Object? jobId = freezed,
    Object? jobTitle = freezed,
    Object? companyName = freezed,
    Object? companyLogo = freezed,
    Object? candidateProfile = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            coverLetter: freezed == coverLetter
                ? _value.coverLetter
                : coverLetter // ignore: cast_nullable_to_non_nullable
                      as String?,
            cvUrl: freezed == cvUrl
                ? _value.cvUrl
                : cvUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobProcess: freezed == jobProcess
                ? _value.jobProcess
                : jobProcess // ignore: cast_nullable_to_non_nullable
                      as JobProcess?,
            jobId: freezed == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobTitle: freezed == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            companyName: freezed == companyName
                ? _value.companyName
                : companyName // ignore: cast_nullable_to_non_nullable
                      as String?,
            companyLogo: freezed == companyLogo
                ? _value.companyLogo
                : companyLogo // ignore: cast_nullable_to_non_nullable
                      as String?,
            candidateProfile: freezed == candidateProfile
                ? _value.candidateProfile
                : candidateProfile // ignore: cast_nullable_to_non_nullable
                      as CandidateProfileDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CandidateProfileDtoCopyWith<$Res>? get candidateProfile {
    if (_value.candidateProfile == null) {
      return null;
    }

    return $CandidateProfileDtoCopyWith<$Res>(_value.candidateProfile!, (
      value,
    ) {
      return _then(_value.copyWith(candidateProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApplicationDtoImplCopyWith<$Res>
    implements $ApplicationDtoCopyWith<$Res> {
  factory _$$ApplicationDtoImplCopyWith(
    _$ApplicationDtoImpl value,
    $Res Function(_$ApplicationDtoImpl) then,
  ) = __$$ApplicationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'cover_letter') String? coverLetter,
    @JsonKey(name: 'cv_url') String? cvUrl,
    @JsonKey(name: 'job_proccess') JobProcess? jobProcess,
    @JsonKey(name: 'job_id') String? jobId,
    @JsonKey(name: 'job_title') String? jobTitle,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'company_logo') String? companyLogo,
    @JsonKey(name: 'candidate_profile') CandidateProfileDto? candidateProfile,
  });

  @override
  $CandidateProfileDtoCopyWith<$Res>? get candidateProfile;
}

/// @nodoc
class __$$ApplicationDtoImplCopyWithImpl<$Res>
    extends _$ApplicationDtoCopyWithImpl<$Res, _$ApplicationDtoImpl>
    implements _$$ApplicationDtoImplCopyWith<$Res> {
  __$$ApplicationDtoImplCopyWithImpl(
    _$ApplicationDtoImpl _value,
    $Res Function(_$ApplicationDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? coverLetter = freezed,
    Object? cvUrl = freezed,
    Object? jobProcess = freezed,
    Object? jobId = freezed,
    Object? jobTitle = freezed,
    Object? companyName = freezed,
    Object? companyLogo = freezed,
    Object? candidateProfile = freezed,
  }) {
    return _then(
      _$ApplicationDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        coverLetter: freezed == coverLetter
            ? _value.coverLetter
            : coverLetter // ignore: cast_nullable_to_non_nullable
                  as String?,
        cvUrl: freezed == cvUrl
            ? _value.cvUrl
            : cvUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobProcess: freezed == jobProcess
            ? _value.jobProcess
            : jobProcess // ignore: cast_nullable_to_non_nullable
                  as JobProcess?,
        jobId: freezed == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobTitle: freezed == jobTitle
            ? _value.jobTitle
            : jobTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        companyName: freezed == companyName
            ? _value.companyName
            : companyName // ignore: cast_nullable_to_non_nullable
                  as String?,
        companyLogo: freezed == companyLogo
            ? _value.companyLogo
            : companyLogo // ignore: cast_nullable_to_non_nullable
                  as String?,
        candidateProfile: freezed == candidateProfile
            ? _value.candidateProfile
            : candidateProfile // ignore: cast_nullable_to_non_nullable
                  as CandidateProfileDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationDtoImpl implements _ApplicationDto {
  const _$ApplicationDtoImpl({
    required this.id,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'cover_letter') this.coverLetter,
    @JsonKey(name: 'cv_url') this.cvUrl,
    @JsonKey(name: 'job_proccess') this.jobProcess,
    @JsonKey(name: 'job_id') this.jobId,
    @JsonKey(name: 'job_title') this.jobTitle,
    @JsonKey(name: 'company_name') this.companyName,
    @JsonKey(name: 'company_logo') this.companyLogo,
    @JsonKey(name: 'candidate_profile') this.candidateProfile,
  });

  factory _$ApplicationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'cover_letter')
  final String? coverLetter;
  @override
  @JsonKey(name: 'cv_url')
  final String? cvUrl;
  @override
  @JsonKey(name: 'job_proccess')
  final JobProcess? jobProcess;
  @override
  @JsonKey(name: 'job_id')
  final String? jobId;
  @override
  @JsonKey(name: 'job_title')
  final String? jobTitle;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  @JsonKey(name: 'company_logo')
  final String? companyLogo;
  @override
  @JsonKey(name: 'candidate_profile')
  final CandidateProfileDto? candidateProfile;

  @override
  String toString() {
    return 'ApplicationDto(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, coverLetter: $coverLetter, cvUrl: $cvUrl, jobProcess: $jobProcess, jobId: $jobId, jobTitle: $jobTitle, companyName: $companyName, companyLogo: $companyLogo, candidateProfile: $candidateProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.coverLetter, coverLetter) ||
                other.coverLetter == coverLetter) &&
            (identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl) &&
            (identical(other.jobProcess, jobProcess) ||
                other.jobProcess == jobProcess) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyLogo, companyLogo) ||
                other.companyLogo == companyLogo) &&
            (identical(other.candidateProfile, candidateProfile) ||
                other.candidateProfile == candidateProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    coverLetter,
    cvUrl,
    jobProcess,
    jobId,
    jobTitle,
    companyName,
    companyLogo,
    candidateProfile,
  );

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationDtoImplCopyWith<_$ApplicationDtoImpl> get copyWith =>
      __$$ApplicationDtoImplCopyWithImpl<_$ApplicationDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationDtoImplToJson(this);
  }
}

abstract class _ApplicationDto implements ApplicationDto {
  const factory _ApplicationDto({
    required final String id,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    @JsonKey(name: 'cover_letter') final String? coverLetter,
    @JsonKey(name: 'cv_url') final String? cvUrl,
    @JsonKey(name: 'job_proccess') final JobProcess? jobProcess,
    @JsonKey(name: 'job_id') final String? jobId,
    @JsonKey(name: 'job_title') final String? jobTitle,
    @JsonKey(name: 'company_name') final String? companyName,
    @JsonKey(name: 'company_logo') final String? companyLogo,
    @JsonKey(name: 'candidate_profile')
    final CandidateProfileDto? candidateProfile,
  }) = _$ApplicationDtoImpl;

  factory _ApplicationDto.fromJson(Map<String, dynamic> json) =
      _$ApplicationDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'cover_letter')
  String? get coverLetter;
  @override
  @JsonKey(name: 'cv_url')
  String? get cvUrl;
  @override
  @JsonKey(name: 'job_proccess')
  JobProcess? get jobProcess;
  @override
  @JsonKey(name: 'job_id')
  String? get jobId;
  @override
  @JsonKey(name: 'job_title')
  String? get jobTitle;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  @JsonKey(name: 'company_logo')
  String? get companyLogo;
  @override
  @JsonKey(name: 'candidate_profile')
  CandidateProfileDto? get candidateProfile;

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationDtoImplCopyWith<_$ApplicationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationStatusDto _$ApplicationStatusDtoFromJson(Map<String, dynamic> json) {
  return _ApplicationStatusDto.fromJson(json);
}

/// @nodoc
mixin _$ApplicationStatusDto {
  @JsonKey(name: 'job_id')
  String get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_applied')
  bool get hasApplied => throw _privateConstructorUsedError;
  @JsonKey(name: 'application_id')
  String? get applicationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_proccess')
  JobProcess? get jobProcess => throw _privateConstructorUsedError;
  @JsonKey(name: 'applied_at')
  DateTime? get appliedAt => throw _privateConstructorUsedError;

  /// Serializes this ApplicationStatusDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationStatusDtoCopyWith<ApplicationStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationStatusDtoCopyWith<$Res> {
  factory $ApplicationStatusDtoCopyWith(
    ApplicationStatusDto value,
    $Res Function(ApplicationStatusDto) then,
  ) = _$ApplicationStatusDtoCopyWithImpl<$Res, ApplicationStatusDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'job_id') String jobId,
    @JsonKey(name: 'has_applied') bool hasApplied,
    @JsonKey(name: 'application_id') String? applicationId,
    @JsonKey(name: 'job_proccess') JobProcess? jobProcess,
    @JsonKey(name: 'applied_at') DateTime? appliedAt,
  });
}

/// @nodoc
class _$ApplicationStatusDtoCopyWithImpl<
  $Res,
  $Val extends ApplicationStatusDto
>
    implements $ApplicationStatusDtoCopyWith<$Res> {
  _$ApplicationStatusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? hasApplied = null,
    Object? applicationId = freezed,
    Object? jobProcess = freezed,
    Object? appliedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as String,
            hasApplied: null == hasApplied
                ? _value.hasApplied
                : hasApplied // ignore: cast_nullable_to_non_nullable
                      as bool,
            applicationId: freezed == applicationId
                ? _value.applicationId
                : applicationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobProcess: freezed == jobProcess
                ? _value.jobProcess
                : jobProcess // ignore: cast_nullable_to_non_nullable
                      as JobProcess?,
            appliedAt: freezed == appliedAt
                ? _value.appliedAt
                : appliedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApplicationStatusDtoImplCopyWith<$Res>
    implements $ApplicationStatusDtoCopyWith<$Res> {
  factory _$$ApplicationStatusDtoImplCopyWith(
    _$ApplicationStatusDtoImpl value,
    $Res Function(_$ApplicationStatusDtoImpl) then,
  ) = __$$ApplicationStatusDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'job_id') String jobId,
    @JsonKey(name: 'has_applied') bool hasApplied,
    @JsonKey(name: 'application_id') String? applicationId,
    @JsonKey(name: 'job_proccess') JobProcess? jobProcess,
    @JsonKey(name: 'applied_at') DateTime? appliedAt,
  });
}

/// @nodoc
class __$$ApplicationStatusDtoImplCopyWithImpl<$Res>
    extends _$ApplicationStatusDtoCopyWithImpl<$Res, _$ApplicationStatusDtoImpl>
    implements _$$ApplicationStatusDtoImplCopyWith<$Res> {
  __$$ApplicationStatusDtoImplCopyWithImpl(
    _$ApplicationStatusDtoImpl _value,
    $Res Function(_$ApplicationStatusDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApplicationStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? hasApplied = null,
    Object? applicationId = freezed,
    Object? jobProcess = freezed,
    Object? appliedAt = freezed,
  }) {
    return _then(
      _$ApplicationStatusDtoImpl(
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as String,
        hasApplied: null == hasApplied
            ? _value.hasApplied
            : hasApplied // ignore: cast_nullable_to_non_nullable
                  as bool,
        applicationId: freezed == applicationId
            ? _value.applicationId
            : applicationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobProcess: freezed == jobProcess
            ? _value.jobProcess
            : jobProcess // ignore: cast_nullable_to_non_nullable
                  as JobProcess?,
        appliedAt: freezed == appliedAt
            ? _value.appliedAt
            : appliedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationStatusDtoImpl implements _ApplicationStatusDto {
  const _$ApplicationStatusDtoImpl({
    @JsonKey(name: 'job_id') required this.jobId,
    @JsonKey(name: 'has_applied') required this.hasApplied,
    @JsonKey(name: 'application_id') this.applicationId,
    @JsonKey(name: 'job_proccess') this.jobProcess,
    @JsonKey(name: 'applied_at') this.appliedAt,
  });

  factory _$ApplicationStatusDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationStatusDtoImplFromJson(json);

  @override
  @JsonKey(name: 'job_id')
  final String jobId;
  @override
  @JsonKey(name: 'has_applied')
  final bool hasApplied;
  @override
  @JsonKey(name: 'application_id')
  final String? applicationId;
  @override
  @JsonKey(name: 'job_proccess')
  final JobProcess? jobProcess;
  @override
  @JsonKey(name: 'applied_at')
  final DateTime? appliedAt;

  @override
  String toString() {
    return 'ApplicationStatusDto(jobId: $jobId, hasApplied: $hasApplied, applicationId: $applicationId, jobProcess: $jobProcess, appliedAt: $appliedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationStatusDtoImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.hasApplied, hasApplied) ||
                other.hasApplied == hasApplied) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.jobProcess, jobProcess) ||
                other.jobProcess == jobProcess) &&
            (identical(other.appliedAt, appliedAt) ||
                other.appliedAt == appliedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jobId,
    hasApplied,
    applicationId,
    jobProcess,
    appliedAt,
  );

  /// Create a copy of ApplicationStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationStatusDtoImplCopyWith<_$ApplicationStatusDtoImpl>
  get copyWith =>
      __$$ApplicationStatusDtoImplCopyWithImpl<_$ApplicationStatusDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationStatusDtoImplToJson(this);
  }
}

abstract class _ApplicationStatusDto implements ApplicationStatusDto {
  const factory _ApplicationStatusDto({
    @JsonKey(name: 'job_id') required final String jobId,
    @JsonKey(name: 'has_applied') required final bool hasApplied,
    @JsonKey(name: 'application_id') final String? applicationId,
    @JsonKey(name: 'job_proccess') final JobProcess? jobProcess,
    @JsonKey(name: 'applied_at') final DateTime? appliedAt,
  }) = _$ApplicationStatusDtoImpl;

  factory _ApplicationStatusDto.fromJson(Map<String, dynamic> json) =
      _$ApplicationStatusDtoImpl.fromJson;

  @override
  @JsonKey(name: 'job_id')
  String get jobId;
  @override
  @JsonKey(name: 'has_applied')
  bool get hasApplied;
  @override
  @JsonKey(name: 'application_id')
  String? get applicationId;
  @override
  @JsonKey(name: 'job_proccess')
  JobProcess? get jobProcess;
  @override
  @JsonKey(name: 'applied_at')
  DateTime? get appliedAt;

  /// Create a copy of ApplicationStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationStatusDtoImplCopyWith<_$ApplicationStatusDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
