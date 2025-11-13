// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_employer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SavedEmployerDto _$SavedEmployerDtoFromJson(Map<String, dynamic> json) {
  return _SavedEmployerDto.fromJson(json);
}

/// @nodoc
mixin _$SavedEmployerDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_count')
  int? get jobCount => throw _privateConstructorUsedError;

  /// Serializes this SavedEmployerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedEmployerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedEmployerDtoCopyWith<SavedEmployerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedEmployerDtoCopyWith<$Res> {
  factory $SavedEmployerDtoCopyWith(
    SavedEmployerDto value,
    $Res Function(SavedEmployerDto) then,
  ) = _$SavedEmployerDtoCopyWithImpl<$Res, SavedEmployerDto>;
  @useResult
  $Res call({
    String id,
    String name,
    String location,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'job_count') int? jobCount,
  });
}

/// @nodoc
class _$SavedEmployerDtoCopyWithImpl<$Res, $Val extends SavedEmployerDto>
    implements $SavedEmployerDtoCopyWith<$Res> {
  _$SavedEmployerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedEmployerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? logoUrl = freezed,
    Object? jobCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobCount: freezed == jobCount
                ? _value.jobCount
                : jobCount // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SavedEmployerDtoImplCopyWith<$Res>
    implements $SavedEmployerDtoCopyWith<$Res> {
  factory _$$SavedEmployerDtoImplCopyWith(
    _$SavedEmployerDtoImpl value,
    $Res Function(_$SavedEmployerDtoImpl) then,
  ) = __$$SavedEmployerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String location,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'job_count') int? jobCount,
  });
}

/// @nodoc
class __$$SavedEmployerDtoImplCopyWithImpl<$Res>
    extends _$SavedEmployerDtoCopyWithImpl<$Res, _$SavedEmployerDtoImpl>
    implements _$$SavedEmployerDtoImplCopyWith<$Res> {
  __$$SavedEmployerDtoImplCopyWithImpl(
    _$SavedEmployerDtoImpl _value,
    $Res Function(_$SavedEmployerDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SavedEmployerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? logoUrl = freezed,
    Object? jobCount = freezed,
  }) {
    return _then(
      _$SavedEmployerDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobCount: freezed == jobCount
            ? _value.jobCount
            : jobCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedEmployerDtoImpl implements _SavedEmployerDto {
  const _$SavedEmployerDtoImpl({
    required this.id,
    required this.name,
    required this.location,
    @JsonKey(name: 'logo_url') this.logoUrl,
    @JsonKey(name: 'job_count') this.jobCount,
  });

  factory _$SavedEmployerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedEmployerDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String location;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @override
  @JsonKey(name: 'job_count')
  final int? jobCount;

  @override
  String toString() {
    return 'SavedEmployerDto(id: $id, name: $name, location: $location, logoUrl: $logoUrl, jobCount: $jobCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedEmployerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.jobCount, jobCount) ||
                other.jobCount == jobCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, location, logoUrl, jobCount);

  /// Create a copy of SavedEmployerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedEmployerDtoImplCopyWith<_$SavedEmployerDtoImpl> get copyWith =>
      __$$SavedEmployerDtoImplCopyWithImpl<_$SavedEmployerDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedEmployerDtoImplToJson(this);
  }
}

abstract class _SavedEmployerDto implements SavedEmployerDto {
  const factory _SavedEmployerDto({
    required final String id,
    required final String name,
    required final String location,
    @JsonKey(name: 'logo_url') final String? logoUrl,
    @JsonKey(name: 'job_count') final int? jobCount,
  }) = _$SavedEmployerDtoImpl;

  factory _SavedEmployerDto.fromJson(Map<String, dynamic> json) =
      _$SavedEmployerDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get location;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  @JsonKey(name: 'job_count')
  int? get jobCount;

  /// Create a copy of SavedEmployerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedEmployerDtoImplCopyWith<_$SavedEmployerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
