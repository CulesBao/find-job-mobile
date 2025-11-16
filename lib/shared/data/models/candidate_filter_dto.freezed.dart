// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CandidateFilterDto _$CandidateFilterDtoFromJson(Map<String, dynamic> json) {
  return _CandidateFilterDto.fromJson(json);
}

/// @nodoc
mixin _$CandidateFilterDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  Education? get education => throw _privateConstructorUsedError;
  bool? get gender =>
      throw _privateConstructorUsedError; // true = male, false = female, null = not specified
  String? get location => throw _privateConstructorUsedError;

  /// Serializes this CandidateFilterDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CandidateFilterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandidateFilterDtoCopyWith<CandidateFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateFilterDtoCopyWith<$Res> {
  factory $CandidateFilterDtoCopyWith(
    CandidateFilterDto value,
    $Res Function(CandidateFilterDto) then,
  ) = _$CandidateFilterDtoCopyWithImpl<$Res, CandidateFilterDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    Education? education,
    bool? gender,
    String? location,
  });
}

/// @nodoc
class _$CandidateFilterDtoCopyWithImpl<$Res, $Val extends CandidateFilterDto>
    implements $CandidateFilterDtoCopyWith<$Res> {
  _$CandidateFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CandidateFilterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatarUrl = freezed,
    Object? education = freezed,
    Object? gender = freezed,
    Object? location = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            education: freezed == education
                ? _value.education
                : education // ignore: cast_nullable_to_non_nullable
                      as Education?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as bool?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CandidateFilterDtoImplCopyWith<$Res>
    implements $CandidateFilterDtoCopyWith<$Res> {
  factory _$$CandidateFilterDtoImplCopyWith(
    _$CandidateFilterDtoImpl value,
    $Res Function(_$CandidateFilterDtoImpl) then,
  ) = __$$CandidateFilterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    Education? education,
    bool? gender,
    String? location,
  });
}

/// @nodoc
class __$$CandidateFilterDtoImplCopyWithImpl<$Res>
    extends _$CandidateFilterDtoCopyWithImpl<$Res, _$CandidateFilterDtoImpl>
    implements _$$CandidateFilterDtoImplCopyWith<$Res> {
  __$$CandidateFilterDtoImplCopyWithImpl(
    _$CandidateFilterDtoImpl _value,
    $Res Function(_$CandidateFilterDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CandidateFilterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatarUrl = freezed,
    Object? education = freezed,
    Object? gender = freezed,
    Object? location = freezed,
  }) {
    return _then(
      _$CandidateFilterDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        education: freezed == education
            ? _value.education
            : education // ignore: cast_nullable_to_non_nullable
                  as Education?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as bool?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CandidateFilterDtoImpl implements _CandidateFilterDto {
  const _$CandidateFilterDtoImpl({
    required this.id,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    this.education,
    this.gender,
    this.location,
  });

  factory _$CandidateFilterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateFilterDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final Education? education;
  @override
  final bool? gender;
  // true = male, false = female, null = not specified
  @override
  final String? location;

  @override
  String toString() {
    return 'CandidateFilterDto(id: $id, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, education: $education, gender: $gender, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateFilterDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    lastName,
    avatarUrl,
    education,
    gender,
    location,
  );

  /// Create a copy of CandidateFilterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateFilterDtoImplCopyWith<_$CandidateFilterDtoImpl> get copyWith =>
      __$$CandidateFilterDtoImplCopyWithImpl<_$CandidateFilterDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateFilterDtoImplToJson(this);
  }
}

abstract class _CandidateFilterDto implements CandidateFilterDto {
  const factory _CandidateFilterDto({
    required final String id,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    final Education? education,
    final bool? gender,
    final String? location,
  }) = _$CandidateFilterDtoImpl;

  factory _CandidateFilterDto.fromJson(Map<String, dynamic> json) =
      _$CandidateFilterDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  Education? get education;
  @override
  bool? get gender; // true = male, false = female, null = not specified
  @override
  String? get location;

  /// Create a copy of CandidateFilterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandidateFilterDtoImplCopyWith<_$CandidateFilterDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
