// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_link_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SocialLinkDto _$SocialLinkDtoFromJson(Map<String, dynamic> json) {
  return _SocialLinkDto.fromJson(json);
}

/// @nodoc
mixin _$SocialLinkDto {
  String get id => throw _privateConstructorUsedError;
  SocialLinkType get type => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this SocialLinkDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialLinkDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialLinkDtoCopyWith<SocialLinkDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialLinkDtoCopyWith<$Res> {
  factory $SocialLinkDtoCopyWith(
    SocialLinkDto value,
    $Res Function(SocialLinkDto) then,
  ) = _$SocialLinkDtoCopyWithImpl<$Res, SocialLinkDto>;
  @useResult
  $Res call({String id, SocialLinkType type, String url});
}

/// @nodoc
class _$SocialLinkDtoCopyWithImpl<$Res, $Val extends SocialLinkDto>
    implements $SocialLinkDtoCopyWith<$Res> {
  _$SocialLinkDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialLinkDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? type = null, Object? url = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as SocialLinkType,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocialLinkDtoImplCopyWith<$Res>
    implements $SocialLinkDtoCopyWith<$Res> {
  factory _$$SocialLinkDtoImplCopyWith(
    _$SocialLinkDtoImpl value,
    $Res Function(_$SocialLinkDtoImpl) then,
  ) = __$$SocialLinkDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, SocialLinkType type, String url});
}

/// @nodoc
class __$$SocialLinkDtoImplCopyWithImpl<$Res>
    extends _$SocialLinkDtoCopyWithImpl<$Res, _$SocialLinkDtoImpl>
    implements _$$SocialLinkDtoImplCopyWith<$Res> {
  __$$SocialLinkDtoImplCopyWithImpl(
    _$SocialLinkDtoImpl _value,
    $Res Function(_$SocialLinkDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocialLinkDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? type = null, Object? url = null}) {
    return _then(
      _$SocialLinkDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as SocialLinkType,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialLinkDtoImpl implements _SocialLinkDto {
  const _$SocialLinkDtoImpl({
    required this.id,
    required this.type,
    required this.url,
  });

  factory _$SocialLinkDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialLinkDtoImplFromJson(json);

  @override
  final String id;
  @override
  final SocialLinkType type;
  @override
  final String url;

  @override
  String toString() {
    return 'SocialLinkDto(id: $id, type: $type, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialLinkDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, url);

  /// Create a copy of SocialLinkDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialLinkDtoImplCopyWith<_$SocialLinkDtoImpl> get copyWith =>
      __$$SocialLinkDtoImplCopyWithImpl<_$SocialLinkDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialLinkDtoImplToJson(this);
  }
}

abstract class _SocialLinkDto implements SocialLinkDto {
  const factory _SocialLinkDto({
    required final String id,
    required final SocialLinkType type,
    required final String url,
  }) = _$SocialLinkDtoImpl;

  factory _SocialLinkDto.fromJson(Map<String, dynamic> json) =
      _$SocialLinkDtoImpl.fromJson;

  @override
  String get id;
  @override
  SocialLinkType get type;
  @override
  String get url;

  /// Create a copy of SocialLinkDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialLinkDtoImplCopyWith<_$SocialLinkDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
