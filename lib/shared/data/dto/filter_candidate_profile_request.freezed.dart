// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_candidate_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FilterCandidateProfileRequest _$FilterCandidateProfileRequestFromJson(
  Map<String, dynamic> json,
) {
  return _FilterCandidateProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$FilterCandidateProfileRequest {
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  Education? get education => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_code')
  String? get provinceCode => throw _privateConstructorUsedError;
  GenderFilter? get gender => throw _privateConstructorUsedError;

  /// Serializes this FilterCandidateProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterCandidateProfileRequestCopyWith<FilterCandidateProfileRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCandidateProfileRequestCopyWith<$Res> {
  factory $FilterCandidateProfileRequestCopyWith(
    FilterCandidateProfileRequest value,
    $Res Function(FilterCandidateProfileRequest) then,
  ) =
      _$FilterCandidateProfileRequestCopyWithImpl<
        $Res,
        FilterCandidateProfileRequest
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    Education? education,
    @JsonKey(name: 'province_code') String? provinceCode,
    GenderFilter? gender,
  });
}

/// @nodoc
class _$FilterCandidateProfileRequestCopyWithImpl<
  $Res,
  $Val extends FilterCandidateProfileRequest
>
    implements $FilterCandidateProfileRequestCopyWith<$Res> {
  _$FilterCandidateProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? education = freezed,
    Object? provinceCode = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _value.copyWith(
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            education: freezed == education
                ? _value.education
                : education // ignore: cast_nullable_to_non_nullable
                      as Education?,
            provinceCode: freezed == provinceCode
                ? _value.provinceCode
                : provinceCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as GenderFilter?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterCandidateProfileRequestImplCopyWith<$Res>
    implements $FilterCandidateProfileRequestCopyWith<$Res> {
  factory _$$FilterCandidateProfileRequestImplCopyWith(
    _$FilterCandidateProfileRequestImpl value,
    $Res Function(_$FilterCandidateProfileRequestImpl) then,
  ) = __$$FilterCandidateProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    Education? education,
    @JsonKey(name: 'province_code') String? provinceCode,
    GenderFilter? gender,
  });
}

/// @nodoc
class __$$FilterCandidateProfileRequestImplCopyWithImpl<$Res>
    extends
        _$FilterCandidateProfileRequestCopyWithImpl<
          $Res,
          _$FilterCandidateProfileRequestImpl
        >
    implements _$$FilterCandidateProfileRequestImplCopyWith<$Res> {
  __$$FilterCandidateProfileRequestImplCopyWithImpl(
    _$FilterCandidateProfileRequestImpl _value,
    $Res Function(_$FilterCandidateProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? education = freezed,
    Object? provinceCode = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _$FilterCandidateProfileRequestImpl(
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        education: freezed == education
            ? _value.education
            : education // ignore: cast_nullable_to_non_nullable
                  as Education?,
        provinceCode: freezed == provinceCode
            ? _value.provinceCode
            : provinceCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as GenderFilter?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterCandidateProfileRequestImpl
    implements _FilterCandidateProfileRequest {
  const _$FilterCandidateProfileRequestImpl({
    @JsonKey(name: 'first_name') this.firstName,
    @JsonKey(name: 'last_name') this.lastName,
    this.education,
    @JsonKey(name: 'province_code') this.provinceCode,
    this.gender,
  });

  factory _$FilterCandidateProfileRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$FilterCandidateProfileRequestImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final Education? education;
  @override
  @JsonKey(name: 'province_code')
  final String? provinceCode;
  @override
  final GenderFilter? gender;

  @override
  String toString() {
    return 'FilterCandidateProfileRequest(firstName: $firstName, lastName: $lastName, education: $education, provinceCode: $provinceCode, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterCandidateProfileRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    firstName,
    lastName,
    education,
    provinceCode,
    gender,
  );

  /// Create a copy of FilterCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterCandidateProfileRequestImplCopyWith<
    _$FilterCandidateProfileRequestImpl
  >
  get copyWith =>
      __$$FilterCandidateProfileRequestImplCopyWithImpl<
        _$FilterCandidateProfileRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterCandidateProfileRequestImplToJson(this);
  }
}

abstract class _FilterCandidateProfileRequest
    implements FilterCandidateProfileRequest {
  const factory _FilterCandidateProfileRequest({
    @JsonKey(name: 'first_name') final String? firstName,
    @JsonKey(name: 'last_name') final String? lastName,
    final Education? education,
    @JsonKey(name: 'province_code') final String? provinceCode,
    final GenderFilter? gender,
  }) = _$FilterCandidateProfileRequestImpl;

  factory _FilterCandidateProfileRequest.fromJson(Map<String, dynamic> json) =
      _$FilterCandidateProfileRequestImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  Education? get education;
  @override
  @JsonKey(name: 'province_code')
  String? get provinceCode;
  @override
  GenderFilter? get gender;

  /// Create a copy of FilterCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterCandidateProfileRequestImplCopyWith<
    _$FilterCandidateProfileRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
