import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../../../shared/data/models/saved_candidate_dto.dart';
import '../../../shared/data/repositories/employer_follower_repository.dart';

class SavedCandidatesPage extends StatefulWidget {
  const SavedCandidatesPage({super.key});

  @override
  State<SavedCandidatesPage> createState() => _SavedCandidatesPageState();
}

class _SavedCandidatesPageState extends State<SavedCandidatesPage> {
  final _employerFollowerRepository = getIt<EmployerFollowerRepository>();
  
  List<SavedCandidateDto> _candidates = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 0;
  final int _pageSize = 10;
  String? _error;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadCandidates();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
      if (!_isLoading && _hasMore) {
        _loadMore();
      }
    }
  }

  Future<void> _loadCandidates() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _currentPage = 0;
      _candidates = [];
      _hasMore = true;
    });

    try {
      final response = await _employerFollowerRepository.getFollowedCandidates(
        page: _currentPage,
        size: _pageSize,
      );

      if (mounted) {
        if (response.success || response.data != null) {
          setState(() {
            _candidates = response.data?.content ?? [];
            _hasMore = !(response.data?.last ?? true);
            _isLoading = false;
          });
        } else {
          setState(() {
            _error = response.message;
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _employerFollowerRepository.getFollowedCandidates(
        page: _currentPage + 1,
        size: _pageSize,
      );

      if (mounted) {
        if (response.success || response.data != null) {
          setState(() {
            _currentPage++;
            _candidates.addAll(response.data?.content ?? []);
            _hasMore = !(response.data?.last ?? true);
            _isLoading = false;
          });
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load more: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _unfollowCandidate(SavedCandidateDto candidate) async {
    try {
      await _employerFollowerRepository.unfollowCandidate(candidate.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unfollowed ${candidate.firstName} ${candidate.lastName}')),
        );
        _loadCandidates();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to unfollow: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: AppColors.textTertiary.withValues(alpha: 0.08),
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Saved Candidates',
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_error != null && _candidates.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text('Error: $_error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadCandidates,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_isLoading && _candidates.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_candidates.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bookmark_border, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No saved candidates yet',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Start following candidates to see them here',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadCandidates,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: _candidates.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _candidates.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }

          final candidate = _candidates[index];
          return _buildCandidateCard(candidate);
        },
      ),
    );
  }

  Widget _buildCandidateCard(SavedCandidateDto candidate) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: candidate.avatarUrl != null && candidate.avatarUrl!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        candidate.avatarUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 30,
                            color: AppColors.primary,
                          );
                        },
                      ),
                    )
                  : const Icon(
                      Icons.person,
                      size: 30,
                      color: AppColors.primary,
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${candidate.firstName} ${candidate.lastName}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          candidate.location,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _unfollowCandidate(candidate),
              icon: const Icon(Icons.bookmark),
              color: AppColors.primary,
              tooltip: 'Unfollow',
            ),
          ],
        ),
      ),
    );
  }
}
