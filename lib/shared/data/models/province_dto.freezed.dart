// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'province_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProvinceDto _$ProvinceDtoFromJson(Map<String, dynamic> json) {
  return _ProvinceDto.fromJson(json);
}

/// @nodoc
mixin _$ProvinceDto {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_en')
  String? get nameEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name_en')
  String? get fullNameEn => throw _privateConstructorUsedError;

  /// Serializes this ProvinceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProvinceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvinceDtoCopyWith<ProvinceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceDtoCopyWith<$Res> {
  factory $ProvinceDtoCopyWith(
    ProvinceDto value,
    $Res Function(ProvinceDto) then,
  ) = _$ProvinceDtoCopyWithImpl<$Res, ProvinceDto>;
  @useResult
  $Res call({
    String code,
    String name,
    @JsonKey(name: 'name_en') String? nameEn,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'full_name_en') String? fullNameEn,
  });
}

/// @nodoc
class _$ProvinceDtoCopyWithImpl<$Res, $Val extends ProvinceDto>
    implements $ProvinceDtoCopyWith<$Res> {
  _$ProvinceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProvinceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? nameEn = freezed,
    Object? fullName = null,
    Object? fullNameEn = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            nameEn: freezed == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            fullNameEn: freezed == fullNameEn
                ? _value.fullNameEn
                : fullNameEn // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProvinceDtoImplCopyWith<$Res>
    implements $ProvinceDtoCopyWith<$Res> {
  factory _$$ProvinceDtoImplCopyWith(
    _$ProvinceDtoImpl value,
    $Res Function(_$ProvinceDtoImpl) then,
  ) = __$$ProvinceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String name,
    @JsonKey(name: 'name_en') String? nameEn,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'full_name_en') String? fullNameEn,
  });
}

/// @nodoc
class __$$ProvinceDtoImplCopyWithImpl<$Res>
    extends _$ProvinceDtoCopyWithImpl<$Res, _$ProvinceDtoImpl>
    implements _$$ProvinceDtoImplCopyWith<$Res> {
  __$$ProvinceDtoImplCopyWithImpl(
    _$ProvinceDtoImpl _value,
    $Res Function(_$ProvinceDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProvinceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? nameEn = freezed,
    Object? fullName = null,
    Object? fullNameEn = freezed,
  }) {
    return _then(
      _$ProvinceDtoImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: freezed == nameEn
            ? _value.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        fullNameEn: freezed == fullNameEn
            ? _value.fullNameEn
            : fullNameEn // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvinceDtoImpl implements _ProvinceDto {
  const _$ProvinceDtoImpl({
    required this.code,
    required this.name,
    @JsonKey(name: 'name_en') this.nameEn,
    @JsonKey(name: 'full_name') required this.fullName,
    @JsonKey(name: 'full_name_en') this.fullNameEn,
  });

  factory _$ProvinceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvinceDtoImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey(name: 'name_en')
  final String? nameEn;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'full_name_en')
  final String? fullNameEn;

  @override
  String toString() {
    return 'ProvinceDto(code: $code, name: $name, nameEn: $nameEn, fullName: $fullName, fullNameEn: $fullNameEn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceDtoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.fullNameEn, fullNameEn) ||
                other.fullNameEn == fullNameEn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, nameEn, fullName, fullNameEn);

  /// Create a copy of ProvinceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceDtoImplCopyWith<_$ProvinceDtoImpl> get copyWith =>
      __$$ProvinceDtoImplCopyWithImpl<_$ProvinceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvinceDtoImplToJson(this);
  }
}

abstract class _ProvinceDto implements ProvinceDto {
  const factory _ProvinceDto({
    required final String code,
    required final String name,
    @JsonKey(name: 'name_en') final String? nameEn,
    @JsonKey(name: 'full_name') required final String fullName,
    @JsonKey(name: 'full_name_en') final String? fullNameEn,
  }) = _$ProvinceDtoImpl;

  factory _ProvinceDto.fromJson(Map<String, dynamic> json) =
      _$ProvinceDtoImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(name: 'name_en')
  String? get nameEn;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'full_name_en')
  String? get fullNameEn;

  /// Create a copy of ProvinceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceDtoImplCopyWith<_$ProvinceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
