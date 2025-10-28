// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CandidateProfileDto _$CandidateProfileDtoFromJson(Map<String, dynamic> json) {
  return _CandidateProfileDto.fromJson(json);
}

/// @nodoc
mixin _$CandidateProfileDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  Education? get education => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  bool? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  ProvinceDto get province => throw _privateConstructorUsedError;
  DistrictDto get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_links')
  List<SocialLinkDto> get socialLinks => throw _privateConstructorUsedError;

  /// Serializes this CandidateProfileDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CandidateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandidateProfileDtoCopyWith<CandidateProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateProfileDtoCopyWith<$Res> {
  factory $CandidateProfileDtoCopyWith(
    CandidateProfileDto value,
    $Res Function(CandidateProfileDto) then,
  ) = _$CandidateProfileDtoCopyWithImpl<$Res, CandidateProfileDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? bio,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    Education? education,
    @JsonKey(name: 'first_name') String firstName,
    bool? gender,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    ProvinceDto province,
    DistrictDto district,
    @JsonKey(name: 'social_links') List<SocialLinkDto> socialLinks,
  });

  $ProvinceDtoCopyWith<$Res> get province;
  $DistrictDtoCopyWith<$Res> get district;
}

/// @nodoc
class _$CandidateProfileDtoCopyWithImpl<$Res, $Val extends CandidateProfileDto>
    implements $CandidateProfileDtoCopyWith<$Res> {
  _$CandidateProfileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CandidateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? avatarUrl = freezed,
    Object? bio = freezed,
    Object? dateOfBirth = freezed,
    Object? education = freezed,
    Object? firstName = null,
    Object? gender = freezed,
    Object? lastName = null,
    Object? phoneNumber = freezed,
    Object? province = null,
    Object? district = null,
    Object? socialLinks = null,
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
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as bool?,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            province: null == province
                ? _value.province
                : province // ignore: cast_nullable_to_non_nullable
                      as ProvinceDto,
            district: null == district
                ? _value.district
                : district // ignore: cast_nullable_to_non_nullable
                      as DistrictDto,
            socialLinks: null == socialLinks
                ? _value.socialLinks
                : socialLinks // ignore: cast_nullable_to_non_nullable
                      as List<SocialLinkDto>,
          )
          as $Val,
    );
  }

  /// Create a copy of CandidateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProvinceDtoCopyWith<$Res> get province {
    return $ProvinceDtoCopyWith<$Res>(_value.province, (value) {
      return _then(_value.copyWith(province: value) as $Val);
    });
  }

  /// Create a copy of CandidateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DistrictDtoCopyWith<$Res> get district {
    return $DistrictDtoCopyWith<$Res>(_value.district, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CandidateProfileDtoImplCopyWith<$Res>
    implements $CandidateProfileDtoCopyWith<$Res> {
  factory _$$CandidateProfileDtoImplCopyWith(
    _$CandidateProfileDtoImpl value,
    $Res Function(_$CandidateProfileDtoImpl) then,
  ) = __$$CandidateProfileDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? bio,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    Education? education,
    @JsonKey(name: 'first_name') String firstName,
    bool? gender,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    ProvinceDto province,
    DistrictDto district,
    @JsonKey(name: 'social_links') List<SocialLinkDto> socialLinks,
  });

  @override
  $ProvinceDtoCopyWith<$Res> get province;
  @override
  $DistrictDtoCopyWith<$Res> get district;
}

/// @nodoc
class __$$CandidateProfileDtoImplCopyWithImpl<$Res>
    extends _$CandidateProfileDtoCopyWithImpl<$Res, _$CandidateProfileDtoImpl>
    implements _$$CandidateProfileDtoImplCopyWith<$Res> {
  __$$CandidateProfileDtoImplCopyWithImpl(
    _$CandidateProfileDtoImpl _value,
    $Res Function(_$CandidateProfileDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CandidateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? avatarUrl = freezed,
    Object? bio = freezed,
    Object? dateOfBirth = freezed,
    Object? education = freezed,
    Object? firstName = null,
    Object? gender = freezed,
    Object? lastName = null,
    Object? phoneNumber = freezed,
    Object? province = null,
    Object? district = null,
    Object? socialLinks = null,
  }) {
    return _then(
      _$CandidateProfileDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as bool?,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        province: null == province
            ? _value.province
            : province // ignore: cast_nullable_to_non_nullable
                  as ProvinceDto,
        district: null == district
            ? _value.district
            : district // ignore: cast_nullable_to_non_nullable
                  as DistrictDto,
        socialLinks: null == socialLinks
            ? _value._socialLinks
            : socialLinks // ignore: cast_nullable_to_non_nullable
                  as List<SocialLinkDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CandidateProfileDtoImpl implements _CandidateProfileDto {
  const _$CandidateProfileDtoImpl({
    required this.id,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    this.bio,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.education,
    @JsonKey(name: 'first_name') required this.firstName,
    this.gender,
    @JsonKey(name: 'last_name') required this.lastName,
    @JsonKey(name: 'phone_number') this.phoneNumber,
    required this.province,
    required this.district,
    @JsonKey(name: 'social_links')
    required final List<SocialLinkDto> socialLinks,
  }) : _socialLinks = socialLinks;

  factory _$CandidateProfileDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateProfileDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String? bio;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  final Education? education;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  final bool? gender;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  final ProvinceDto province;
  @override
  final DistrictDto district;
  final List<SocialLinkDto> _socialLinks;
  @override
  @JsonKey(name: 'social_links')
  List<SocialLinkDto> get socialLinks {
    if (_socialLinks is EqualUnmodifiableListView) return _socialLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialLinks);
  }

  @override
  String toString() {
    return 'CandidateProfileDto(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, avatarUrl: $avatarUrl, bio: $bio, dateOfBirth: $dateOfBirth, education: $education, firstName: $firstName, gender: $gender, lastName: $lastName, phoneNumber: $phoneNumber, province: $province, district: $district, socialLinks: $socialLinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateProfileDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            const DeepCollectionEquality().equals(
              other._socialLinks,
              _socialLinks,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    avatarUrl,
    bio,
    dateOfBirth,
    education,
    firstName,
    gender,
    lastName,
    phoneNumber,
    province,
    district,
    const DeepCollectionEquality().hash(_socialLinks),
  );

  /// Create a copy of CandidateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateProfileDtoImplCopyWith<_$CandidateProfileDtoImpl> get copyWith =>
      __$$CandidateProfileDtoImplCopyWithImpl<_$CandidateProfileDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateProfileDtoImplToJson(this);
  }
}

abstract class _CandidateProfileDto implements CandidateProfileDto {
  const factory _CandidateProfileDto({
    required final String id,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    final String? bio,
    @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
    final Education? education,
    @JsonKey(name: 'first_name') required final String firstName,
    final bool? gender,
    @JsonKey(name: 'last_name') required final String lastName,
    @JsonKey(name: 'phone_number') final String? phoneNumber,
    required final ProvinceDto province,
    required final DistrictDto district,
    @JsonKey(name: 'social_links')
    required final List<SocialLinkDto> socialLinks,
  }) = _$CandidateProfileDtoImpl;

  factory _CandidateProfileDto.fromJson(Map<String, dynamic> json) =
      _$CandidateProfileDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  Education? get education;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  bool? get gender;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  ProvinceDto get province;
  @override
  DistrictDto get district;
  @override
  @JsonKey(name: 'social_links')
  List<SocialLinkDto> get socialLinks;

  /// Create a copy of CandidateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandidateProfileDtoImplCopyWith<_$CandidateProfileDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
