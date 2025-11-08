// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_job_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateJobRequest _$CreateJobRequestFromJson(Map<String, dynamic> json) {
  return _CreateJobRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateJobRequest {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get responsibility => throw _privateConstructorUsedError;
  Education? get education => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  JobType? get jobType => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_salary')
  double? get minSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_salary')
  double? get maxSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'salary_type')
  SalaryType? get salaryType => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_at')
  String? get expiredAt => throw _privateConstructorUsedError;

  /// Serializes this CreateJobRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateJobRequestCopyWith<CreateJobRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateJobRequestCopyWith<$Res> {
  factory $CreateJobRequestCopyWith(
    CreateJobRequest value,
    $Res Function(CreateJobRequest) then,
  ) = _$CreateJobRequestCopyWithImpl<$Res, CreateJobRequest>;
  @useResult
  $Res call({
    String title,
    String? description,
    String? responsibility,
    Education? education,
    @JsonKey(name: 'job_type') JobType? jobType,
    @JsonKey(name: 'min_salary') double? minSalary,
    @JsonKey(name: 'max_salary') double? maxSalary,
    @JsonKey(name: 'salary_type') SalaryType? salaryType,
    Currency? currency,
    @JsonKey(name: 'expired_at') String? expiredAt,
  });
}

/// @nodoc
class _$CreateJobRequestCopyWithImpl<$Res, $Val extends CreateJobRequest>
    implements $CreateJobRequestCopyWith<$Res> {
  _$CreateJobRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? responsibility = freezed,
    Object? education = freezed,
    Object? jobType = freezed,
    Object? minSalary = freezed,
    Object? maxSalary = freezed,
    Object? salaryType = freezed,
    Object? currency = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            responsibility: freezed == responsibility
                ? _value.responsibility
                : responsibility // ignore: cast_nullable_to_non_nullable
                      as String?,
            education: freezed == education
                ? _value.education
                : education // ignore: cast_nullable_to_non_nullable
                      as Education?,
            jobType: freezed == jobType
                ? _value.jobType
                : jobType // ignore: cast_nullable_to_non_nullable
                      as JobType?,
            minSalary: freezed == minSalary
                ? _value.minSalary
                : minSalary // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxSalary: freezed == maxSalary
                ? _value.maxSalary
                : maxSalary // ignore: cast_nullable_to_non_nullable
                      as double?,
            salaryType: freezed == salaryType
                ? _value.salaryType
                : salaryType // ignore: cast_nullable_to_non_nullable
                      as SalaryType?,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as Currency?,
            expiredAt: freezed == expiredAt
                ? _value.expiredAt
                : expiredAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateJobRequestImplCopyWith<$Res>
    implements $CreateJobRequestCopyWith<$Res> {
  factory _$$CreateJobRequestImplCopyWith(
    _$CreateJobRequestImpl value,
    $Res Function(_$CreateJobRequestImpl) then,
  ) = __$$CreateJobRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String? description,
    String? responsibility,
    Education? education,
    @JsonKey(name: 'job_type') JobType? jobType,
    @JsonKey(name: 'min_salary') double? minSalary,
    @JsonKey(name: 'max_salary') double? maxSalary,
    @JsonKey(name: 'salary_type') SalaryType? salaryType,
    Currency? currency,
    @JsonKey(name: 'expired_at') String? expiredAt,
  });
}

