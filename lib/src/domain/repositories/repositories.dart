/// Repository Interfaces - Abstract contracts for data access
/// 
/// These define the contract. Implementations live in the data layer.

library domain.repositories;

import 'dart:async';

import '../models/models.dart';

/// Base repository with common operations
abstract class BaseRepository<T> {
  Future<T?> getById(String id);
  Future<List<T>> getAll();
  Future<T> create(T item);
  Future<T> update(T item);
  Future<void> delete(String id);
  Stream<List<T>> watchAll();
}

/// User Profile Repository
abstract class UserProfileRepository extends BaseRepository<UserProfile> {
  Future<UserProfile?> getCurrentUser();
  Future<UserProfile> upsert(UserProfile profile);
}

/// Goal Repository
abstract class GoalRepository extends BaseRepository<Goal> {
  Future<List<Goal>> getByUserId(String userId);
  Future<List<Goal>> getActiveGoals(String userId);
  Future<Goal> updateProgress(String goalId, int progress);
  Stream<List<Goal>> watchUserGoals(String userId);
}

/// Objective Repository
abstract class ObjectiveRepository extends BaseRepository<Objective> {
  Future<List<Objective>> getByGoalId(String goalId);
  Future<Objective> markCompleted(String objectiveId);
  Stream<List<Objective>> watchGoalObjectives(String goalId);
}

/// Habit Repository
abstract class HabitRepository extends BaseRepository<Habit> {
  Future<List<Habit>> getByUserId(String userId);
  Future<List<Habit>> getActiveHabits(String userId);
  Future<List<Habit>> getHabitsForDate(String userId, DateTime date);
  Future<Habit> toggleHabit(String habitId, DateTime date, bool completed);
  Future<int> getStreak(String habitId);
  Stream<List<Habit>> watchUserHabits(String userId);
}

/// Habit Log Repository
abstract class HabitLogRepository {
  Future<List<HabitLog>> getByHabitId(String habitId);
  Future<List<HabitLog>> getByUserAndDateRange(String userId, DateTime start, DateTime end);
  Future<HabitLog?> getByHabitAndDate(String habitId, DateTime date);
  Future<HabitLog> upsert(HabitLog log);
  Stream<List<HabitLog>> watchHabitLogs(String habitId);
}

/// Task Repository
abstract class TaskRepository extends BaseRepository<Task> {
  Future<List<Task>> getByUserId(String userId);
  Future<List<Task>> getPendingTasks(String userId);
  Future<List<Task>> getTasksForDate(String userId, DateTime date);
  Future<List<Task>> getByGoalId(String goalId);
  Future<Task> toggleTask(String taskId, bool completed);
  Future<List<Task>> getOverdueTasks(String userId);
  Stream<List<Task>> watchUserTasks(String userId);
}

/// Metric Repository
abstract class MetricRepository extends BaseRepository<Metric> {
  Future<List<Metric>> getByUserId(String userId);
  Future<List<Metric>> getActiveMetrics(String userId);
  Future<Metric> updateCurrentValue(String metricId, dynamic value);
  Stream<List<Metric>> watchUserMetrics(String userId);
}

/// Metric Log Repository
abstract class MetricLogRepository {
  Future<List<MetricLog>> getByMetricId(String metricId);
  Future<List<MetricLog>> getByUserAndDateRange(String userId, DateTime start, DateTime end);
  Future<MetricLog> create(MetricLog log);
  Stream<List<MetricLog>> watchMetricLogs(String metricId);
}

/// Daily Check-In Repository
abstract class DailyCheckInRepository extends BaseRepository<DailyCheckIn> {
  Future<DailyCheckIn?> getByUserAndDate(String userId, DateTime date);
  Future<DailyCheckIn> upsert(DailyCheckIn checkIn);
  Future<List<DailyCheckIn>> getByUserAndDateRange(String userId, DateTime start, DateTime end);
  Stream<DailyCheckIn?> watchUserCheckIn(String userId, DateTime date);
}

/// Journal Repository
abstract class JournalRepository extends BaseRepository<JournalEntry> {
  Future<List<JournalEntry>> getByUserId(String userId);
  Future<List<JournalEntry>> getByUserAndDateRange(String userId, DateTime start, DateTime end);
  Future<JournalEntry?> getByUserAndDate(String userId, DateTime date);
  Stream<List<JournalEntry>> watchUserJournals(String userId);
}

/// Activity Repository
abstract class ActivityRepository {
  Future<List<ActivityEvent>> getByUserId(String userId, {int limit = 50});
  Future<List<ActivityEvent>> getByUserAndDateRange(String userId, DateTime start, DateTime end);
  Future<List<ActivityEvent>> getByType(String userId, String type);
  Future<ActivityEvent> create(ActivityEvent event);
  Stream<List<ActivityEvent>> watchUserActivities(String userId, {int limit = 50});
}

/// Repository Provider - for dependency injection
abstract class RepositoryProvider {
  UserProfileRepository get userProfile;
  GoalRepository get goals;
  ObjectiveRepository get objectives;
  HabitRepository get habits;
  HabitLogRepository get habitLogs;
  TaskRepository get tasks;
  MetricRepository get metrics;
  MetricLogRepository get metricLogs;
  DailyCheckInRepository get dailyCheckIns;
  JournalRepository get journals;
  ActivityRepository get activities;
}