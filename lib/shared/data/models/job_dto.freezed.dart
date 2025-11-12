// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JobDto _$JobDtoFromJson(Map<String, dynamic> json) {
  return _JobDto.fromJson(json);
}

/// @nodoc
mixin _$JobDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get education => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_at')
  String? get expiredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  JobType? get jobType => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_salary')
  double? get maxSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_salary')
  double? get minSalary => throw _privateConstructorUsedError;
  String? get responsibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'salary_type')
  SalaryType? get salaryType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'employer_id')
  String? get employerId => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'employer_name')
  String? get employerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'employer_logo_url')
  String? get employerLogoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'applied_count')
  int? get appliedCount => throw _privateConstructorUsedError;
  String? get e => throw _privateConstructorUsedError;

  /// Serializes this JobDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobDtoCopyWith<JobDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobDtoCopyWith<$Res> {
  factory $JobDtoCopyWith(JobDto value, $Res Function(JobDto) then) =
      _$JobDtoCopyWithImpl<$Res, JobDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    String? description,
    String? education,
    @JsonKey(name: 'expired_at') String? expiredAt,
    @JsonKey(name: 'job_type') JobType? jobType,
    @JsonKey(name: 'max_salary') double? maxSalary,
    @JsonKey(name: 'min_salary') double? minSalary,
    String? responsibility,
    @JsonKey(name: 'salary_type') SalaryType? salaryType,
    String title,
    @JsonKey(name: 'employer_id') String? employerId,
    Currency? currency,
    @JsonKey(name: 'employer_name') String? employerName,
    @JsonKey(name: 'employer_logo_url') String? employerLogoUrl,
    @JsonKey(name: 'applied_count') int? appliedCount,
    String? e,
  });
}

/// @nodoc
class _$JobDtoCopyWithImpl<$Res, $Val extends JobDto>
    implements $JobDtoCopyWith<$Res> {
  _$JobDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? education = freezed,
    Object? expiredAt = freezed,
    Object? jobType = freezed,
    Object? maxSalary = freezed,
    Object? minSalary = freezed,
    Object? responsibility = freezed,
    Object? salaryType = freezed,
    Object? title = null,
    Object? employerId = freezed,
    Object? currency = freezed,
    Object? employerName = freezed,
    Object? employerLogoUrl = freezed,
    Object? appliedCount = freezed,
    Object? e = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            education: freezed == education
                ? _value.education
                : education // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiredAt: freezed == expiredAt
                ? _value.expiredAt
                : expiredAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobType: freezed == jobType
                ? _value.jobType
                : jobType // ignore: cast_nullable_to_non_nullable
                      as JobType?,
            maxSalary: freezed == maxSalary
                ? _value.maxSalary
                : maxSalary // ignore: cast_nullable_to_non_nullable
                      as double?,
            minSalary: freezed == minSalary
                ? _value.minSalary
                : minSalary // ignore: cast_nullable_to_non_nullable
                      as double?,
            responsibility: freezed == responsibility
                ? _value.responsibility
                : responsibility // ignore: cast_nullable_to_non_nullable
                      as String?,
            salaryType: freezed == salaryType
                ? _value.salaryType
                : salaryType // ignore: cast_nullable_to_non_nullable
                      as SalaryType?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            employerId: freezed == employerId
                ? _value.employerId
                : employerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as Currency?,
            employerName: freezed == employerName
                ? _value.employerName
                : employerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            employerLogoUrl: freezed == employerLogoUrl
                ? _value.employerLogoUrl
                : employerLogoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            appliedCount: freezed == appliedCount
                ? _value.appliedCount
                : appliedCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            e: freezed == e
                ? _value.e
                : e // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobDtoImplCopyWith<$Res> implements $JobDtoCopyWith<$Res> {
  factory _$$JobDtoImplCopyWith(
    _$JobDtoImpl value,
    $Res Function(_$JobDtoImpl) then,
  ) = __$$JobDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    String? description,
    String? education,
    @JsonKey(name: 'expired_at') String? expiredAt,
    @JsonKey(name: 'job_type') JobType? jobType,
    @JsonKey(name: 'max_salary') double? maxSalary,
    @JsonKey(name: 'min_salary') double? minSalary,
    String? responsibility,
    @JsonKey(name: 'salary_type') SalaryType? salaryType,
    String title,
    @JsonKey(name: 'employer_id') String? employerId,
    Currency? currency,
    @JsonKey(name: 'employer_name') String? employerName,
    @JsonKey(name: 'employer_logo_url') String? employerLogoUrl,
    @JsonKey(name: 'applied_count') int? appliedCount,
    String? e,
  });
}

