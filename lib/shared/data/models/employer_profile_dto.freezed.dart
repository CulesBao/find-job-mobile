// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employer_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EmployerProfileDto _$EmployerProfileDtoFromJson(Map<String, dynamic> json) {
  return _EmployerProfileDto.fromJson(json);
}

/// @nodoc
mixin _$EmployerProfileDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'established_in')
  String? get establishedIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get vision => throw _privateConstructorUsedError;
  @JsonKey(name: 'website_url')
  String? get websiteUrl => throw _privateConstructorUsedError;
  ProvinceDto get province => throw _privateConstructorUsedError;
  DistrictDto get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_links')
  List<SocialLinkDto> get socialLinks => throw _privateConstructorUsedError;

  /// Serializes this EmployerProfileDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmployerProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployerProfileDtoCopyWith<EmployerProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployerProfileDtoCopyWith<$Res> {
  factory $EmployerProfileDtoCopyWith(
    EmployerProfileDto value,
    $Res Function(EmployerProfileDto) then,
  ) = _$EmployerProfileDtoCopyWithImpl<$Res, EmployerProfileDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? about,
    @JsonKey(name: 'established_in') String? establishedIn,
    @JsonKey(name: 'logo_url') String? logoUrl,
    String name,
    String? vision,
    @JsonKey(name: 'website_url') String? websiteUrl,
    ProvinceDto province,
    DistrictDto district,
    @JsonKey(name: 'social_links') List<SocialLinkDto> socialLinks,
  });

  $ProvinceDtoCopyWith<$Res> get province;
  $DistrictDtoCopyWith<$Res> get district;
}

/// @nodoc
class _$EmployerProfileDtoCopyWithImpl<$Res, $Val extends EmployerProfileDto>
    implements $EmployerProfileDtoCopyWith<$Res> {
  _$EmployerProfileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployerProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? about = freezed,
    Object? establishedIn = freezed,
    Object? logoUrl = freezed,
    Object? name = null,
    Object? vision = freezed,
    Object? websiteUrl = freezed,
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
            about: freezed == about
                ? _value.about
                : about // ignore: cast_nullable_to_non_nullable
                      as String?,
            establishedIn: freezed == establishedIn
                ? _value.establishedIn
                : establishedIn // ignore: cast_nullable_to_non_nullable
                      as String?,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            vision: freezed == vision
                ? _value.vision
                : vision // ignore: cast_nullable_to_non_nullable
                      as String?,
            websiteUrl: freezed == websiteUrl
                ? _value.websiteUrl
                : websiteUrl // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of EmployerProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProvinceDtoCopyWith<$Res> get province {
    return $ProvinceDtoCopyWith<$Res>(_value.province, (value) {
      return _then(_value.copyWith(province: value) as $Val);
    });
  }

  /// Create a copy of EmployerProfileDto
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
abstract class _$$EmployerProfileDtoImplCopyWith<$Res>
    implements $EmployerProfileDtoCopyWith<$Res> {
  factory _$$EmployerProfileDtoImplCopyWith(
    _$EmployerProfileDtoImpl value,
    $Res Function(_$EmployerProfileDtoImpl) then,
  ) = __$$EmployerProfileDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? about,
    @JsonKey(name: 'established_in') String? establishedIn,
    @JsonKey(name: 'logo_url') String? logoUrl,
    String name,
    String? vision,
    @JsonKey(name: 'website_url') String? websiteUrl,
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
class __$$EmployerProfileDtoImplCopyWithImpl<$Res>
    extends _$EmployerProfileDtoCopyWithImpl<$Res, _$EmployerProfileDtoImpl>
    implements _$$EmployerProfileDtoImplCopyWith<$Res> {
  __$$EmployerProfileDtoImplCopyWithImpl(
    _$EmployerProfileDtoImpl _value,
    $Res Function(_$EmployerProfileDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmployerProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? about = freezed,
    Object? establishedIn = freezed,
    Object? logoUrl = freezed,
    Object? name = null,
    Object? vision = freezed,
    Object? websiteUrl = freezed,
    Object? province = null,
    Object? district = null,
    Object? socialLinks = null,
  }) {
    return _then(
      _$EmployerProfileDtoImpl(
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
        about: freezed == about
            ? _value.about
            : about // ignore: cast_nullable_to_non_nullable
                  as String?,
        establishedIn: freezed == establishedIn
            ? _value.establishedIn
            : establishedIn // ignore: cast_nullable_to_non_nullable
                  as String?,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        vision: freezed == vision
            ? _value.vision
            : vision // ignore: cast_nullable_to_non_nullable
                  as String?,
        websiteUrl: freezed == websiteUrl
            ? _value.websiteUrl
            : websiteUrl // ignore: cast_nullable_to_non_nullable
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
class _$EmployerProfileDtoImpl implements _EmployerProfileDto {
  const _$EmployerProfileDtoImpl({
    required this.id,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    this.about,
    @JsonKey(name: 'established_in') this.establishedIn,
    @JsonKey(name: 'logo_url') this.logoUrl,
    required this.name,
    this.vision,
    @JsonKey(name: 'website_url') this.websiteUrl,
    required this.province,
    required this.district,
    @JsonKey(name: 'social_links')
    required final List<SocialLinkDto> socialLinks,
  }) : _socialLinks = socialLinks;

  factory _$EmployerProfileDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployerProfileDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final String? about;
  @override
  @JsonKey(name: 'established_in')
  final String? establishedIn;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @override
  final String name;
  @override
  final String? vision;
  @override
  @JsonKey(name: 'website_url')
  final String? websiteUrl;
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
    return 'EmployerProfileDto(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, about: $about, establishedIn: $establishedIn, logoUrl: $logoUrl, name: $name, vision: $vision, websiteUrl: $websiteUrl, province: $province, district: $district, socialLinks: $socialLinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployerProfileDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.establishedIn, establishedIn) ||
                other.establishedIn == establishedIn) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vision, vision) || other.vision == vision) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
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
    about,
    establishedIn,
    logoUrl,
    name,
    vision,
    websiteUrl,
    province,
    district,
    const DeepCollectionEquality().hash(_socialLinks),
  );

  /// Create a copy of EmployerProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployerProfileDtoImplCopyWith<_$EmployerProfileDtoImpl> get copyWith =>
      __$$EmployerProfileDtoImplCopyWithImpl<_$EmployerProfileDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployerProfileDtoImplToJson(this);
  }
}

abstract class _EmployerProfileDto implements EmployerProfileDto {
  const factory _EmployerProfileDto({
    required final String id,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    final String? about,
    @JsonKey(name: 'established_in') final String? establishedIn,
    @JsonKey(name: 'logo_url') final String? logoUrl,
    required final String name,
    final String? vision,
    @JsonKey(name: 'website_url') final String? websiteUrl,
    required final ProvinceDto province,
    required final DistrictDto district,
    @JsonKey(name: 'social_links')
    required final List<SocialLinkDto> socialLinks,
  }) = _$EmployerProfileDtoImpl;

  factory _EmployerProfileDto.fromJson(Map<String, dynamic> json) =
      _$EmployerProfileDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  String? get about;
  @override
  @JsonKey(name: 'established_in')
  String? get establishedIn;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  String get name;
  @override
  String? get vision;
  @override
  @JsonKey(name: 'website_url')
  String? get websiteUrl;
  @override
  ProvinceDto get province;
  @override
  DistrictDto get district;
  @override
  @JsonKey(name: 'social_links')
  List<SocialLinkDto> get socialLinks;

  /// Create a copy of EmployerProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployerProfileDtoImplCopyWith<_$EmployerProfileDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
