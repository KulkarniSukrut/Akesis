/// Domain Models - Core Entities
/// 
/// Using freezed for immutable data classes with JSON serialization.
/// These models mirror the Supabase schema exactly.

library domain.models;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

/// User Profile - extends auth.users
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    String? fullName,
    @Default('UTC') String timezone,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}

/// Goal Status
enum GoalStatus {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('archived')
  archived,
}

/// Goal Category
enum GoalCategory {
  @JsonValue('fitness')
  fitness,
  @JsonValue('career')
  career,
  @JsonValue('study')
  study,
  @JsonValue('personal')
  personal,
  @JsonValue('health')
  health,
  @JsonValue('finance')
  finance,
  @JsonValue('other')
  other,
}

/// Goal
@freezed
abstract class Goal with _$Goal {
  const factory Goal({
    required String id,
    required String userId,
    required String title,
    String? description,
    @Default('general') String category,
    DateTime? targetDate,
    @Default(GoalStatus.inProgress) GoalStatus status,
    @Default(0) int progress,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default([]) List<Objective> objectives,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}

/// Objective (Milestone for Goal)
@freezed
abstract class Objective with _$Objective {
  const factory Objective({
    required String id,
    required String goalId,
    required String userId,
    required String title,
    @Default(false) bool isCompleted,
    DateTime? completedAt,
    required DateTime createdAt,
  }) = _Objective;

  factory Objective.fromJson(Map<String, dynamic> json) => _$ObjectiveFromJson(json);
}

/// Habit Frequency
enum HabitFrequency {
  @JsonValue('daily')
  daily,
  @JsonValue('weekly')
  weekly,
  @JsonValue('custom')
  custom,
}

/// Habit
@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String userId,
    required String title,
    String? description,
    @Default('general') String category,
    @Default(HabitFrequency.daily) HabitFrequency frequency,
    @Default(7) int targetDaysPerWeek,
    @Default([1, 2, 3, 4, 5, 6, 7]) List<int> customDays,
    @Default(false) bool isArchived,
    required DateTime createdAt,
    required DateTime updatedAt,
    // Computed / view state
    @Default(false) bool completedToday,
    @Default(0) int currentStreak,
  }) = _Habit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}

/// Habit Log
@freezed
abstract class HabitLog with _$HabitLog {
  const factory HabitLog({
    required String id,
    required String habitId,
    required String userId,
    required DateTime logDate,
    @Default(true) bool completed,
    String? notes,
    required DateTime createdAt,
  }) = _HabitLog;

  factory HabitLog.fromJson(Map<String, dynamic> json) => _$HabitLogFromJson(json);
}

/// Task Priority
enum TaskPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('urgent')
  urgent,
}

/// Task
@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    required String userId,
    String? goalId,
    required String title,
    String? description,
    @Default(TaskPriority.medium) TaskPriority priority,
    DateTime? dueDate,
    @Default(false) bool isCompleted,
    DateTime? completedAt,
    @Default('general') String category,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

/// Metric Type
enum MetricType {
  @JsonValue('boolean')
  boolean,
  @JsonValue('quantity')
  quantity,
  @JsonValue('duration')
  duration,
  @JsonValue('scale')
  scale,
  @JsonValue('count')
  count,
}

/// Metric Definition
@freezed
abstract class Metric with _$Metric {
  const factory Metric({
    required String id,
    required String userId,
    required String name,
    @Default('general') String category,
    required MetricType type,
    String? unit,
    double? minVal,
    double? maxVal,
    @Default(1) double step,
    @Default(false) bool isArchived,
    required DateTime createdAt,
    // Today's value if logged
    dynamic currentValue,
  }) = _Metric;

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);
}

/// Metric Log
@freezed
abstract class MetricLog with _$MetricLog {
  const factory MetricLog({
    required String id,
    required String metricId,
    required String userId,
    required DateTime logDate,
    required DateTime logTime,
    double? valNum,
    bool? valBool,
    String? valText,
    required DateTime createdAt,
  }) = _MetricLog;

  factory MetricLog.fromJson(Map<String, dynamic> json) => _$MetricLogFromJson(json);
}

/// Daily Check-In
@freezed
abstract class DailyCheckIn with _$DailyCheckIn {
  const factory DailyCheckIn({
    required String id,
    required String userId,
    required DateTime checkInDate,
    @Default(5) int mood,       // 1-10
    @Default(5) int energy,     // 1-10
    @Default(5) int stress,     // 1-10
    @Default(5) int productivity, // 1-10
    @Default(0.0) double sleepHours,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DailyCheckIn;

  factory DailyCheckIn.fromJson(Map<String, dynamic> json) => _$DailyCheckInFromJson(json);
}

/// Journal Entry
@freezed
abstract class JournalEntry with _$JournalEntry {
  const factory JournalEntry({
    required String id,
    required String userId,
    required DateTime entryDate,
    String? title,
    required String content,
    @Default([]) List<String> tags,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _JournalEntry;

  factory JournalEntry.fromJson(Map<String, dynamic> json) => _$JournalEntryFromJson(json);
}

/// Activity Event (Polymorphic Unified Event Stream)
@freezed
abstract class ActivityEvent with _$ActivityEvent {
  const factory ActivityEvent({
    required String id,
    required String userId,
    required DateTime eventTime,
    required DateTime eventDate,
    required String type,
    @Default('general') String category,
    double? value,
    String? unit,
    @Default({}) Map<String, dynamic> metadata,
    required DateTime createdAt,
  }) = _ActivityEvent;

  factory ActivityEvent.fromJson(Map<String, dynamic> json) => _$ActivityEventFromJson(json);
}