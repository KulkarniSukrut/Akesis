/// Supabase Repository Implementations

library data.repositories;

import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../supabase/supabase.dart';

/// Base Supabase Repository with common CRUD operations
abstract class SupabaseRepository<T> implements BaseRepository<T> {
  final SupabaseClient client;
  final String tableName;
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  SupabaseRepository({
    required this.client,
    required this.tableName,
    required this.fromJson,
    required this.toJson,
  });

  @override
  Future<T?> getById(String id) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('id', id)
        .maybeSingle();
    return response != null ? fromJson(response) : null;
  }

  @override
  Future<List<T>> getAll() async {
    final response = await client.from(tableName).select();
    return (response as List).map((e) => fromJson(e)).toList();
  }

  @override
  Future<T> create(T item) async {
    final json = toJson(item);
    json.remove('id'); // Let DB generate UUID
    final response = await client.from(tableName).insert(json).select().single();
    return fromJson(response);
  }

  @override
  Future<T> update(T item) async {
    final json = toJson(item);
    final id = json['id'] as String;
    json.remove('id');
    json['updated_at'] = DateTime.now().toIso8601String();
    final response = await client
        .from(tableName)
        .update(json)
        .eq('id', id)
        .select()
        .single();
    return fromJson(response);
  }

  @override
  Future<void> delete(String id) async {
    await client.from(tableName).delete().eq('id', id);
  }

  @override
  Stream<List<T>> watchAll() {
    return client
        .from(tableName)
        .stream(primaryKey: ['id'])
        .map((data) => data.map(fromJson).toList());
  }
}

/// User Profile Repository Implementation
class SupabaseUserProfileRepository extends SupabaseRepository<UserProfile>
    implements UserProfileRepository {
  SupabaseUserProfileRepository(SupabaseClient client)
      : super(
          client: client,
          tableName: 'profiles',
          fromJson: UserProfile.fromJson,
          toJson: (p) => p.toJson(),
        );

  @override
  Future<UserProfile?> getCurrentUser() async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) return null;
    return getById(userId);
  }

  @override
  Future<UserProfile> upsert(UserProfile profile) async {
    final json = profile.toJson();
    final response = await client
        .from(tableName)
        .upsert(json)
        .select()
        .single();
    return fromJson(response);
  }
}

/// Goal Repository Implementation
class SupabaseGoalRepository extends SupabaseRepository<Goal> implements GoalRepository {
  SupabaseGoalRepository(SupabaseClient client)
      : super(
          client: client,
          tableName: 'goals',
          fromJson: Goal.fromJson,
          toJson: (g) => g.toJson(),
        );

  @override
  Future<List<Goal>> getByUserId(String userId) async {
    final response = await client
        .from(tableName)
        .select('*, objectives(*)')
        .eq('user_id', userId)
        .order('created_at', ascending: true);
    return (response as List).map((e) => _goalWithObjectives(e)).toList();
  }

  @override
  Future<List<Goal>> getActiveGoals(String userId) async {
    final response = await client
        .from(tableName)
        .select('*, objectives(*)')
        .eq('user_id', userId)
        .neq('status', 'archived')
        .order('created_at', ascending: true);
    return (response as List).map((e) => _goalWithObjectives(e)).toList();
  }

  @override
  Future<Goal> updateProgress(String goalId, int progress) async {
    final response = await client
        .from(tableName)
        .update({'progress': progress, 'updated_at': DateTime.now().toIso8601String()})
        .eq('id', goalId)
        .select('*, objectives(*)')
        .single();
    return _goalWithObjectives(response);
  }

  @override
  Stream<List<Goal>> watchUserGoals(String userId) {
    return client
        .from(tableName)
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .map((data) => data.map(_goalWithObjectives).toList());
  }

  Goal _goalWithObjectives(Map<String, dynamic> json) {
    final objectives = (json['objectives'] as List?)
        ?.map((o) => Objective.fromJson(o))
        .toList() ?? [];
    return Goal.fromJson({...json, 'objectives': objectives});
  }
}

/// Objective Repository Implementation
class SupabaseObjectiveRepository extends SupabaseRepository<Objective>
    implements ObjectiveRepository {
  SupabaseObjectiveRepository(SupabaseClient client)
      : super(
          client: client,
          tableName: 'objectives',
          fromJson: Objective.fromJson,
          toJson: (o) => o.toJson(),
        );

  @override
  Future<List<Objective>> getByGoalId(String goalId) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('goal_id', goalId)
        .order('created_at', ascending: true);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<Objective> markCompleted(String objectiveId) async {
    final response = await client
        .from(tableName)
        .update({
          'is_completed': true,
          'completed_at': DateTime.now().toIso8601String(),
        })
        .eq('id', objectiveId)
        .select()
        .single();
    return fromJson(response);
  }

  @override
  Stream<List<Objective>> watchGoalObjectives(String goalId) {
    return client
        .from(tableName)
        .stream(primaryKey: ['id'])
        .eq('goal_id', goalId)
        .map((data) => data.map(fromJson).toList());
  }
}

