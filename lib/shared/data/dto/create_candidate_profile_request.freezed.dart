// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_candidate_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateCandidateProfileRequest _$CreateCandidateProfileRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreateCandidateProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateCandidateProfileRequest {
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_code')
  String get provinceCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_code')
  String get districtCode => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  Education? get education => throw _privateConstructorUsedError;
  bool? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this CreateCandidateProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCandidateProfileRequestCopyWith<CreateCandidateProfileRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCandidateProfileRequestCopyWith<$Res> {
  factory $CreateCandidateProfileRequestCopyWith(
    CreateCandidateProfileRequest value,
    $Res Function(CreateCandidateProfileRequest) then,
  ) =
      _$CreateCandidateProfileRequestCopyWithImpl<
        $Res,
        CreateCandidateProfileRequest
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'province_code') String provinceCode,
    @JsonKey(name: 'district_code') String districtCode,
    String? bio,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    Education? education,
    bool? gender,
    @JsonKey(name: 'phone_number') String? phoneNumber,
  });
}

/// @nodoc
class _$CreateCandidateProfileRequestCopyWithImpl<
  $Res,
  $Val extends CreateCandidateProfileRequest
>
    implements $CreateCandidateProfileRequestCopyWith<$Res> {
  _$CreateCandidateProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? provinceCode = null,
    Object? districtCode = null,
    Object? bio = freezed,
    Object? dateOfBirth = freezed,
    Object? education = freezed,
    Object? gender = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(
      _value.copyWith(
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            provinceCode: null == provinceCode
                ? _value.provinceCode
                : provinceCode // ignore: cast_nullable_to_non_nullable
                      as String,
            districtCode: null == districtCode
                ? _value.districtCode
                : districtCode // ignore: cast_nullable_to_non_nullable
                      as String,
            bio: freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            education: freezed == education
                ? _value.education
                : education // ignore: cast_nullable_to_non_nullable
                      as Education?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as bool?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateCandidateProfileRequestImplCopyWith<$Res>
    implements $CreateCandidateProfileRequestCopyWith<$Res> {
  factory _$$CreateCandidateProfileRequestImplCopyWith(
    _$CreateCandidateProfileRequestImpl value,
    $Res Function(_$CreateCandidateProfileRequestImpl) then,
  ) = __$$CreateCandidateProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'province_code') String provinceCode,
    @JsonKey(name: 'district_code') String districtCode,
    String? bio,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    Education? education,
    bool? gender,
    @JsonKey(name: 'phone_number') String? phoneNumber,
  });
}

/// @nodoc
class __$$CreateCandidateProfileRequestImplCopyWithImpl<$Res>
    extends
        _$CreateCandidateProfileRequestCopyWithImpl<
          $Res,
          _$CreateCandidateProfileRequestImpl
        >
    implements _$$CreateCandidateProfileRequestImplCopyWith<$Res> {
  __$$CreateCandidateProfileRequestImplCopyWithImpl(
    _$CreateCandidateProfileRequestImpl _value,
    $Res Function(_$CreateCandidateProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? provinceCode = null,
    Object? districtCode = null,
    Object? bio = freezed,
    Object? dateOfBirth = freezed,
    Object? education = freezed,
    Object? gender = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(
      _$CreateCandidateProfileRequestImpl(
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        provinceCode: null == provinceCode
            ? _value.provinceCode
            : provinceCode // ignore: cast_nullable_to_non_nullable
                  as String,
        districtCode: null == districtCode
            ? _value.districtCode
            : districtCode // ignore: cast_nullable_to_non_nullable
                  as String,
        bio: freezed == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        education: freezed == education
            ? _value.education
            : education // ignore: cast_nullable_to_non_nullable
                  as Education?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as bool?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCandidateProfileRequestImpl
    implements _CreateCandidateProfileRequest {
  const _$CreateCandidateProfileRequestImpl({
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    @JsonKey(name: 'province_code') required this.provinceCode,
    @JsonKey(name: 'district_code') required this.districtCode,
    this.bio,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.education,
    this.gender,
    @JsonKey(name: 'phone_number') this.phoneNumber,
  });

  factory _$CreateCandidateProfileRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateCandidateProfileRequestImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'province_code')
  final String provinceCode;
  @override
  @JsonKey(name: 'district_code')
  final String districtCode;
  @override
  final String? bio;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  final Education? education;
  @override
  final bool? gender;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  @override
  String toString() {
    return 'CreateCandidateProfileRequest(firstName: $firstName, lastName: $lastName, provinceCode: $provinceCode, districtCode: $districtCode, bio: $bio, dateOfBirth: $dateOfBirth, education: $education, gender: $gender, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCandidateProfileRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.districtCode, districtCode) ||
                other.districtCode == districtCode) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    firstName,
    lastName,
    provinceCode,
    districtCode,
    bio,
    dateOfBirth,
    education,
    gender,
    phoneNumber,
  );

  /// Create a copy of CreateCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCandidateProfileRequestImplCopyWith<
    _$CreateCandidateProfileRequestImpl
  >
  get copyWith =>
      __$$CreateCandidateProfileRequestImplCopyWithImpl<
        _$CreateCandidateProfileRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCandidateProfileRequestImplToJson(this);
  }
}

abstract class _CreateCandidateProfileRequest
    implements CreateCandidateProfileRequest {
  const factory _CreateCandidateProfileRequest({
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    @JsonKey(name: 'province_code') required final String provinceCode,
    @JsonKey(name: 'district_code') required final String districtCode,
    final String? bio,
    @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
    final Education? education,
    final bool? gender,
    @JsonKey(name: 'phone_number') final String? phoneNumber,
  }) = _$CreateCandidateProfileRequestImpl;

  factory _CreateCandidateProfileRequest.fromJson(Map<String, dynamic> json) =
      _$CreateCandidateProfileRequestImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'province_code')
  String get provinceCode;
  @override
  @JsonKey(name: 'district_code')
  String get districtCode;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  Education? get education;
  @override
  bool? get gender;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;

  /// Create a copy of CreateCandidateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCandidateProfileRequestImplCopyWith<
    _$CreateCandidateProfileRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
