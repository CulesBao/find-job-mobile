import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/modules/community/widgets/advanced_filters_section.dart';
import 'package:find_job_mobile/modules/community/widgets/candidate_card.dart';
import 'package:find_job_mobile/modules/community/widgets/employer_card.dart';
import 'package:find_job_mobile/modules/community/widgets/find_header.dart';
import 'package:find_job_mobile/shared/data/dto/filter_candidate_profile_request.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_filter_dto.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/province_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_profile_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_profile_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/location_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class FindCommunityPage extends StatefulWidget {
  const FindCommunityPage({super.key});

  @override
  State<FindCommunityPage> createState() => _FindCommunityPageState();
}

class _FindCommunityPageState extends State<FindCommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  final _candidateRepository = getIt<CandidateProfileRepository>();
  final _employerRepository = getIt<EmployerProfileRepository>();
  final _locationRepository = getIt<LocationRepository>();
  
  bool _showCandidateFilters = false;
  bool _showEmployerFilters = false;
  
  // Filter states for candidates
  Education? _selectedEducation;
  bool? _selectedGender;
  ProvinceDto? _selectedProvince;
  
  // Filter states for employers
  ProvinceDto? _employerProvince;
  
  // Province list
  List<ProvinceDto> _provinces = [];
  
  // Data
  List<CandidateFilterDto> _candidates = [];
  List<EmployerProfileDto> _employers = [];
  
  // Loading states
  bool _isLoadingCandidates = false;
  bool _isLoadingEmployers = false;
  
  // Pagination
  int _candidatePage = 0;
  int _employerPage = 0;
  bool _hasMoreCandidates = true;
  bool _hasMoreEmployers = true;
  
  // Error states
  String? _candidateError;
  String? _employerError;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
    _loadProvinces();
    _loadInitialData();
  }

  Future<void> _loadProvinces() async {
    try {
      final response = await _locationRepository.getProvinces();
      if (mounted && response.data != null) {
        setState(() {
          _provinces = response.data!.provinces;
        });
      }
    } catch (e) {

    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    await Future.wait([
      _loadCandidates(refresh: true),
      _loadEmployers(refresh: true),
    ]);
  }

  Future<void> _loadCandidates({bool refresh = false}) async {
    if (_isLoadingCandidates || (!refresh && !_hasMoreCandidates)) return;

    setState(() {
      _isLoadingCandidates = true;
      _candidateError = null;
      if (refresh) {
        _candidatePage = 0;
        _candidates.clear();
        _hasMoreCandidates = true;
      }
    });

    try {
      final searchText = _searchController.text.trim();
      
      // Convert bool gender to GenderFilter enum
      GenderFilter? genderFilter;
      if (_selectedGender != null) {
        genderFilter = _selectedGender == false ? GenderFilter.male : GenderFilter.female;
      }
      
      final response = await _candidateRepository.filterCandidateProfiles(
        firstName: searchText.isNotEmpty ? searchText : null,
        education: _selectedEducation,
        gender: genderFilter,
        provinceCode: _selectedProvince?.code,
        page: _candidatePage,
        size: 10,
      );

      if (mounted) {
        if (response.data != null) {
          final newCandidates = response.data?.content ?? [];
          final isLast = response.data?.last ?? true;
          
          // Debug: Log first candidate details if available
          if (newCandidates.isNotEmpty) {
            final first = newCandidates[0];
          }

          setState(() {
            _candidates.addAll(newCandidates);
            _hasMoreCandidates = !isLast;
            if (newCandidates.isNotEmpty) {
              _candidatePage++;
            }
            _isLoadingCandidates = false;
          });
        } else {
          setState(() {
            _candidateError = 'Failed to load candidates';
            _isLoadingCandidates = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _candidateError = 'Error loading candidates: ${e.toString()}';
          _isLoadingCandidates = false;
        });
      }
    }
  }

  Future<void> _loadEmployers({bool refresh = false}) async {
    if (_isLoadingEmployers || (!refresh && !_hasMoreEmployers)) return;

    setState(() {
      _isLoadingEmployers = true;
      _employerError = null;
      if (refresh) {
        _employerPage = 0;
        _employers.clear();
        _hasMoreEmployers = true;
      }
    });

    try {
      final searchText = _searchController.text.trim();
      
      final response = await _employerRepository.filterEmployerProfiles(
        name: searchText.isNotEmpty ? searchText : null,
        provinceCode: _employerProvince?.code,
        page: _employerPage,
        size: 10,
      );

      if (mounted) {
        if (response.data != null) {
          final newEmployers = response.data?.content ?? [];
          final isLast = response.data?.last ?? true;

          setState(() {
            _employers.addAll(newEmployers);
            _hasMoreEmployers = !isLast;
            if (newEmployers.isNotEmpty) {
              _employerPage++;
            }
            _isLoadingEmployers = false;
          });
        } else {
          setState(() {
            _employerError = 'Failed to load employers';
            _isLoadingEmployers = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _employerError = 'Error loading employers: ${e.toString()}';
          _isLoadingEmployers = false;
        });
      }
    }
  }

  Future<void> _onRefresh() async {
    if (_tabController.index == 0) {
      await _loadCandidates(refresh: true);
    } else {
      await _loadEmployers(refresh: true);
    }
  }

  void _onSearch() {
    _loadCandidates(refresh: true);
    _loadEmployers(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header with gradient background
            SliverToBoxAdapter(
              child: FindHeader(
                searchController: _searchController,
                onSearchSubmit: _onSearch,
                onFindTap: _onSearch,
                onFilterTap: () {
                  setState(() {
                    if (_tabController.index == 0) {
                      _showCandidateFilters = !_showCandidateFilters;
                    } else {
                      _showEmployerFilters = !_showEmployerFilters;
                    }
                  });
                },
              ),
            ),
            // Tab bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.textSecondary,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 3,
                  labelStyle: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  tabs: const [
                    Tab(text: 'Candidates'),
                    Tab(text: 'Employers'),
                  ],
                ),
              ),
            ),
            // Content
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: [_buildCandidatesTab(), _buildEmployersTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCandidatesTab() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CustomScrollView(
        slivers: [
          if (_showCandidateFilters)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              sliver: SliverToBoxAdapter(
                child: CandidateAdvancedFilters(
                  selectedEducation: _selectedEducation,
                  selectedGender: _selectedGender,
                  selectedProvince: _selectedProvince,
                  provinces: _provinces,
                  onEducationChanged: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() => _selectedEducation = value);
                      }
                    });
                  },
                  onGenderChanged: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() => _selectedGender = value);
                      }
                    });
                  },
                  onProvinceChanged: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() => _selectedProvince = value);
                      }
                    });
                  },
                  onClearFilters: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() {
                          _selectedEducation = null;
                          _selectedGender = null;
                          _selectedProvince = null;
                        });
                      }
                    });
                  },
                ),
              ),
            ),
          
          if (_isLoadingCandidates && _candidates.isEmpty)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_candidateError != null && _candidates.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: AppColors.error),
                    const SizedBox(height: 16),
                    Text(
                      _candidateError!,
                      style: AppTextStyles.body.copyWith(color: AppColors.error),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => _loadCandidates(refresh: true),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else if (_candidates.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people_outline, size: 48, color: AppColors.textSecondary),
                    const SizedBox(height: 16),
                    Text(
                      'No candidates found',
                      style: AppTextStyles.heading3.copyWith(color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Try adjusting your filters',
                      style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList.separated(
                itemCount: _candidates.length + (_hasMoreCandidates ? 1 : 0),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  if (index == _candidates.length) {
                    // Load more indicator
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted && !_isLoadingCandidates) {
                        _loadCandidates();
                      }
                    });
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return CandidateCard(candidate: _candidates[index]);
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmployersTab() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CustomScrollView(
        slivers: [
          if (_showEmployerFilters)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              sliver: SliverToBoxAdapter(
                child: EmployerAdvancedFilters(
                  selectedProvince: _employerProvince,
                  provinces: _provinces,
                  onProvinceChanged: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() => _employerProvince = value);
                      }
                    });
                  },
                  onClearFilters: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() {
                          _employerProvince = null;
                        });
                      }
                    });
                  },
                ),
              ),
            ),
          
          if (_isLoadingEmployers && _employers.isEmpty)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_employerError != null && _employers.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: AppColors.error),
                    const SizedBox(height: 16),
                    Text(
                      _employerError!,
                      style: AppTextStyles.body.copyWith(color: AppColors.error),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => _loadEmployers(refresh: true),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else if (_employers.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.business_outlined, size: 48, color: AppColors.textSecondary),
                    const SizedBox(height: 16),
                    Text(
                      'No employers found',
                      style: AppTextStyles.heading3.copyWith(color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Try adjusting your filters',
                      style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList.separated(
                itemCount: _employers.length + (_hasMoreEmployers ? 1 : 0),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  if (index == _employers.length) {
                    // Load more indicator
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted && !_isLoadingEmployers) {
                        _loadEmployers();
                      }
                    });
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return EmployerCard(employer: _employers[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}

// Sliver tab bar delegate
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _SliverTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: AppColors.background, child: tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}
