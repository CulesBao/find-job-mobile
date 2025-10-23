// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_job_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FilterJobRequest _$FilterJobRequestFromJson(Map<String, dynamic> json) {
  return _FilterJobRequest.fromJson(json);
}

/// @nodoc
mixin _$FilterJobRequest {
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_code')
  String? get provinceCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  JobType? get jobType => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_salary')
  double? get minSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_salary')
  double? get maxSalary => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'salary_type')
  SalaryType? get salaryType => throw _privateConstructorUsedError;
  Education? get education => throw _privateConstructorUsedError;

  /// Serializes this FilterJobRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterJobRequestCopyWith<FilterJobRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterJobRequestCopyWith<$Res> {
  factory $FilterJobRequestCopyWith(
    FilterJobRequest value,
    $Res Function(FilterJobRequest) then,
  ) = _$FilterJobRequestCopyWithImpl<$Res, FilterJobRequest>;
  @useResult
  $Res call({
    String? title,
    @JsonKey(name: 'province_code') String? provinceCode,
    @JsonKey(name: 'job_type') JobType? jobType,
    @JsonKey(name: 'min_salary') double? minSalary,
    @JsonKey(name: 'max_salary') double? maxSalary,
    Currency? currency,
    @JsonKey(name: 'salary_type') SalaryType? salaryType,
    Education? education,
  });
}

/// @nodoc
class _$FilterJobRequestCopyWithImpl<$Res, $Val extends FilterJobRequest>
    implements $FilterJobRequestCopyWith<$Res> {
  _$FilterJobRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? provinceCode = freezed,
    Object? jobType = freezed,
    Object? minSalary = freezed,
    Object? maxSalary = freezed,
    Object? currency = freezed,
    Object? salaryType = freezed,
    Object? education = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            provinceCode: freezed == provinceCode
                ? _value.provinceCode
                : provinceCode // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as Currency?,
            salaryType: freezed == salaryType
                ? _value.salaryType
                : salaryType // ignore: cast_nullable_to_non_nullable
                      as SalaryType?,
            education: freezed == education
                ? _value.education
                : education // ignore: cast_nullable_to_non_nullable
                      as Education?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterJobRequestImplCopyWith<$Res>
    implements $FilterJobRequestCopyWith<$Res> {
  factory _$$FilterJobRequestImplCopyWith(
    _$FilterJobRequestImpl value,
    $Res Function(_$FilterJobRequestImpl) then,
  ) = __$$FilterJobRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? title,
    @JsonKey(name: 'province_code') String? provinceCode,
    @JsonKey(name: 'job_type') JobType? jobType,
    @JsonKey(name: 'min_salary') double? minSalary,
    @JsonKey(name: 'max_salary') double? maxSalary,
    Currency? currency,
    @JsonKey(name: 'salary_type') SalaryType? salaryType,
    Education? education,
  });
}

/// @nodoc
class __$$FilterJobRequestImplCopyWithImpl<$Res>
    extends _$FilterJobRequestCopyWithImpl<$Res, _$FilterJobRequestImpl>
    implements _$$FilterJobRequestImplCopyWith<$Res> {
  __$$FilterJobRequestImplCopyWithImpl(
    _$FilterJobRequestImpl _value,
    $Res Function(_$FilterJobRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? provinceCode = freezed,
    Object? jobType = freezed,
    Object? minSalary = freezed,
    Object? maxSalary = freezed,
    Object? currency = freezed,
    Object? salaryType = freezed,
    Object? education = freezed,
  }) {
    return _then(
      _$FilterJobRequestImpl(
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        provinceCode: freezed == provinceCode
            ? _value.provinceCode
            : provinceCode // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as Currency?,
        salaryType: freezed == salaryType
            ? _value.salaryType
            : salaryType // ignore: cast_nullable_to_non_nullable
                  as SalaryType?,
        education: freezed == education
            ? _value.education
            : education // ignore: cast_nullable_to_non_nullable
                  as Education?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterJobRequestImpl implements _FilterJobRequest {
  const _$FilterJobRequestImpl({
    this.title,
    @JsonKey(name: 'province_code') this.provinceCode,
    @JsonKey(name: 'job_type') this.jobType,
    @JsonKey(name: 'min_salary') this.minSalary,
    @JsonKey(name: 'max_salary') this.maxSalary,
    this.currency,
    @JsonKey(name: 'salary_type') this.salaryType,
    this.education,
  });

  factory _$FilterJobRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterJobRequestImplFromJson(json);

  @override
  final String? title;
  @override
  @JsonKey(name: 'province_code')
  final String? provinceCode;
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
  final Currency? currency;
  @override
  @JsonKey(name: 'salary_type')
  final SalaryType? salaryType;
  @override
  final Education? education;

  @override
  String toString() {
    return 'FilterJobRequest(title: $title, provinceCode: $provinceCode, jobType: $jobType, minSalary: $minSalary, maxSalary: $maxSalary, currency: $currency, salaryType: $salaryType, education: $education)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterJobRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.minSalary, minSalary) ||
                other.minSalary == minSalary) &&
            (identical(other.maxSalary, maxSalary) ||
                other.maxSalary == maxSalary) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.salaryType, salaryType) ||
                other.salaryType == salaryType) &&
            (identical(other.education, education) ||
                other.education == education));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    provinceCode,
    jobType,
    minSalary,
    maxSalary,
    currency,
    salaryType,
    education,
  );

  /// Create a copy of FilterJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterJobRequestImplCopyWith<_$FilterJobRequestImpl> get copyWith =>
      __$$FilterJobRequestImplCopyWithImpl<_$FilterJobRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterJobRequestImplToJson(this);
  }
}

abstract class _FilterJobRequest implements FilterJobRequest {
  const factory _FilterJobRequest({
    final String? title,
    @JsonKey(name: 'province_code') final String? provinceCode,
    @JsonKey(name: 'job_type') final JobType? jobType,
    @JsonKey(name: 'min_salary') final double? minSalary,
    @JsonKey(name: 'max_salary') final double? maxSalary,
    final Currency? currency,
    @JsonKey(name: 'salary_type') final SalaryType? salaryType,
    final Education? education,
  }) = _$FilterJobRequestImpl;

  factory _FilterJobRequest.fromJson(Map<String, dynamic> json) =
      _$FilterJobRequestImpl.fromJson;

  @override
  String? get title;
  @override
  @JsonKey(name: 'province_code')
  String? get provinceCode;
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
  Currency? get currency;
  @override
  @JsonKey(name: 'salary_type')
  SalaryType? get salaryType;
  @override
  Education? get education;

  /// Create a copy of FilterJobRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterJobRequestImplCopyWith<_$FilterJobRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
