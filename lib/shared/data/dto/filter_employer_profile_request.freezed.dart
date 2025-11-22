// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_employer_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FilterEmployerProfileRequest _$FilterEmployerProfileRequestFromJson(
  Map<String, dynamic> json,
) {
  return _FilterEmployerProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$FilterEmployerProfileRequest {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'provinceCode')
  String? get provinceCode => throw _privateConstructorUsedError;

  /// Serializes this FilterEmployerProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterEmployerProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterEmployerProfileRequestCopyWith<FilterEmployerProfileRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterEmployerProfileRequestCopyWith<$Res> {
  factory $FilterEmployerProfileRequestCopyWith(
    FilterEmployerProfileRequest value,
    $Res Function(FilterEmployerProfileRequest) then,
  ) =
      _$FilterEmployerProfileRequestCopyWithImpl<
        $Res,
        FilterEmployerProfileRequest
      >;
  @useResult
  $Res call({
    String? name,
    @JsonKey(name: 'provinceCode') String? provinceCode,
  });
}

/// @nodoc
class _$FilterEmployerProfileRequestCopyWithImpl<
  $Res,
  $Val extends FilterEmployerProfileRequest
>
    implements $FilterEmployerProfileRequestCopyWith<$Res> {
  _$FilterEmployerProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterEmployerProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? provinceCode = freezed}) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            provinceCode: freezed == provinceCode
                ? _value.provinceCode
                : provinceCode // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterEmployerProfileRequestImplCopyWith<$Res>
    implements $FilterEmployerProfileRequestCopyWith<$Res> {
  factory _$$FilterEmployerProfileRequestImplCopyWith(
    _$FilterEmployerProfileRequestImpl value,
    $Res Function(_$FilterEmployerProfileRequestImpl) then,
  ) = __$$FilterEmployerProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? name,
    @JsonKey(name: 'provinceCode') String? provinceCode,
  });
}

/// @nodoc
class __$$FilterEmployerProfileRequestImplCopyWithImpl<$Res>
    extends
        _$FilterEmployerProfileRequestCopyWithImpl<
          $Res,
          _$FilterEmployerProfileRequestImpl
        >
    implements _$$FilterEmployerProfileRequestImplCopyWith<$Res> {
  __$$FilterEmployerProfileRequestImplCopyWithImpl(
    _$FilterEmployerProfileRequestImpl _value,
    $Res Function(_$FilterEmployerProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterEmployerProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? provinceCode = freezed}) {
    return _then(
      _$FilterEmployerProfileRequestImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        provinceCode: freezed == provinceCode
            ? _value.provinceCode
            : provinceCode // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterEmployerProfileRequestImpl
    implements _FilterEmployerProfileRequest {
  const _$FilterEmployerProfileRequestImpl({
    this.name,
    @JsonKey(name: 'provinceCode') this.provinceCode,
  });

  factory _$FilterEmployerProfileRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$FilterEmployerProfileRequestImplFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'provinceCode')
  final String? provinceCode;

  @override
  String toString() {
    return 'FilterEmployerProfileRequest(name: $name, provinceCode: $provinceCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterEmployerProfileRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, provinceCode);

  /// Create a copy of FilterEmployerProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterEmployerProfileRequestImplCopyWith<
    _$FilterEmployerProfileRequestImpl
  >
  get copyWith =>
      __$$FilterEmployerProfileRequestImplCopyWithImpl<
        _$FilterEmployerProfileRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterEmployerProfileRequestImplToJson(this);
  }
}

abstract class _FilterEmployerProfileRequest
    implements FilterEmployerProfileRequest {
  const factory _FilterEmployerProfileRequest({
    final String? name,
    @JsonKey(name: 'provinceCode') final String? provinceCode,
  }) = _$FilterEmployerProfileRequestImpl;

  factory _FilterEmployerProfileRequest.fromJson(Map<String, dynamic> json) =
      _$FilterEmployerProfileRequestImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'provinceCode')
  String? get provinceCode;

  /// Create a copy of FilterEmployerProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterEmployerProfileRequestImplCopyWith<
    _$FilterEmployerProfileRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
