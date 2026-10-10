/// Repository Providers - Riverpod providers for dependency injection

library data.providers;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repositories/repositories.dart';
import '../supabase/supabase.dart';
import '../repositories/supabase_repositories.dart';

/// Repository Provider Implementation
class SupabaseRepositoryProvider implements RepositoryProvider {
  final Ref ref;

  SupabaseRepositoryProvider(this.ref);

  @override
  UserProfileRepository get userProfile =>
      SupabaseUserProfileRepository(ref.watch(supabaseClientProvider));

  @override
  GoalRepository get goals =>
      SupabaseGoalRepository(ref.watch(supabaseClientProvider));

  @override
  ObjectiveRepository get objectives =>
      SupabaseObjectiveRepository(ref.watch(supabaseClientProvider));

  @override
  HabitRepository get habits =>
      SupabaseHabitRepository(ref.watch(supabaseClientProvider));

  @override
  HabitLogRepository get habitLogs =>
      SupabaseHabitLogRepository(ref.watch(supabaseClientProvider));

  @override
  TaskRepository get tasks =>
      SupabaseTaskRepository(ref.watch(supabaseClientProvider));

  @override
  MetricRepository get metrics =>
      SupabaseMetricRepository(ref.watch(supabaseClientProvider));

  @override
  MetricLogRepository get metricLogs =>
      SupabaseMetricLogRepository(ref.watch(supabaseClientProvider));

  @override
  DailyCheckInRepository get dailyCheckIns =>
      SupabaseDailyCheckInRepository(ref.watch(supabaseClientProvider));

  @override
  JournalRepository get journals =>
      SupabaseJournalRepository(ref.watch(supabaseClientProvider));

  @override
  ActivityRepository get activities =>
      SupabaseActivityRepository(ref.watch(supabaseClientProvider));
}

/// Repository Provider - Main provider for all repositories
final repositoryProvider = Provider<RepositoryProvider>((ref) {
  return SupabaseRepositoryProvider(ref);
});

/// Individual repository providers for granular watching
final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  return ref.watch(repositoryProvider).userProfile;
});

final goalRepositoryProvider = Provider<GoalRepository>((ref) {
  return ref.watch(repositoryProvider).goals;
});

final objectiveRepositoryProvider = Provider<ObjectiveRepository>((ref) {
  return ref.watch(repositoryProvider).objectives;
});

final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  return ref.watch(repositoryProvider).habits;
});

final habitLogRepositoryProvider = Provider<HabitLogRepository>((ref) {
  return ref.watch(repositoryProvider).habitLogs;
});

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return ref.watch(repositoryProvider).tasks;
});

final metricRepositoryProvider = Provider<MetricRepository>((ref) {
  return ref.watch(repositoryProvider).metrics;
});

final metricLogRepositoryProvider = Provider<MetricLogRepository>((ref) {
  return ref.watch(repositoryProvider).metricLogs;
});

final dailyCheckInRepositoryProvider = Provider<DailyCheckInRepository>((ref) {
  return ref.watch(repositoryProvider).dailyCheckIns;
});

final journalRepositoryProvider = Provider<JournalRepository>((ref) {
  return ref.watch(repositoryProvider).journals;
});

final activityRepositoryProvider = Provider<ActivityRepository>((ref) {
  return ref.watch(repositoryProvider).activities;
});