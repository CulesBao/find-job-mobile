// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_social_links_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateSocialLinksRequest _$UpdateSocialLinksRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateSocialLinksRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateSocialLinksRequest {
  @JsonKey(name: 'social_links')
  List<SocialLinkInput> get socialLinks => throw _privateConstructorUsedError;

  /// Serializes this UpdateSocialLinksRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateSocialLinksRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateSocialLinksRequestCopyWith<UpdateSocialLinksRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSocialLinksRequestCopyWith<$Res> {
  factory $UpdateSocialLinksRequestCopyWith(
    UpdateSocialLinksRequest value,
    $Res Function(UpdateSocialLinksRequest) then,
  ) = _$UpdateSocialLinksRequestCopyWithImpl<$Res, UpdateSocialLinksRequest>;
  @useResult
  $Res call({@JsonKey(name: 'social_links') List<SocialLinkInput> socialLinks});
}

/// @nodoc
class _$UpdateSocialLinksRequestCopyWithImpl<
  $Res,
  $Val extends UpdateSocialLinksRequest
>
    implements $UpdateSocialLinksRequestCopyWith<$Res> {
  _$UpdateSocialLinksRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateSocialLinksRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? socialLinks = null}) {
    return _then(
      _value.copyWith(
            socialLinks: null == socialLinks
                ? _value.socialLinks
                : socialLinks // ignore: cast_nullable_to_non_nullable
                      as List<SocialLinkInput>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateSocialLinksRequestImplCopyWith<$Res>
    implements $UpdateSocialLinksRequestCopyWith<$Res> {
  factory _$$UpdateSocialLinksRequestImplCopyWith(
    _$UpdateSocialLinksRequestImpl value,
    $Res Function(_$UpdateSocialLinksRequestImpl) then,
  ) = __$$UpdateSocialLinksRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'social_links') List<SocialLinkInput> socialLinks});
}

/// @nodoc
class __$$UpdateSocialLinksRequestImplCopyWithImpl<$Res>
    extends
        _$UpdateSocialLinksRequestCopyWithImpl<
          $Res,
          _$UpdateSocialLinksRequestImpl
        >
    implements _$$UpdateSocialLinksRequestImplCopyWith<$Res> {
  __$$UpdateSocialLinksRequestImplCopyWithImpl(
    _$UpdateSocialLinksRequestImpl _value,
    $Res Function(_$UpdateSocialLinksRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateSocialLinksRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? socialLinks = null}) {
    return _then(
      _$UpdateSocialLinksRequestImpl(
        socialLinks: null == socialLinks
            ? _value._socialLinks
            : socialLinks // ignore: cast_nullable_to_non_nullable
                  as List<SocialLinkInput>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateSocialLinksRequestImpl implements _UpdateSocialLinksRequest {
  const _$UpdateSocialLinksRequestImpl({
    @JsonKey(name: 'social_links')
    required final List<SocialLinkInput> socialLinks,
  }) : _socialLinks = socialLinks;

  factory _$UpdateSocialLinksRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateSocialLinksRequestImplFromJson(json);

  final List<SocialLinkInput> _socialLinks;
  @override
  @JsonKey(name: 'social_links')
  List<SocialLinkInput> get socialLinks {
    if (_socialLinks is EqualUnmodifiableListView) return _socialLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialLinks);
  }

  @override
  String toString() {
    return 'UpdateSocialLinksRequest(socialLinks: $socialLinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSocialLinksRequestImpl &&
            const DeepCollectionEquality().equals(
              other._socialLinks,
              _socialLinks,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_socialLinks),
  );

  /// Create a copy of UpdateSocialLinksRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSocialLinksRequestImplCopyWith<_$UpdateSocialLinksRequestImpl>
  get copyWith =>
      __$$UpdateSocialLinksRequestImplCopyWithImpl<
        _$UpdateSocialLinksRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateSocialLinksRequestImplToJson(this);
  }
}

abstract class _UpdateSocialLinksRequest implements UpdateSocialLinksRequest {
  const factory _UpdateSocialLinksRequest({
    @JsonKey(name: 'social_links')
    required final List<SocialLinkInput> socialLinks,
  }) = _$UpdateSocialLinksRequestImpl;

  factory _UpdateSocialLinksRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateSocialLinksRequestImpl.fromJson;

  @override
  @JsonKey(name: 'social_links')
  List<SocialLinkInput> get socialLinks;

  /// Create a copy of UpdateSocialLinksRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSocialLinksRequestImplCopyWith<_$UpdateSocialLinksRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SocialLinkInput _$SocialLinkInputFromJson(Map<String, dynamic> json) {
  return _SocialLinkInput.fromJson(json);
}

/// @nodoc
mixin _$SocialLinkInput {
  SocialLinkType get type => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this SocialLinkInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialLinkInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialLinkInputCopyWith<SocialLinkInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialLinkInputCopyWith<$Res> {
  factory $SocialLinkInputCopyWith(
    SocialLinkInput value,
    $Res Function(SocialLinkInput) then,
  ) = _$SocialLinkInputCopyWithImpl<$Res, SocialLinkInput>;
  @useResult
  $Res call({SocialLinkType type, String url});
}

/// @nodoc
class _$SocialLinkInputCopyWithImpl<$Res, $Val extends SocialLinkInput>
    implements $SocialLinkInputCopyWith<$Res> {
  _$SocialLinkInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialLinkInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? url = null}) {
    return _then(
      _value.copyWith(
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
abstract class _$$SocialLinkInputImplCopyWith<$Res>
    implements $SocialLinkInputCopyWith<$Res> {
  factory _$$SocialLinkInputImplCopyWith(
    _$SocialLinkInputImpl value,
    $Res Function(_$SocialLinkInputImpl) then,
  ) = __$$SocialLinkInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SocialLinkType type, String url});
}

/// @nodoc
class __$$SocialLinkInputImplCopyWithImpl<$Res>
    extends _$SocialLinkInputCopyWithImpl<$Res, _$SocialLinkInputImpl>
    implements _$$SocialLinkInputImplCopyWith<$Res> {
  __$$SocialLinkInputImplCopyWithImpl(
    _$SocialLinkInputImpl _value,
    $Res Function(_$SocialLinkInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocialLinkInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? url = null}) {
    return _then(
      _$SocialLinkInputImpl(
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
class _$SocialLinkInputImpl implements _SocialLinkInput {
  const _$SocialLinkInputImpl({required this.type, required this.url});

  factory _$SocialLinkInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialLinkInputImplFromJson(json);

  @override
  final SocialLinkType type;
  @override
  final String url;

  @override
  String toString() {
    return 'SocialLinkInput(type: $type, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialLinkInputImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, url);

  /// Create a copy of SocialLinkInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialLinkInputImplCopyWith<_$SocialLinkInputImpl> get copyWith =>
      __$$SocialLinkInputImplCopyWithImpl<_$SocialLinkInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialLinkInputImplToJson(this);
  }
}

abstract class _SocialLinkInput implements SocialLinkInput {
  const factory _SocialLinkInput({
    required final SocialLinkType type,
    required final String url,
  }) = _$SocialLinkInputImpl;

  factory _SocialLinkInput.fromJson(Map<String, dynamic> json) =
      _$SocialLinkInputImpl.fromJson;

  @override
  SocialLinkType get type;
  @override
  String get url;

  /// Create a copy of SocialLinkInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialLinkInputImplCopyWith<_$SocialLinkInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
