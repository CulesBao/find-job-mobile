import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';

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

  final List<String> _provinces = [
    'Hà Nội',
    'Hồ Chí Minh',
    'Đà Nẵng',
    'Cần Thơ',
    'Huế',
  ];

  final Map<String, List<String>> _districts = {
    'Hà Nội': ['Ba Đình', 'Hoàn Kiếm', 'Đống Đa', 'Cầu Giấy'],
    'Hồ Chí Minh': ['Quận 1', 'Quận 3', 'Bình Thạnh', 'Thủ Đức'],
    'Đà Nẵng': ['Hải Châu', 'Thanh Khê', 'Sơn Trà', 'Ngũ Hành Sơn'],
    'Cần Thơ': ['Ninh Kiều', 'Bình Thủy', 'Cái Răng'],
    'Huế': ['Hương Trà', 'Hương Thủy', 'Phú Vang'],
  };

  @override
  void initState() {
    super.initState();
    _selectedProvince = widget.initialProvince;
    _selectedDistrict = widget.initialDistrict;
  }

  @override
  Widget build(BuildContext context) {
    final availableDistricts = _districts[_selectedProvince] ?? <String>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDropdownSection(
          label: 'Province',
          hint: 'Select your province',
          value: _selectedProvince,
          isFocused: _isProvinceFocused,
          items: _provinces,
          onFocusChanged: (focus) => setState(() => _isProvinceFocused = focus),
          onChanged: (value) {
            setState(() {
              _selectedProvince = value;
              _selectedDistrict = null;
            });
            widget.onProvinceChanged?.call(value);
          },
        ),
        const SizedBox(height: 20),
        _buildDropdownSection(
          label: 'District',
          hint: 'Select your district',
          value: _selectedDistrict,
          isFocused: _isDistrictFocused,
          items: availableDistricts,
          onFocusChanged: (focus) => setState(() => _isDistrictFocused = focus),
          onChanged: (value) {
            setState(() => _selectedDistrict = value);
            widget.onDistrictChanged?.call(value);
          },
        ),
      ],
    );
  }

  Widget _buildDropdownSection({
    required String label,
    required String hint,
    required List<String> items,
    required String? value,
    required bool isFocused,
    required Function(bool) onFocusChanged,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: onFocusChanged,
          child: GestureDetector(
            onTap: () => onFocusChanged(true),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isFocused
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
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  hint: Text(
                    hint,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: items.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (v) {
                    onChanged(v!);
                    onFocusChanged(false); // bỏ focus khi chọn xong
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