/// Habit Repository Implementation
class SupabaseHabitRepository extends SupabaseRepository<Habit> implements HabitRepository {
  SupabaseHabitRepository(SupabaseClient client)
      : super(
          client: client,
          tableName: 'habits',
          fromJson: Habit.fromJson,
          toJson: (h) => h.toJson(),
        );

  @override
  Future<List<Habit>> getByUserId(String userId) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .eq('is_archived', false)
        .order('created_at', ascending: true);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<Habit>> getActiveHabits(String userId) async {
    return getByUserId(userId);
  }

  @override
  Future<List<Habit>> getHabitsForDate(String userId, DateTime date) async {
    final dateStr = _dateToString(date);
    // Get habits and their logs for the date
    final habitsResponse = await client
        .from(tableName)
        .select('*, habit_logs!habit_logs_habit_id_fkey(log_date, completed)')
        .eq('user_id', userId)
        .eq('is_archived', false)
        .eq('habit_logs.log_date', dateStr);

    return (habitsResponse as List).map((h) {
      final habit = Habit.fromJson(h);
      final logs = h['habit_logs'] as List?;
      final todayLog = logs?.firstWhere(
        (l) => l['log_date'] == dateStr,
        orElse: () => null,
      );
      return habit.copyWith(
        completedToday: todayLog?['completed'] == true,
      );
    }).toList();
  }

  @override
  Future<Habit> toggleHabit(String habitId, DateTime date, bool completed) async {
    const dateStr = _dateToString;
    final todayStr = dateStr(date);

    // Upsert habit log
    await client.from('habit_logs').upsert({
      'habit_id': habitId,
      'user_id': client.auth.currentUser!.id,
      'log_date': todayStr,
      'completed': completed,
    }).select();

    // Get updated habit with streak
    final habit = await getById(habitId);
    if (habit == null) throw StateError('Habit not found');

    // Calculate streak (simplified - real impl would query logs)
    final streak = await _calculateStreak(habitId);

    return habit.copyWith(
      completedToday: completed,
      currentStreak: streak,
    );
  }

  @override
  Future<int> getStreak(String habitId) async {
    return _calculateStreak(habitId);
  }

  @override
  Stream<List<Habit>> watchUserHabits(String userId) {
    return client
        .from(tableName)
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .eq('is_archived', false)
        .map((data) => data.map((e) => fromJson(e as Map<String, dynamic>)).toList());
  }

