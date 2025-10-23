// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      token: json['token'] as String,
      accountDto: AccountDto.fromJson(
        json['account_dto'] as Map<String, dynamic>,
      ),
      isNewAccount: json['is_new_account'] as bool,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'account_dto': instance.accountDto,
      'is_new_account': instance.isNewAccount,
    };
