// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApplicationDto _$ApplicationDtoFromJson(Map<String, dynamic> json) {
  return _ApplicationDto.fromJson(json);
}

/// @nodoc
mixin _$ApplicationDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_letter')
  String? get coverLetter => throw _privateConstructorUsedError;
  @JsonKey(name: 'cv_url')
  String? get cvUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'candidate_profile')
  CandidateProfileDto get candidateProfile =>
      throw _privateConstructorUsedError;

  /// Serializes this ApplicationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationDtoCopyWith<ApplicationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationDtoCopyWith<$Res> {
  factory $ApplicationDtoCopyWith(
    ApplicationDto value,
    $Res Function(ApplicationDto) then,
  ) = _$ApplicationDtoCopyWithImpl<$Res, ApplicationDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'cover_letter') String? coverLetter,
    @JsonKey(name: 'cv_url') String? cvUrl,
    @JsonKey(name: 'candidate_profile') CandidateProfileDto candidateProfile,
  });

  $CandidateProfileDtoCopyWith<$Res> get candidateProfile;
}

/// @nodoc
class _$ApplicationDtoCopyWithImpl<$Res, $Val extends ApplicationDto>
    implements $ApplicationDtoCopyWith<$Res> {
  _$ApplicationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? coverLetter = freezed,
    Object? cvUrl = freezed,
    Object? candidateProfile = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            coverLetter: freezed == coverLetter
                ? _value.coverLetter
                : coverLetter // ignore: cast_nullable_to_non_nullable
                      as String?,
            cvUrl: freezed == cvUrl
                ? _value.cvUrl
                : cvUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            candidateProfile: null == candidateProfile
                ? _value.candidateProfile
                : candidateProfile // ignore: cast_nullable_to_non_nullable
                      as CandidateProfileDto,
          )
          as $Val,
    );
  }

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CandidateProfileDtoCopyWith<$Res> get candidateProfile {
    return $CandidateProfileDtoCopyWith<$Res>(_value.candidateProfile, (value) {
      return _then(_value.copyWith(candidateProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApplicationDtoImplCopyWith<$Res>
    implements $ApplicationDtoCopyWith<$Res> {
  factory _$$ApplicationDtoImplCopyWith(
    _$ApplicationDtoImpl value,
    $Res Function(_$ApplicationDtoImpl) then,
  ) = __$$ApplicationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'cover_letter') String? coverLetter,
    @JsonKey(name: 'cv_url') String? cvUrl,
    @JsonKey(name: 'candidate_profile') CandidateProfileDto candidateProfile,
  });

  @override
  $CandidateProfileDtoCopyWith<$Res> get candidateProfile;
}

/// @nodoc
class __$$ApplicationDtoImplCopyWithImpl<$Res>
    extends _$ApplicationDtoCopyWithImpl<$Res, _$ApplicationDtoImpl>
    implements _$$ApplicationDtoImplCopyWith<$Res> {
  __$$ApplicationDtoImplCopyWithImpl(
    _$ApplicationDtoImpl _value,
    $Res Function(_$ApplicationDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? coverLetter = freezed,
    Object? cvUrl = freezed,
    Object? candidateProfile = null,
  }) {
    return _then(
      _$ApplicationDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        coverLetter: freezed == coverLetter
            ? _value.coverLetter
            : coverLetter // ignore: cast_nullable_to_non_nullable
                  as String?,
        cvUrl: freezed == cvUrl
            ? _value.cvUrl
            : cvUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        candidateProfile: null == candidateProfile
            ? _value.candidateProfile
            : candidateProfile // ignore: cast_nullable_to_non_nullable
                  as CandidateProfileDto,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationDtoImpl implements _ApplicationDto {
  const _$ApplicationDtoImpl({
    required this.id,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'cover_letter') this.coverLetter,
    @JsonKey(name: 'cv_url') this.cvUrl,
    @JsonKey(name: 'candidate_profile') required this.candidateProfile,
  });

  factory _$ApplicationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'cover_letter')
  final String? coverLetter;
  @override
  @JsonKey(name: 'cv_url')
  final String? cvUrl;
  @override
  @JsonKey(name: 'candidate_profile')
  final CandidateProfileDto candidateProfile;

  @override
  String toString() {
    return 'ApplicationDto(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, coverLetter: $coverLetter, cvUrl: $cvUrl, candidateProfile: $candidateProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.coverLetter, coverLetter) ||
                other.coverLetter == coverLetter) &&
            (identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl) &&
            (identical(other.candidateProfile, candidateProfile) ||
                other.candidateProfile == candidateProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    coverLetter,
    cvUrl,
    candidateProfile,
  );

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationDtoImplCopyWith<_$ApplicationDtoImpl> get copyWith =>
      __$$ApplicationDtoImplCopyWithImpl<_$ApplicationDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationDtoImplToJson(this);
  }
}

abstract class _ApplicationDto implements ApplicationDto {
  const factory _ApplicationDto({
    required final String id,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    @JsonKey(name: 'cover_letter') final String? coverLetter,
    @JsonKey(name: 'cv_url') final String? cvUrl,
    @JsonKey(name: 'candidate_profile')
    required final CandidateProfileDto candidateProfile,
  }) = _$ApplicationDtoImpl;

  factory _ApplicationDto.fromJson(Map<String, dynamic> json) =
      _$ApplicationDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'cover_letter')
  String? get coverLetter;
  @override
  @JsonKey(name: 'cv_url')
  String? get cvUrl;
  @override
  @JsonKey(name: 'candidate_profile')
  CandidateProfileDto get candidateProfile;

  /// Create a copy of ApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationDtoImplCopyWith<_$ApplicationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
