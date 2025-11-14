// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pageable_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PageableResponse<T> _$PageableResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _PageableResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PageableResponse<T> {
  List<T> get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_elements')
  int get totalElements => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;

  /// Serializes this PageableResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PageableResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageableResponseCopyWith<T, PageableResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageableResponseCopyWith<T, $Res> {
  factory $PageableResponseCopyWith(
    PageableResponse<T> value,
    $Res Function(PageableResponse<T>) then,
  ) = _$PageableResponseCopyWithImpl<T, $Res, PageableResponse<T>>;
  @useResult
  $Res call({
    List<T> content,
    @JsonKey(name: 'number') int page,
    int size,
    @JsonKey(name: 'total_elements') int totalElements,
    @JsonKey(name: 'total_pages') int totalPages,
    bool last,
  });
}

/// @nodoc
class _$PageableResponseCopyWithImpl<T, $Res, $Val extends PageableResponse<T>>
    implements $PageableResponseCopyWith<T, $Res> {
  _$PageableResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageableResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? page = null,
    Object? size = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? last = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<T>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
            totalElements: null == totalElements
                ? _value.totalElements
                : totalElements // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            last: null == last
                ? _value.last
                : last // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PageableResponseImplCopyWith<T, $Res>
    implements $PageableResponseCopyWith<T, $Res> {
  factory _$$PageableResponseImplCopyWith(
    _$PageableResponseImpl<T> value,
    $Res Function(_$PageableResponseImpl<T>) then,
  ) = __$$PageableResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    List<T> content,
    @JsonKey(name: 'number') int page,
    int size,
    @JsonKey(name: 'total_elements') int totalElements,
    @JsonKey(name: 'total_pages') int totalPages,
    bool last,
  });
}

/// @nodoc
class __$$PageableResponseImplCopyWithImpl<T, $Res>
    extends _$PageableResponseCopyWithImpl<T, $Res, _$PageableResponseImpl<T>>
    implements _$$PageableResponseImplCopyWith<T, $Res> {
  __$$PageableResponseImplCopyWithImpl(
    _$PageableResponseImpl<T> _value,
    $Res Function(_$PageableResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of PageableResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? page = null,
    Object? size = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? last = null,
  }) {
    return _then(
      _$PageableResponseImpl<T>(
        content: null == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        totalElements: null == totalElements
            ? _value.totalElements
            : totalElements // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        last: null == last
            ? _value.last
            : last // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PageableResponseImpl<T> implements _PageableResponse<T> {
  const _$PageableResponseImpl({
    required final List<T> content,
    @JsonKey(name: 'number') required this.page,
    required this.size,
    @JsonKey(name: 'total_elements') required this.totalElements,
    @JsonKey(name: 'total_pages') required this.totalPages,
    required this.last,
  }) : _content = content;

  factory _$PageableResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$PageableResponseImplFromJson(json, fromJsonT);

  final List<T> _content;
  @override
  List<T> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  @JsonKey(name: 'number')
  final int page;
  @override
  final int size;
  @override
  @JsonKey(name: 'total_elements')
  final int totalElements;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  final bool last;

  @override
  String toString() {
    return 'PageableResponse<$T>(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages, last: $last)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageableResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.last, last) || other.last == last));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_content),
    page,
    size,
    totalElements,
    totalPages,
    last,
  );

  /// Create a copy of PageableResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageableResponseImplCopyWith<T, _$PageableResponseImpl<T>> get copyWith =>
      __$$PageableResponseImplCopyWithImpl<T, _$PageableResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PageableResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _PageableResponse<T> implements PageableResponse<T> {
  const factory _PageableResponse({
    required final List<T> content,
    @JsonKey(name: 'number') required final int page,
    required final int size,
    @JsonKey(name: 'total_elements') required final int totalElements,
    @JsonKey(name: 'total_pages') required final int totalPages,
    required final bool last,
  }) = _$PageableResponseImpl<T>;

  factory _PageableResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$PageableResponseImpl<T>.fromJson;

  @override
  List<T> get content;
  @override
  @JsonKey(name: 'number')
  int get page;
  @override
  int get size;
  @override
  @JsonKey(name: 'total_elements')
  int get totalElements;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  bool get last;

  /// Create a copy of PageableResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageableResponseImplCopyWith<T, _$PageableResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