  Future<int> _calculateStreak(String habitId) async {
    // Simplified streak calculation - real implementation would be more complex
    final logs = await client
        .from('habit_logs')
        .select('log_date')
        .eq('habit_id', habitId)
        .eq('completed', true)
        .order('log_date', ascending: false)
        .limit(100);

    if (logs.isEmpty) return 0;

    int streak = 0;
    DateTime? expectedDate = DateTime.now();
    for (final log in logs) {
      final logDateStr = log['log_date'] as String?;
      if (logDateStr == null) continue;
      final logDate = DateTime.parse(logDateStr);
      if (logDate == expectedDate || logDate == expectedDate?.subtract(const Duration(days: 1))) {
        streak++;
        expectedDate = logDate.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }
    return streak;
  }
}

String _dateToString(DateTime date) {
  return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

/// Task Repository Implementation
class SupabaseTaskRepository extends SupabaseRepository<Task> implements TaskRepository {
  SupabaseTaskRepository(SupabaseClient client)
      : super(
          client: client,
          tableName: 'tasks',
          fromJson: Task.fromJson,
          toJson: (t) => t.toJson(),
        );

  @override
  Future<List<Task>> getByUserId(String userId) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .order('due_date', ascending: true)
        .order('created_at', ascending: false);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<Task>> getPendingTasks(String userId) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .eq('is_completed', false)
        .order('due_date', ascending: true)
        .order('priority', ascending: false);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<Task>> getTasksForDate(String userId, DateTime date) async {
    final dateStr = _dateToString(date);
    final nextDateStr = _dateToString(date.add(const Duration(days: 1)));
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .gte('due_date', dateStr)
        .lt('due_date', nextDateStr)
        .order('priority', ascending: false);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<Task>> getByGoalId(String goalId) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('goal_id', goalId)
        .order('due_date', ascending: true);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<Task> toggleTask(String taskId, bool completed) async {
    final response = await client
        .from(tableName)
        .update({
          'is_completed': completed,
          'completed_at': completed ? DateTime.now().toIso8601String() : null,
          'updated_at': DateTime.now().toIso8601String(),
        })
        .eq('id', taskId)
        .select()
        .single();
    return fromJson(response);
  }

  @override
  Future<List<Task>> getOverdueTasks(String userId) async {
    final now = DateTime.now().toIso8601String();
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .eq('is_completed', false)
        .lt('due_date', now)
        .order('due_date', ascending: true);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Stream<List<Task>> watchUserTasks(String userId) {
    return client
        .from(tableName)
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .map((data) => data.map((e) => fromJson(e as Map<String, dynamic>)).toList());
  }
}

/// Metric Repository Implementation
class SupabaseMetricRepository extends SupabaseRepository<Metric> implements MetricRepository {
  SupabaseMetricRepository(SupabaseClient client)
      : super(
          client: client,
          tableName: 'metrics',
          fromJson: Metric.fromJson,
          toJson: (m) => m.toJson(),
        );

  @override
  Future<List<Metric>> getByUserId(String userId) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .eq('is_archived', false)
        .order('created_at', ascending: true);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<Metric>> getActiveMetrics(String userId) async {
    return getByUserId(userId);
  }

  @override
  Future<Metric> updateCurrentValue(String metricId, dynamic value) async {
    final metric = await getById(metricId);
    if (metric == null) throw StateError('Metric not found');
    return metric.copyWith(currentValue: value);
  }

  @override
  Stream<List<Metric>> watchUserMetrics(String userId) {
    return client
        .from(tableName)
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .eq('is_archived', false)
        .map((data) => data.map((e) => fromJson(e as Map<String, dynamic>)).toList());
  }
}

/// Daily Check-In Repository Implementation
class SupabaseDailyCheckInRepository extends SupabaseRepository<DailyCheckIn>
    implements DailyCheckInRepository {
  SupabaseDailyCheckInRepository(SupabaseClient client)
      : super(
          client: client,
          tableName: 'daily_check_ins',
          fromJson: DailyCheckIn.fromJson,
          toJson: (c) => c.toJson(),
        );

  @override
  Future<DailyCheckIn?> getByUserAndDate(String userId, DateTime date) async {
    final dateStr = _dateToString(date);
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .eq('check_in_date', dateStr)
        .maybeSingle();
    return response != null ? fromJson(response) : null;
  }

  @override
  Future<DailyCheckIn> upsert(DailyCheckIn checkIn) async {
    final json = checkIn.toJson();
    final response = await client
        .from(tableName)
        .upsert(json, onConflict: 'user_id,check_in_date')
        .select()
        .single();
    return fromJson(response);
  }

  @override
  Future<List<DailyCheckIn>> getByUserAndDateRange(String userId, DateTime start, DateTime end) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .gte('check_in_date', _dateToString(start))
        .lte('check_in_date', _dateToString(end))
        .order('check_in_date', ascending: false);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Stream<DailyCheckIn?> watchUserCheckIn(String userId, DateTime date) {
    final dateStr = _dateToString(date);
    return client
        .from(tableName)
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .eq('check_in_date', dateStr)
        .map((data) => data.isEmpty ? null : fromJson(data.first));
  }
}

/// Journal Repository Implementation
class SupabaseJournalRepository extends SupabaseRepository<JournalEntry>
    implements JournalRepository {
  SupabaseJournalRepository(SupabaseClient client)
      : super(
          client: client,
          tableName: 'journal_entries',
          fromJson: JournalEntry.fromJson,
          toJson: (j) => j.toJson(),
        );

  @override
  Future<List<JournalEntry>> getByUserId(String userId) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .order('entry_date', ascending: false)
        .order('created_at', ascending: false);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<JournalEntry>> getByUserAndDateRange(String userId, DateTime start, DateTime end) async {
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .gte('entry_date', _dateToString(start))
        .lte('entry_date', _dateToString(end))
        .order('entry_date', ascending: false);
    return (response as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<JournalEntry?> getByUserAndDate(String userId, DateTime date) async {
    final dateStr = _dateToString(date);
    final response = await client
        .from(tableName)
        .select()
        .eq('user_id', userId)
        .eq('entry_date', dateStr)
        .maybeSingle();
    return response != null ? fromJson(response) : null;
  }

  @override
  Stream<List<JournalEntry>> watchUserJournals(String userId) {
    return client
        .from(tableName)
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .map((data) => data.map((e) => fromJson(e as Map<String, dynamic>)).toList());
  }
}

/// Activity Repository Implementation
class SupabaseActivityRepository implements ActivityRepository {
  final SupabaseClient client;

  SupabaseActivityRepository(this.client);

  @override
  Future<List<ActivityEvent>> getByUserId(String userId, {int limit = 50}) async {
    final response = await client
        .from('activities')
        .select()
        .eq('user_id', userId)
        .order('event_time', ascending: false)
        .limit(limit);
    return (response as List).map((e) => ActivityEvent.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<ActivityEvent>> getByUserAndDateRange(String userId, DateTime start, DateTime end) async {
    final response = await client
        .from('activities')
        .select()
        .eq('user_id', userId)
        .gte('event_date', _dateToString(start))
        .lte('event_date', _dateToString(end))
        .order('event_time', ascending: false);
    return (response as List).map((e) => ActivityEvent.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<ActivityEvent>> getByType(String userId, String type) async {
    final response = await client
        .from('activities')
        .select()
        .eq('user_id', userId)
        .eq('type', type)
        .order('event_time', ascending: false);
    return (response as List).map((e) => ActivityEvent.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<ActivityEvent> create(ActivityEvent event) async {
    final json = event.toJson();
    json.remove('id');
    final response = await client.from('activities').insert(json).select().single();
    return ActivityEvent.fromJson(response);
  }

  @override
  Stream<List<ActivityEvent>> watchUserActivities(String userId, {int limit = 50}) {
    return client
        .from('activities')
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .map((data) => data.map((e) => ActivityEvent.fromJson(e as Map<String, dynamic>)).take(limit).toList());
  }
}

/// Metric Log Repository Implementation
class SupabaseMetricLogRepository implements MetricLogRepository {
  final SupabaseClient client;

  SupabaseMetricLogRepository(this.client);

  @override
  Future<List<MetricLog>> getByMetricId(String metricId) async {
    final response = await client
        .from('metric_logs')
        .select()
        .eq('metric_id', metricId)
        .order('log_date', ascending: false);
    return (response as List).map((e) => MetricLog.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<MetricLog>> getByUserAndDateRange(String userId, DateTime start, DateTime end) async {
    final response = await client
        .from('metric_logs')
        .select()
        .eq('user_id', userId)
        .gte('log_date', _dateToString(start))
        .lte('log_date', _dateToString(end))
        .order('log_date', ascending: false);
    return (response as List).map((e) => MetricLog.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<MetricLog> create(MetricLog log) async {
    final json = log.toJson();
    json.remove('id');
    final response = await client.from('metric_logs').insert(json).select().single();
    return MetricLog.fromJson(response);
  }

  @override
  Stream<List<MetricLog>> watchMetricLogs(String metricId) {
    return client
        .from('metric_logs')
        .stream(primaryKey: ['id'])
        .eq('metric_id', metricId)
        .map((data) => data.map((e) => MetricLog.fromJson(e as Map<String, dynamic>)).toList());
  }
}

/// Habit Log Repository Implementation
class SupabaseHabitLogRepository implements HabitLogRepository {
  final SupabaseClient client;

  SupabaseHabitLogRepository(this.client);

  @override
  Future<List<HabitLog>> getByHabitId(String habitId) async {
    final response = await client
        .from('habit_logs')
        .select()
        .eq('habit_id', habitId)
        .order('log_date', ascending: false);
    return (response as List).map((e) => HabitLog.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<HabitLog>> getByUserAndDateRange(String userId, DateTime start, DateTime end) async {
    final response = await client
        .from('habit_logs')
        .select()
        .eq('user_id', userId)
        .gte('log_date', _dateToString(start))
        .lte('log_date', _dateToString(end))
        .order('log_date', ascending: false);
    return (response as List).map((e) => HabitLog.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<HabitLog?> getByHabitAndDate(String habitId, DateTime date) async {
    final dateStr = _dateToString(date);
    final response = await client
        .from('habit_logs')
        .select()
        .eq('habit_id', habitId)
        .eq('log_date', dateStr)
        .maybeSingle();
    return response != null ? HabitLog.fromJson(response) : null;
  }

  @override
  Future<HabitLog> upsert(HabitLog log) async {
    final json = log.toJson();
    json.remove('id');
    final response = await client
        .from('habit_logs')
        .upsert(json, onConflict: 'habit_id,log_date')
        .select()
        .single();
    return HabitLog.fromJson(response);
  }

  @override
  Stream<List<HabitLog>> watchHabitLogs(String habitId) {
    return client
        .from('habit_logs')
        .stream(primaryKey: ['id'])
        .eq('habit_id', habitId)
        .map((data) => data.map((e) => HabitLog.fromJson(e as Map<String, dynamic>)).toList());
  }
}