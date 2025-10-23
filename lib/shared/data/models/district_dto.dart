import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_dto.freezed.dart';
part 'district_dto.g.dart';

@freezed
class DistrictDto with _$DistrictDto {
  const factory DistrictDto({
    required String code,
    required String name,
    @JsonKey(name: 'name_en') String? nameEn,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'full_name_en') String? fullNameEn,
  }) = _DistrictDto;

  factory DistrictDto.fromJson(Map<String, dynamic> json) =>
      _$DistrictDtoFromJson(json);
}
