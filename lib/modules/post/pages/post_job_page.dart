import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/dto/create_job_request.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/job_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/shared/utils/message_helper.dart';
import 'package:intl/intl.dart';

class PostJobPage extends StatefulWidget {
  const PostJobPage({super.key});

  @override
  State<PostJobPage> createState() => _PostJobPageState();
}

class _PostJobPageState extends State<PostJobPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _responsibilityController = TextEditingController();
  final _minSalaryController = TextEditingController();
  final _maxSalaryController = TextEditingController();

  JobType? _selectedJobType;
  Education? _selectedEducation;
  SalaryType _selectedSalaryType = SalaryType.monthly;
  Currency _selectedCurrency = Currency.vnd;
  DateTime? _expiredDate;
  bool _isLoading = false;

  final JobRepository _jobRepository = getIt<JobRepository>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _responsibilityController.dispose();
    _minSalaryController.dispose();
    _maxSalaryController.dispose();
    super.dispose();
  }

  Future<void> _selectExpiredDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _expiredDate) {
      setState(() {
        _expiredDate = picked;
      });
    }
  }

  Future<void> _handlePostJob() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final request = CreateJobRequest(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        responsibility: _responsibilityController.text.trim().isEmpty
            ? null
            : _responsibilityController.text.trim(),
        education: _selectedEducation,
        jobType: _selectedJobType,
        minSalary: _minSalaryController.text.isEmpty
            ? null
            : double.tryParse(_minSalaryController.text),
        maxSalary: _maxSalaryController.text.isEmpty
            ? null
            : double.tryParse(_maxSalaryController.text),
        salaryType: _selectedSalaryType,
        currency: _selectedCurrency,
        expiredAt: _expiredDate?.toIso8601String(),
      );

      final response = await _jobRepository.createJob(request);

      if (mounted) {
        MessageHelper.showSuccess(context, response.message);
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        MessageHelper.showError(
          context,
          e,
          fallbackMessage: 'Failed to post job',
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Post a Job',
          style: AppTextStyles.heading3.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Job Title
            _buildSectionTitle('Job Information'),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Job Title *',
              controller: _titleController,
              hint: 'e.g. Senior Flutter Developer',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter job title';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Job Type
            _buildDropdown<JobType>(
              label: 'Job Type',
              value: _selectedJobType,
              items: JobType.values,
              itemBuilder: (jobType) => _getJobTypeLabel(jobType),
              onChanged: (value) => setState(() => _selectedJobType = value),
            ),
            const SizedBox(height: 16),

            // Description
            _buildTextField(
              label: 'Description',
              controller: _descriptionController,
              hint: 'Describe the job position...',
              maxLines: 5,
            ),
            const SizedBox(height: 16),

            // Responsibility
            _buildTextField(
              label: 'Responsibilities',
              controller: _responsibilityController,
              hint: 'What will the employee do?',
              maxLines: 5,
            ),
            const SizedBox(height: 16),

            // Education
            _buildDropdown<Education>(
              label: 'Education Requirements',
              value: _selectedEducation,
              items: Education.values,
              itemBuilder: (education) => _getEducationLabel(education),
              onChanged: (value) => setState(() => _selectedEducation = value),
            ),
            const SizedBox(height: 24),

            // Salary Section
            _buildSectionTitle('Salary Information'),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Min Salary',
                    controller: _minSalaryController,
                    hint: '0',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    label: 'Max Salary',
                    controller: _maxSalaryController,
                    hint: '0',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _buildDropdown<Currency>(
                    label: 'Currency',
                    value: _selectedCurrency,
                    items: Currency.values,
                    itemBuilder: (currency) => _getCurrencyLabel(currency),
                    onChanged: (value) =>
                        setState(() => _selectedCurrency = value!),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDropdown<SalaryType>(
                    label: 'Salary Type',
                    value: _selectedSalaryType,
                    items: SalaryType.values,
                    itemBuilder: (type) => _getSalaryTypeLabel(type),
                    onChanged: (value) =>
                        setState(() => _selectedSalaryType = value!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Expired Date
            _buildSectionTitle('Expiry Date'),
            const SizedBox(height: 16),
            _buildDatePicker(),
            const SizedBox(height: 32),

            // Submit Button
            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handlePostJob,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor:
                      AppColors.primary.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        'Post Job',
                        style: AppTextStyles.button.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.heading2.copyWith(
        color: AppColors.textPrimary,
        fontSize: 18,
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.label.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: AppTextStyles.body.copyWith(
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.body.copyWith(
              fontSize: 14,
              color: AppColors.textTertiary,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.textTertiary.withOpacity(0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.textTertiary.withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.error,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required String Function(T) itemBuilder,
    required void Function(T?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.label.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.textTertiary.withOpacity(0.2),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isExpanded: true,
              hint: Text(
                'Select $label',
                style: AppTextStyles.body.copyWith(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: AppColors.textSecondary,
              ),
              style: AppTextStyles.body.copyWith(
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
              items: items
                  .map((item) => DropdownMenuItem<T>(
                        value: item,
                        child: Text(itemBuilder(item)),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job Expires On',
          style: AppTextStyles.label.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _selectExpiredDate,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.textTertiary.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _expiredDate == null
                        ? 'Select expiry date'
                        : DateFormat('dd MMM yyyy').format(_expiredDate!),
                    style: AppTextStyles.body.copyWith(
                      fontSize: 14,
                      color: _expiredDate == null
                          ? AppColors.textTertiary
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textTertiary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getJobTypeLabel(JobType type) {
    switch (type) {
      case JobType.softwareEngineer:
        return 'Software Engineer';
      case JobType.frontendDeveloper:
        return 'Frontend Developer';
      case JobType.backendDeveloper:
        return 'Backend Developer';
      case JobType.fullstackDeveloper:
        return 'Fullstack Developer';
      case JobType.mobileDeveloper:
        return 'Mobile Developer';
      case JobType.dataScientist:
        return 'Data Scientist';
      case JobType.machineLearningEngineer:
        return 'Machine Learning Engineer';
      case JobType.devopsEngineer:
        return 'DevOps Engineer';
      case JobType.qaTester:
        return 'QA Tester';
      case JobType.uiUxDesigner:
        return 'UI/UX Designer';
      case JobType.itSupport:
        return 'IT Support';
      case JobType.networkEngineer:
        return 'Network Engineer';
      case JobType.cyberSecuritySpecialist:
        return 'Cyber Security Specialist';
    }
  }

  String _getSalaryTypeLabel(SalaryType type) {
    switch (type) {
      case SalaryType.hourly:
        return 'Hourly';
      case SalaryType.daily:
        return 'Daily';
      case SalaryType.weekly:
        return 'Weekly';
      case SalaryType.monthly:
        return 'Monthly';
      case SalaryType.annual:
        return 'Annual';
      case SalaryType.commission:
        return 'Commission';
      case SalaryType.pieceRate:
        return 'Piece Rate';
      case SalaryType.bonus:
        return 'Bonus';
      case SalaryType.contract:
        return 'Contract';
      case SalaryType.profitSharing:
        return 'Profit Sharing';
    }
  }

  String _getCurrencyLabel(Currency currency) {
    switch (currency) {
      case Currency.usd:
        return 'USD (\$)';
      case Currency.eur:
        return 'EUR (€)';
      case Currency.jpy:
        return 'JPY (¥)';
      case Currency.gbp:
        return 'GBP (£)';
      case Currency.aud:
        return 'AUD (A\$)';
      case Currency.cad:
        return 'CAD (C\$)';
      case Currency.chf:
        return 'CHF';
      case Currency.cny:
        return 'CNY (¥)';
      case Currency.hkd:
        return 'HKD (HK\$)';
      case Currency.sgd:
        return 'SGD (S\$)';
      case Currency.krw:
        return 'KRW (₩)';
      case Currency.inr:
        return 'INR (₹)';
      case Currency.vnd:
        return 'VND (₫)';
    }
  }

  String _getEducationLabel(Education education) {
    switch (education) {
      case Education.highSchool:
        return 'High School';
      case Education.intermediate:
        return 'Intermediate';
      case Education.graduation:
        return 'Graduation';
      case Education.bachelorDegree:
        return 'Bachelor Degree';
      case Education.masterDegree:
        return 'Master Degree';
    }
  }
}
