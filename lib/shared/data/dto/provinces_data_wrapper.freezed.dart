// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provinces_data_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProvincesDataWrapper _$ProvincesDataWrapperFromJson(Map<String, dynamic> json) {
  return _ProvincesDataWrapper.fromJson(json);
}

/// @nodoc
mixin _$ProvincesDataWrapper {
  List<ProvinceDto> get provinces => throw _privateConstructorUsedError;

  /// Serializes this ProvincesDataWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProvincesDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvincesDataWrapperCopyWith<ProvincesDataWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvincesDataWrapperCopyWith<$Res> {
  factory $ProvincesDataWrapperCopyWith(
    ProvincesDataWrapper value,
    $Res Function(ProvincesDataWrapper) then,
  ) = _$ProvincesDataWrapperCopyWithImpl<$Res, ProvincesDataWrapper>;
  @useResult
  $Res call({List<ProvinceDto> provinces});
}

/// @nodoc
class _$ProvincesDataWrapperCopyWithImpl<
  $Res,
  $Val extends ProvincesDataWrapper
>
    implements $ProvincesDataWrapperCopyWith<$Res> {
  _$ProvincesDataWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProvincesDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? provinces = null}) {
    return _then(
      _value.copyWith(
            provinces: null == provinces
                ? _value.provinces
                : provinces // ignore: cast_nullable_to_non_nullable
                      as List<ProvinceDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProvincesDataWrapperImplCopyWith<$Res>
    implements $ProvincesDataWrapperCopyWith<$Res> {
  factory _$$ProvincesDataWrapperImplCopyWith(
    _$ProvincesDataWrapperImpl value,
    $Res Function(_$ProvincesDataWrapperImpl) then,
  ) = __$$ProvincesDataWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProvinceDto> provinces});
}

/// @nodoc
class __$$ProvincesDataWrapperImplCopyWithImpl<$Res>
    extends _$ProvincesDataWrapperCopyWithImpl<$Res, _$ProvincesDataWrapperImpl>
    implements _$$ProvincesDataWrapperImplCopyWith<$Res> {
  __$$ProvincesDataWrapperImplCopyWithImpl(
    _$ProvincesDataWrapperImpl _value,
    $Res Function(_$ProvincesDataWrapperImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProvincesDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? provinces = null}) {
    return _then(
      _$ProvincesDataWrapperImpl(
        provinces: null == provinces
            ? _value._provinces
            : provinces // ignore: cast_nullable_to_non_nullable
                  as List<ProvinceDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvincesDataWrapperImpl implements _ProvincesDataWrapper {
  const _$ProvincesDataWrapperImpl({required final List<ProvinceDto> provinces})
    : _provinces = provinces;

  factory _$ProvincesDataWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvincesDataWrapperImplFromJson(json);

  final List<ProvinceDto> _provinces;
  @override
  List<ProvinceDto> get provinces {
    if (_provinces is EqualUnmodifiableListView) return _provinces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_provinces);
  }

  @override
  String toString() {
    return 'ProvincesDataWrapper(provinces: $provinces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvincesDataWrapperImpl &&
            const DeepCollectionEquality().equals(
              other._provinces,
              _provinces,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_provinces));

  /// Create a copy of ProvincesDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvincesDataWrapperImplCopyWith<_$ProvincesDataWrapperImpl>
  get copyWith =>
      __$$ProvincesDataWrapperImplCopyWithImpl<_$ProvincesDataWrapperImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvincesDataWrapperImplToJson(this);
  }
}

abstract class _ProvincesDataWrapper implements ProvincesDataWrapper {
  const factory _ProvincesDataWrapper({
    required final List<ProvinceDto> provinces,
  }) = _$ProvincesDataWrapperImpl;

  factory _ProvincesDataWrapper.fromJson(Map<String, dynamic> json) =
      _$ProvincesDataWrapperImpl.fromJson;

  @override
  List<ProvinceDto> get provinces;

  /// Create a copy of ProvincesDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvincesDataWrapperImplCopyWith<_$ProvincesDataWrapperImpl>
  get copyWith => throw _privateConstructorUsedError;
}