/// @nodoc
class __$$CreateJobRequestImplCopyWithImpl<$Res>
    extends _$CreateJobRequestCopyWithImpl<$Res, _$CreateJobRequestImpl>
    implements _$$CreateJobRequestImplCopyWith<$Res> {
  __$$CreateJobRequestImplCopyWithImpl(
    _$CreateJobRequestImpl _value,
    $Res Function(_$CreateJobRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? responsibility = freezed,
    Object? education = freezed,
    Object? jobType = freezed,
    Object? minSalary = freezed,
    Object? maxSalary = freezed,
    Object? salaryType = freezed,
    Object? currency = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(
      _$CreateJobRequestImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        responsibility: freezed == responsibility
            ? _value.responsibility
            : responsibility // ignore: cast_nullable_to_non_nullable
                  as String?,
        education: freezed == education
            ? _value.education
            : education // ignore: cast_nullable_to_non_nullable
                  as Education?,
        jobType: freezed == jobType
            ? _value.jobType
            : jobType // ignore: cast_nullable_to_non_nullable
                  as JobType?,
        minSalary: freezed == minSalary
            ? _value.minSalary
            : minSalary // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxSalary: freezed == maxSalary
            ? _value.maxSalary
            : maxSalary // ignore: cast_nullable_to_non_nullable
                  as double?,
        salaryType: freezed == salaryType
            ? _value.salaryType
            : salaryType // ignore: cast_nullable_to_non_nullable
                  as SalaryType?,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as Currency?,
        expiredAt: freezed == expiredAt
            ? _value.expiredAt
            : expiredAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateJobRequestImpl implements _CreateJobRequest {
  const _$CreateJobRequestImpl({
    required this.title,
    this.description,
    this.responsibility,
    this.education,
    @JsonKey(name: 'job_type') this.jobType,
    @JsonKey(name: 'min_salary') this.minSalary,
    @JsonKey(name: 'max_salary') this.maxSalary,
    @JsonKey(name: 'salary_type') this.salaryType,
    this.currency,
    @JsonKey(name: 'expired_at') this.expiredAt,
  });

  factory _$CreateJobRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateJobRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  final String? responsibility;
  @override
  final Education? education;
  @override
  @JsonKey(name: 'job_type')
  final JobType? jobType;
  @override
  @JsonKey(name: 'min_salary')
  final double? minSalary;
  @override
  @JsonKey(name: 'max_salary')
  final double? maxSalary;
  @override
  @JsonKey(name: 'salary_type')
  final SalaryType? salaryType;
  @override
  final Currency? currency;
  @override
  @JsonKey(name: 'expired_at')
  final String? expiredAt;

  @override
  String toString() {
    return 'CreateJobRequest(title: $title, description: $description, responsibility: $responsibility, education: $education, jobType: $jobType, minSalary: $minSalary, maxSalary: $maxSalary, salaryType: $salaryType, currency: $currency, expiredAt: $expiredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateJobRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.responsibility, responsibility) ||
                other.responsibility == responsibility) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.minSalary, minSalary) ||
                other.minSalary == minSalary) &&
            (identical(other.maxSalary, maxSalary) ||
                other.maxSalary == maxSalary) &&
            (identical(other.salaryType, salaryType) ||
                other.salaryType == salaryType) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    responsibility,
    education,
    jobType,
    minSalary,
    maxSalary,
    salaryType,
    currency,
    expiredAt,
  );

  /// Create a copy of CreateJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateJobRequestImplCopyWith<_$CreateJobRequestImpl> get copyWith =>
      __$$CreateJobRequestImplCopyWithImpl<_$CreateJobRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateJobRequestImplToJson(this);
  }
}

abstract class _CreateJobRequest implements CreateJobRequest {
  const factory _CreateJobRequest({
    required final String title,
    final String? description,
    final String? responsibility,
    final Education? education,
    @JsonKey(name: 'job_type') final JobType? jobType,
    @JsonKey(name: 'min_salary') final double? minSalary,
    @JsonKey(name: 'max_salary') final double? maxSalary,
    @JsonKey(name: 'salary_type') final SalaryType? salaryType,
    final Currency? currency,
    @JsonKey(name: 'expired_at') final String? expiredAt,
  }) = _$CreateJobRequestImpl;

  factory _CreateJobRequest.fromJson(Map<String, dynamic> json) =
      _$CreateJobRequestImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  String? get responsibility;
  @override
  Education? get education;
  @override
  @JsonKey(name: 'job_type')
  JobType? get jobType;
  @override
  @JsonKey(name: 'min_salary')
  double? get minSalary;
  @override
  @JsonKey(name: 'max_salary')
  double? get maxSalary;
  @override
  @JsonKey(name: 'salary_type')
  SalaryType? get salaryType;
  @override
  Currency? get currency;
  @override
  @JsonKey(name: 'expired_at')
  String? get expiredAt;

  /// Create a copy of CreateJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateJobRequestImplCopyWith<_$CreateJobRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
