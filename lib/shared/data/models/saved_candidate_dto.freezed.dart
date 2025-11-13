// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_candidate_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SavedCandidateDto _$SavedCandidateDtoFromJson(Map<String, dynamic> json) {
  return _SavedCandidateDto.fromJson(json);
}

/// @nodoc
mixin _$SavedCandidateDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get location =>
      throw _privateConstructorUsedError; // Just a string like "Văn Chấn, Yên Bái", not an object
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this SavedCandidateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedCandidateDtoCopyWith<SavedCandidateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedCandidateDtoCopyWith<$Res> {
  factory $SavedCandidateDtoCopyWith(
    SavedCandidateDto value,
    $Res Function(SavedCandidateDto) then,
  ) = _$SavedCandidateDtoCopyWithImpl<$Res, SavedCandidateDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String location,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  });
}

/// @nodoc
class _$SavedCandidateDtoCopyWithImpl<$Res, $Val extends SavedCandidateDto>
    implements $SavedCandidateDtoCopyWith<$Res> {
  _$SavedCandidateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? location = null,
    Object? avatarUrl = freezed,
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
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SavedCandidateDtoImplCopyWith<$Res>
    implements $SavedCandidateDtoCopyWith<$Res> {
  factory _$$SavedCandidateDtoImplCopyWith(
    _$SavedCandidateDtoImpl value,
    $Res Function(_$SavedCandidateDtoImpl) then,
  ) = __$$SavedCandidateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String location,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  });
}

/// @nodoc
class __$$SavedCandidateDtoImplCopyWithImpl<$Res>
    extends _$SavedCandidateDtoCopyWithImpl<$Res, _$SavedCandidateDtoImpl>
    implements _$$SavedCandidateDtoImplCopyWith<$Res> {
  __$$SavedCandidateDtoImplCopyWithImpl(
    _$SavedCandidateDtoImpl _value,
    $Res Function(_$SavedCandidateDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SavedCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? location = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _$SavedCandidateDtoImpl(
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
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedCandidateDtoImpl implements _SavedCandidateDto {
  const _$SavedCandidateDtoImpl({
    required this.id,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    required this.location,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
  });

  factory _$SavedCandidateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedCandidateDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String location;
  // Just a string like "Văn Chấn, Yên Bái", not an object
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  @override
  String toString() {
    return 'SavedCandidateDto(id: $id, firstName: $firstName, lastName: $lastName, location: $location, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedCandidateDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, location, avatarUrl);

  /// Create a copy of SavedCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedCandidateDtoImplCopyWith<_$SavedCandidateDtoImpl> get copyWith =>
      __$$SavedCandidateDtoImplCopyWithImpl<_$SavedCandidateDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedCandidateDtoImplToJson(this);
  }
}

abstract class _SavedCandidateDto implements SavedCandidateDto {
  const factory _SavedCandidateDto({
    required final String id,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    required final String location,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
  }) = _$SavedCandidateDtoImpl;

  factory _SavedCandidateDto.fromJson(Map<String, dynamic> json) =
      _$SavedCandidateDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get location; // Just a string like "Văn Chấn, Yên Bái", not an object
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;

  /// Create a copy of SavedCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedCandidateDtoImplCopyWith<_$SavedCandidateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