/// @nodoc
class __$$JobDtoImplCopyWithImpl<$Res>
    extends _$JobDtoCopyWithImpl<$Res, _$JobDtoImpl>
    implements _$$JobDtoImplCopyWith<$Res> {
  __$$JobDtoImplCopyWithImpl(
    _$JobDtoImpl _value,
    $Res Function(_$JobDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? education = freezed,
    Object? expiredAt = freezed,
    Object? jobType = freezed,
    Object? maxSalary = freezed,
    Object? minSalary = freezed,
    Object? responsibility = freezed,
    Object? salaryType = freezed,
    Object? title = null,
    Object? employerId = freezed,
    Object? currency = freezed,
    Object? employerName = freezed,
    Object? employerLogoUrl = freezed,
    Object? appliedCount = freezed,
    Object? e = freezed,
  }) {
    return _then(
      _$JobDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        education: freezed == education
            ? _value.education
            : education // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiredAt: freezed == expiredAt
            ? _value.expiredAt
            : expiredAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobType: freezed == jobType
            ? _value.jobType
            : jobType // ignore: cast_nullable_to_non_nullable
                  as JobType?,
        maxSalary: freezed == maxSalary
            ? _value.maxSalary
            : maxSalary // ignore: cast_nullable_to_non_nullable
                  as double?,
        minSalary: freezed == minSalary
            ? _value.minSalary
            : minSalary // ignore: cast_nullable_to_non_nullable
                  as double?,
        responsibility: freezed == responsibility
            ? _value.responsibility
            : responsibility // ignore: cast_nullable_to_non_nullable
                  as String?,
        salaryType: freezed == salaryType
            ? _value.salaryType
            : salaryType // ignore: cast_nullable_to_non_nullable
                  as SalaryType?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        employerId: freezed == employerId
            ? _value.employerId
            : employerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as Currency?,
        employerName: freezed == employerName
            ? _value.employerName
            : employerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        employerLogoUrl: freezed == employerLogoUrl
            ? _value.employerLogoUrl
            : employerLogoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        appliedCount: freezed == appliedCount
            ? _value.appliedCount
            : appliedCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        e: freezed == e
            ? _value.e
            : e // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobDtoImpl implements _JobDto {
  const _$JobDtoImpl({
    required this.id,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    this.description,
    this.education,
    @JsonKey(name: 'expired_at') this.expiredAt,
    @JsonKey(name: 'job_type') this.jobType,
    @JsonKey(name: 'max_salary') this.maxSalary,
    @JsonKey(name: 'min_salary') this.minSalary,
    this.responsibility,
    @JsonKey(name: 'salary_type') this.salaryType,
    required this.title,
    @JsonKey(name: 'employer_id') this.employerId,
    this.currency,
    @JsonKey(name: 'employer_name') this.employerName,
    @JsonKey(name: 'employer_logo_url') this.employerLogoUrl,
    @JsonKey(name: 'applied_count') this.appliedCount,
    this.e,
  });

  factory _$JobDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  final String? description;
  @override
  final String? education;
  @override
  @JsonKey(name: 'expired_at')
  final String? expiredAt;
  @override
  @JsonKey(name: 'job_type')
  final JobType? jobType;
  @override
  @JsonKey(name: 'max_salary')
  final double? maxSalary;
  @override
  @JsonKey(name: 'min_salary')
  final double? minSalary;
  @override
  final String? responsibility;
  @override
  @JsonKey(name: 'salary_type')
  final SalaryType? salaryType;
  @override
  final String title;
  @override
  @JsonKey(name: 'employer_id')
  final String? employerId;
  @override
  final Currency? currency;
  @override
  @JsonKey(name: 'employer_name')
  final String? employerName;
  @override
  @JsonKey(name: 'employer_logo_url')
  final String? employerLogoUrl;
  @override
  @JsonKey(name: 'applied_count')
  final int? appliedCount;
  @override
  final String? e;

  @override
  String toString() {
    return 'JobDto(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, education: $education, expiredAt: $expiredAt, jobType: $jobType, maxSalary: $maxSalary, minSalary: $minSalary, responsibility: $responsibility, salaryType: $salaryType, title: $title, employerId: $employerId, currency: $currency, employerName: $employerName, employerLogoUrl: $employerLogoUrl, appliedCount: $appliedCount, e: $e)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.maxSalary, maxSalary) ||
                other.maxSalary == maxSalary) &&
            (identical(other.minSalary, minSalary) ||
                other.minSalary == minSalary) &&
            (identical(other.responsibility, responsibility) ||
                other.responsibility == responsibility) &&
            (identical(other.salaryType, salaryType) ||
                other.salaryType == salaryType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.employerId, employerId) ||
                other.employerId == employerId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            (identical(other.employerLogoUrl, employerLogoUrl) ||
                other.employerLogoUrl == employerLogoUrl) &&
            (identical(other.appliedCount, appliedCount) ||
                other.appliedCount == appliedCount) &&
            (identical(other.e, e) || other.e == e));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    description,
    education,
    expiredAt,
    jobType,
    maxSalary,
    minSalary,
    responsibility,
    salaryType,
    title,
    employerId,
    currency,
    employerName,
    employerLogoUrl,
    appliedCount,
    e,
  );

  /// Create a copy of JobDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobDtoImplCopyWith<_$JobDtoImpl> get copyWith =>
      __$$JobDtoImplCopyWithImpl<_$JobDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobDtoImplToJson(this);
  }
}

