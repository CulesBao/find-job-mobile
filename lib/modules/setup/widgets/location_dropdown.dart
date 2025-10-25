import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../../../shared/data/repositories/location_repository.dart';
import '../../../shared/data/models/province_dto.dart';
import '../../../shared/data/models/district_dto.dart';
import '../../../app/config/service_locator.dart';

class ProvinceDistrictSelector extends StatefulWidget {
  final String? initialProvince;
  final String? initialDistrict;
  final ValueChanged<String>? onProvinceChanged;
  final ValueChanged<String>? onDistrictChanged;

  const ProvinceDistrictSelector({
    super.key,
    this.initialProvince,
    this.initialDistrict,
    this.onProvinceChanged,
    this.onDistrictChanged,
  });

  @override
  State<ProvinceDistrictSelector> createState() =>
      _ProvinceDistrictSelectorState();
}

class _ProvinceDistrictSelectorState extends State<ProvinceDistrictSelector> {
  String? _selectedProvince;
  String? _selectedDistrict;
  bool _isProvinceFocused = false;
  bool _isDistrictFocused = false;

  List<ProvinceDto> _provinces = [];
  List<DistrictDto> _districts = [];
  bool _isLoadingProvinces = false;
  bool _isLoadingDistricts = false;

  final LocationRepository _locationRepository = getIt<LocationRepository>();

  @override
  void initState() {
    super.initState();
    _selectedProvince = widget.initialProvince;
    _selectedDistrict = widget.initialDistrict;
    _loadProvinces();
  }

  Future<void> _loadProvinces() async {
    setState(() => _isLoadingProvinces = true);
    try {
      final response = await _locationRepository.getProvinces();

      if (response.data != null) {
        setState(() {
          _provinces = response.data!.provinces;
          _isLoadingProvinces = false;
        });
      }
    } catch (e, stackTrace) {
      setState(() => _isLoadingProvinces = false);
    }
  }

  Future<void> _loadDistricts(String provinceCode) async {
    setState(() => _isLoadingDistricts = true);
    try {
      final response = await _locationRepository.getDistricts(provinceCode);
      if (response.data != null) {
        setState(() {
          _districts = response.data!;
          _isLoadingDistricts = false;
        });
      }
    } catch (e) {
      setState(() => _isLoadingDistricts = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProvinceDropdown(),
        const SizedBox(height: 20),
        _buildDistrictDropdown(),
      ],
    );
  }

  Widget _buildProvinceDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Province', style: AppTextStyles.label),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: (focus) => setState(() => _isProvinceFocused = focus),
          child: GestureDetector(
            onTap: () => setState(() => _isProvinceFocused = true),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: _isProvinceFocused
                      ? AppColors.primary
                      : AppColors.textTertiary.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 62,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _isLoadingProvinces
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    )
                  : DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedProvince,
                        hint: Text(
                          'Select your province',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: _provinces.map((province) {
                          return DropdownMenuItem(
                            value: province.code,
                            child: Text(
                              province.name,
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedProvince = value;
                              _selectedDistrict = null;
                              _districts = [];
                            });
                            widget.onProvinceChanged?.call(value);
                            _loadDistricts(value);
                          }
                        },
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDistrictDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('District', style: AppTextStyles.label),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: (focus) => setState(() => _isDistrictFocused = focus),
          child: GestureDetector(
            onTap: () => setState(() => _isDistrictFocused = true),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: _isDistrictFocused
                      ? AppColors.primary
                      : AppColors.textTertiary.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 62,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _isLoadingDistricts
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    )
                  : DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedDistrict,
                        hint: Text(
                          'Select your district',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: _districts.map((district) {
                          return DropdownMenuItem(
                            value: district.code,
                            child: Text(
                              district.name,
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => _selectedDistrict = value);
                          widget.onDistrictChanged?.call(value!);
                        },
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
