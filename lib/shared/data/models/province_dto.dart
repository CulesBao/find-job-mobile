import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_dto.freezed.dart';
part 'province_dto.g.dart';

@freezed
class ProvinceDto with _$ProvinceDto {
  const factory ProvinceDto({
    required String code,
    required String name,
    @JsonKey(name: 'name_en') String? nameEn,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'full_name_en') String? fullNameEn,
  }) = _ProvinceDto;

  factory ProvinceDto.fromJson(Map<String, dynamic> json) =>
      _$ProvinceDtoFromJson(json);
}
