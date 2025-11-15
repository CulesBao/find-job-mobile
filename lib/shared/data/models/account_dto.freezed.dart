// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) {
  return _AccountDto.fromJson(json);
}

/// @nodoc
mixin _$AccountDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  Provider get provider => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'candidate_profile')
  CandidateProfileDto? get candidateProfileDto =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'employer_profile')
  EmployerProfileDto? get employerProfileDto =>
      throw _privateConstructorUsedError;

  /// Serializes this AccountDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountDtoCopyWith<AccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDtoCopyWith<$Res> {
  factory $AccountDtoCopyWith(
    AccountDto value,
    $Res Function(AccountDto) then,
  ) = _$AccountDtoCopyWithImpl<$Res, AccountDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String email,
    @JsonKey(name: 'is_active') bool isActive,
    Provider provider,
    Role role,
    @JsonKey(name: 'candidate_profile')
    CandidateProfileDto? candidateProfileDto,
    @JsonKey(name: 'employer_profile') EmployerProfileDto? employerProfileDto,
  });

  $CandidateProfileDtoCopyWith<$Res>? get candidateProfileDto;
  $EmployerProfileDtoCopyWith<$Res>? get employerProfileDto;
}

/// @nodoc
class _$AccountDtoCopyWithImpl<$Res, $Val extends AccountDto>
    implements $AccountDtoCopyWith<$Res> {
  _$AccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? email = null,
    Object? isActive = null,
    Object? provider = null,
    Object? role = null,
    Object? candidateProfileDto = freezed,
    Object? employerProfileDto = freezed,
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
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            provider: null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as Provider,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as Role,
            candidateProfileDto: freezed == candidateProfileDto
                ? _value.candidateProfileDto
                : candidateProfileDto // ignore: cast_nullable_to_non_nullable
                      as CandidateProfileDto?,
            employerProfileDto: freezed == employerProfileDto
                ? _value.employerProfileDto
                : employerProfileDto // ignore: cast_nullable_to_non_nullable
                      as EmployerProfileDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CandidateProfileDtoCopyWith<$Res>? get candidateProfileDto {
    if (_value.candidateProfileDto == null) {
      return null;
    }

    return $CandidateProfileDtoCopyWith<$Res>(_value.candidateProfileDto!, (
      value,
    ) {
      return _then(_value.copyWith(candidateProfileDto: value) as $Val);
    });
  }

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmployerProfileDtoCopyWith<$Res>? get employerProfileDto {
    if (_value.employerProfileDto == null) {
      return null;
    }

    return $EmployerProfileDtoCopyWith<$Res>(_value.employerProfileDto!, (
      value,
    ) {
      return _then(_value.copyWith(employerProfileDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountDtoImplCopyWith<$Res>
    implements $AccountDtoCopyWith<$Res> {
  factory _$$AccountDtoImplCopyWith(
    _$AccountDtoImpl value,
    $Res Function(_$AccountDtoImpl) then,
  ) = __$$AccountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String email,
    @JsonKey(name: 'is_active') bool isActive,
    Provider provider,
    Role role,
    @JsonKey(name: 'candidate_profile')
    CandidateProfileDto? candidateProfileDto,
    @JsonKey(name: 'employer_profile') EmployerProfileDto? employerProfileDto,
  });

  @override
  $CandidateProfileDtoCopyWith<$Res>? get candidateProfileDto;
  @override
  $EmployerProfileDtoCopyWith<$Res>? get employerProfileDto;
}

/// @nodoc
class __$$AccountDtoImplCopyWithImpl<$Res>
    extends _$AccountDtoCopyWithImpl<$Res, _$AccountDtoImpl>
    implements _$$AccountDtoImplCopyWith<$Res> {
  __$$AccountDtoImplCopyWithImpl(
    _$AccountDtoImpl _value,
    $Res Function(_$AccountDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? email = null,
    Object? isActive = null,
    Object? provider = null,
    Object? role = null,
    Object? candidateProfileDto = freezed,
    Object? employerProfileDto = freezed,
  }) {
    return _then(
      _$AccountDtoImpl(
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
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as Provider,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as Role,
        candidateProfileDto: freezed == candidateProfileDto
            ? _value.candidateProfileDto
            : candidateProfileDto // ignore: cast_nullable_to_non_nullable
                  as CandidateProfileDto?,
        employerProfileDto: freezed == employerProfileDto
            ? _value.employerProfileDto
            : employerProfileDto // ignore: cast_nullable_to_non_nullable
                  as EmployerProfileDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountDtoImpl implements _AccountDto {
  const _$AccountDtoImpl({
    required this.id,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    required this.email,
    @JsonKey(name: 'is_active') required this.isActive,
    required this.provider,
    required this.role,
    @JsonKey(name: 'candidate_profile') this.candidateProfileDto,
    @JsonKey(name: 'employer_profile') this.employerProfileDto,
  });

  factory _$AccountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final String email;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  final Provider provider;
  @override
  final Role role;
  @override
  @JsonKey(name: 'candidate_profile')
  final CandidateProfileDto? candidateProfileDto;
  @override
  @JsonKey(name: 'employer_profile')
  final EmployerProfileDto? employerProfileDto;

  @override
  String toString() {
    return 'AccountDto(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, email: $email, isActive: $isActive, provider: $provider, role: $role, candidateProfileDto: $candidateProfileDto, employerProfileDto: $employerProfileDto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.candidateProfileDto, candidateProfileDto) ||
                other.candidateProfileDto == candidateProfileDto) &&
            (identical(other.employerProfileDto, employerProfileDto) ||
                other.employerProfileDto == employerProfileDto));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    email,
    isActive,
    provider,
    role,
    candidateProfileDto,
    employerProfileDto,
  );

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDtoImplCopyWith<_$AccountDtoImpl> get copyWith =>
      __$$AccountDtoImplCopyWithImpl<_$AccountDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountDtoImplToJson(this);
  }
}

abstract class _AccountDto implements AccountDto {
  const factory _AccountDto({
    required final String id,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    required final String email,
    @JsonKey(name: 'is_active') required final bool isActive,
    required final Provider provider,
    required final Role role,
    @JsonKey(name: 'candidate_profile')
    final CandidateProfileDto? candidateProfileDto,
    @JsonKey(name: 'employer_profile')
    final EmployerProfileDto? employerProfileDto,
  }) = _$AccountDtoImpl;

  factory _AccountDto.fromJson(Map<String, dynamic> json) =
      _$AccountDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  String get email;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  Provider get provider;
  @override
  Role get role;
  @override
  @JsonKey(name: 'candidate_profile')
  CandidateProfileDto? get candidateProfileDto;
  @override
  @JsonKey(name: 'employer_profile')
  EmployerProfileDto? get employerProfileDto;

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDtoImplCopyWith<_$AccountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
