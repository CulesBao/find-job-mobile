import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/data/models/application_dto.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';

/// Utility class for handling application status display
class ApplicationStatusUtils {
  /// Get status text from JobProcess enum
  static String getStatusText(JobProcess? status) {
    if (status == null) return 'Submitted';
    
    switch (status) {
      case JobProcess.applicationSubmitted:
        return 'Submitted';
      case JobProcess.applicationReview:
        return 'Under Review';
      case JobProcess.screening:
        return 'Screening';
      case JobProcess.phoneInterview:
        return 'Phone Interview';
      case JobProcess.technicalTest:
        return 'Technical Test';
      case JobProcess.firstInterview:
        return 'First Interview';
      case JobProcess.secondInterview:
        return 'Second Interview';
      case JobProcess.finalInterview:
        return 'Final Interview';
      case JobProcess.offerNegotiation:
        return 'Offer Negotiation';
      case JobProcess.offerSent:
        return 'Offer Sent';
      case JobProcess.offerAccepted:
        return 'Offer Accepted';
      case JobProcess.hired:
        return 'Hired';
      case JobProcess.onboarding:
        return 'Onboarding';
      case JobProcess.rejected:
        return 'Rejected';
      case JobProcess.withdrawn:
        return 'Withdrawn';
    }
  }

  /// Get status text from String (for backward compatibility)
  static String getStatusTextFromString(String? status) {
    if (status == null) return 'Submitted';
    
    switch (status.toUpperCase()) {
      case 'APPLICATION_SUBMITTED':
        return 'Submitted';
      case 'APPLICATION_REVIEW':
        return 'Under Review';
      case 'SCREENING':
        return 'Screening';
      case 'PHONE_INTERVIEW':
        return 'Phone Interview';
      case 'TECHNICAL_TEST':
        return 'Technical Test';
      case 'FIRST_INTERVIEW':
        return 'First Interview';
      case 'SECOND_INTERVIEW':
        return 'Second Interview';
      case 'FINAL_INTERVIEW':
        return 'Final Interview';
      case 'OFFER_NEGOTIATION':
        return 'Offer Negotiation';
      case 'OFFER_SENT':
        return 'Offer Sent';
      case 'OFFER_ACCEPTED':
        return 'Offer Accepted';
      case 'HIRED':
        return 'Hired';
      case 'ONBOARDING':
        return 'Onboarding';
      case 'REJECTED':
        return 'Rejected';
      case 'WITHDRAWN':
        return 'Withdrawn';
      default:
        return 'Submitted';
    }
  }

  /// Get status color from JobProcess enum
  static Color getStatusColor(JobProcess? status) {
    if (status == null) return AppColors.accent;
    
    switch (status) {
      case JobProcess.applicationSubmitted:
      case JobProcess.applicationReview:
      case JobProcess.screening:
        return AppColors.accent; // Orange for initial stages
      case JobProcess.phoneInterview:
      case JobProcess.technicalTest:
      case JobProcess.firstInterview:
      case JobProcess.secondInterview:
      case JobProcess.finalInterview:
        return AppColors.primary; // Purple for interview stages
      case JobProcess.offerNegotiation:
      case JobProcess.offerSent:
      case JobProcess.offerAccepted:
        return const Color(0xFF1890FF); // Blue for offer stages
      case JobProcess.hired:
      case JobProcess.onboarding:
        return AppColors.success; // Green for success
      case JobProcess.rejected:
      case JobProcess.withdrawn:
        return AppColors.error; // Red for rejected/withdrawn
    }
  }

  /// Get status color from String (for backward compatibility)
  static Color getStatusColorFromString(String? status) {
    if (status == null) return AppColors.accent;
    
    switch (status.toUpperCase()) {
      case 'APPLICATION_SUBMITTED':
      case 'APPLICATION_REVIEW':
      case 'SCREENING':
        return AppColors.accent;
      case 'PHONE_INTERVIEW':
      case 'TECHNICAL_TEST':
      case 'FIRST_INTERVIEW':
      case 'SECOND_INTERVIEW':
      case 'FINAL_INTERVIEW':
        return AppColors.primary;
      case 'OFFER_NEGOTIATION':
      case 'OFFER_SENT':
      case 'OFFER_ACCEPTED':
        return const Color(0xFF1890FF);
      case 'HIRED':
      case 'ONBOARDING':
        return AppColors.success;
      case 'REJECTED':
      case 'WITHDRAWN':
        return AppColors.error;
      default:
        return AppColors.accent;
    }
  }

  /// Get status icon from JobProcess enum
  static IconData getStatusIcon(JobProcess? status) {
    if (status == null) return Icons.send;
    
    switch (status) {
      case JobProcess.applicationSubmitted:
        return Icons.send;
      case JobProcess.applicationReview:
      case JobProcess.screening:
        return Icons.search;
      case JobProcess.phoneInterview:
        return Icons.phone;
      case JobProcess.technicalTest:
        return Icons.code;
      case JobProcess.firstInterview:
      case JobProcess.secondInterview:
      case JobProcess.finalInterview:
        return Icons.people;
      case JobProcess.offerNegotiation:
        return Icons.handshake;
      case JobProcess.offerSent:
        return Icons.mail;
      case JobProcess.offerAccepted:
        return Icons.done_all;
      case JobProcess.hired:
        return Icons.work;
      case JobProcess.onboarding:
        return Icons.school;
      case JobProcess.rejected:
        return Icons.cancel;
      case JobProcess.withdrawn:
        return Icons.block;
    }
  }

  /// Convert JobProcess enum to API string
  static String getJobProcessString(JobProcess status) {
    switch (status) {
      case JobProcess.applicationSubmitted:
        return 'APPLICATION_SUBMITTED';
      case JobProcess.applicationReview:
        return 'APPLICATION_REVIEW';
      case JobProcess.screening:
        return 'SCREENING';
      case JobProcess.phoneInterview:
        return 'PHONE_INTERVIEW';
      case JobProcess.technicalTest:
        return 'TECHNICAL_TEST';
      case JobProcess.firstInterview:
        return 'FIRST_INTERVIEW';
      case JobProcess.secondInterview:
        return 'SECOND_INTERVIEW';
      case JobProcess.finalInterview:
        return 'FINAL_INTERVIEW';
      case JobProcess.offerNegotiation:
        return 'OFFER_NEGOTIATION';
      case JobProcess.offerSent:
        return 'OFFER_SENT';
      case JobProcess.offerAccepted:
        return 'OFFER_ACCEPTED';
      case JobProcess.hired:
        return 'HIRED';
      case JobProcess.onboarding:
        return 'ONBOARDING';
      case JobProcess.rejected:
        return 'REJECTED';
      case JobProcess.withdrawn:
        return 'WITHDRAWN';
    }
  }
}