abstract class _JobDto implements JobDto {
  const factory _JobDto({
    required final String id,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
    final String? description,
    final String? education,
    @JsonKey(name: 'expired_at') final String? expiredAt,
    @JsonKey(name: 'job_type') final JobType? jobType,
    @JsonKey(name: 'max_salary') final double? maxSalary,
    @JsonKey(name: 'min_salary') final double? minSalary,
    final String? responsibility,
    @JsonKey(name: 'salary_type') final SalaryType? salaryType,
    required final String title,
    @JsonKey(name: 'employer_id') final String? employerId,
    final Currency? currency,
    @JsonKey(name: 'employer_name') final String? employerName,
    @JsonKey(name: 'employer_logo_url') final String? employerLogoUrl,
    @JsonKey(name: 'applied_count') final int? appliedCount,
    final String? e,
  }) = _$JobDtoImpl;

  factory _JobDto.fromJson(Map<String, dynamic> json) = _$JobDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  String? get description;
  @override
  String? get education;
  @override
  @JsonKey(name: 'expired_at')
  String? get expiredAt;
  @override
  @JsonKey(name: 'job_type')
  JobType? get jobType;
  @override
  @JsonKey(name: 'max_salary')
  double? get maxSalary;
  @override
  @JsonKey(name: 'min_salary')
  double? get minSalary;
  @override
  String? get responsibility;
  @override
  @JsonKey(name: 'salary_type')
  SalaryType? get salaryType;
  @override
  String get title;
  @override
  @JsonKey(name: 'employer_id')
  String? get employerId;
  @override
  Currency? get currency;
  @override
  @JsonKey(name: 'employer_name')
  String? get employerName;
  @override
  @JsonKey(name: 'employer_logo_url')
  String? get employerLogoUrl;
  @override
  @JsonKey(name: 'applied_count')
  int? get appliedCount;
  @override
  String? get e;

  /// Create a copy of JobDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobDtoImplCopyWith<_$JobDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
