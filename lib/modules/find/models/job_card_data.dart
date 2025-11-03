class JobCardData {
  const JobCardData({
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.jobType,
    required this.tags,
  });

  final String title;
  final String company;
  final String location;
  final String salary;
  final String jobType;
  final List<String> tags;
}
