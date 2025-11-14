import 'package:find_job_mobile/modules/community/models/candidate_data.dart';
import 'package:find_job_mobile/modules/community/models/employer_data.dart';

final List<CandidateData> sampleCandidates = [
  const CandidateData(
    name: 'Sarah Johnson',
    education: 'Bachelor of Computer Science',
    gender: 'Female',
    location: 'Hanoi, Vietnam',
  ),
  const CandidateData(
    name: 'Michael Chen',
    education: 'Master of Software Engineering',
    gender: 'Male',
    location: 'Ho Chi Minh, Vietnam',
  ),
  const CandidateData(
    name: 'Emma Davis',
    education: 'Bachelor of Design',
    gender: 'Female',
    location: 'Da Nang, Vietnam',
  ),
  const CandidateData(
    name: 'James Wilson',
    education: 'Master of Information Technology',
    gender: 'Male',
    location: 'Remote',
  ),
];

final List<EmployerData> sampleEmployers = [
  const EmployerData(
    name: 'TechViet Solutions',
    location: 'Hanoi, Vietnam',
    jobsAvailable: 12,
  ),
  const EmployerData(
    name: 'Innovation Labs',
    location: 'Ho Chi Minh, Vietnam',
    jobsAvailable: 8,
  ),
  const EmployerData(
    name: 'Finance Plus',
    location: 'Hanoi, Vietnam',
    jobsAvailable: 5,
  ),
  const EmployerData(
    name: 'HealthCare Pro',
    location: 'Da Nang, Vietnam',
    jobsAvailable: 7,
  ),
];
