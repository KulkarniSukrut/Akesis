// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: json['id'] as String,
  fullName: json['fullName'] as String?,
  timezone: json['timezone'] as String? ?? 'UTC',
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'timezone': instance.timezone,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_Goal _$GoalFromJson(Map<String, dynamic> json) => _Goal(
  id: json['id'] as String,
  userId: json['userId'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  category: json['category'] as String? ?? 'general',
  targetDate: json['targetDate'] == null
      ? null
      : DateTime.parse(json['targetDate'] as String),
  status:
      $enumDecodeNullable(_$GoalStatusEnumMap, json['status']) ??
      GoalStatus.inProgress,
  progress: (json['progress'] as num?)?.toInt() ?? 0,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  objectives:
      (json['objectives'] as List<dynamic>?)
          ?.map((e) => Objective.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$GoalToJson(_Goal instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'targetDate': instance.targetDate?.toIso8601String(),
  'status': _$GoalStatusEnumMap[instance.status]!,
  'progress': instance.progress,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'objectives': instance.objectives,
};

const _$GoalStatusEnumMap = {
  GoalStatus.notStarted: 'not_started',
  GoalStatus.inProgress: 'in_progress',
  GoalStatus.completed: 'completed',
  GoalStatus.archived: 'archived',
};

_Objective _$ObjectiveFromJson(Map<String, dynamic> json) => _Objective(
  id: json['id'] as String,
  goalId: json['goalId'] as String,
  userId: json['userId'] as String,
  title: json['title'] as String,
  isCompleted: json['isCompleted'] as bool? ?? false,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ObjectiveToJson(_Objective instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goalId': instance.goalId,
      'userId': instance.userId,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'completedAt': instance.completedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

_Habit _$HabitFromJson(Map<String, dynamic> json) => _Habit(
  id: json['id'] as String,
  userId: json['userId'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  category: json['category'] as String? ?? 'general',
  frequency:
      $enumDecodeNullable(_$HabitFrequencyEnumMap, json['frequency']) ??
      HabitFrequency.daily,
  targetDaysPerWeek: (json['targetDaysPerWeek'] as num?)?.toInt() ?? 7,
  customDays:
      (json['customDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [1, 2, 3, 4, 5, 6, 7],
  isArchived: json['isArchived'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  completedToday: json['completedToday'] as bool? ?? false,
  currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$HabitToJson(_Habit instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'frequency': _$HabitFrequencyEnumMap[instance.frequency]!,
  'targetDaysPerWeek': instance.targetDaysPerWeek,
  'customDays': instance.customDays,
  'isArchived': instance.isArchived,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'completedToday': instance.completedToday,
  'currentStreak': instance.currentStreak,
};

const _$HabitFrequencyEnumMap = {
  HabitFrequency.daily: 'daily',
  HabitFrequency.weekly: 'weekly',
  HabitFrequency.custom: 'custom',
};

_HabitLog _$HabitLogFromJson(Map<String, dynamic> json) => _HabitLog(
  id: json['id'] as String,
  habitId: json['habitId'] as String,
  userId: json['userId'] as String,
  logDate: DateTime.parse(json['logDate'] as String),
  completed: json['completed'] as bool? ?? true,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$HabitLogToJson(_HabitLog instance) => <String, dynamic>{
  'id': instance.id,
  'habitId': instance.habitId,
  'userId': instance.userId,
  'logDate': instance.logDate.toIso8601String(),
  'completed': instance.completed,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
};

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  userId: json['userId'] as String,
  goalId: json['goalId'] as String?,
  title: json['title'] as String,
  description: json['description'] as String?,
  priority:
      $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']) ??
      TaskPriority.medium,
  dueDate: json['dueDate'] == null
      ? null
      : DateTime.parse(json['dueDate'] as String),
  isCompleted: json['isCompleted'] as bool? ?? false,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  category: json['category'] as String? ?? 'general',
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'goalId': instance.goalId,
  'title': instance.title,
  'description': instance.description,
  'priority': _$TaskPriorityEnumMap[instance.priority]!,
  'dueDate': instance.dueDate?.toIso8601String(),
  'isCompleted': instance.isCompleted,
  'completedAt': instance.completedAt?.toIso8601String(),
  'category': instance.category,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
  TaskPriority.urgent: 'urgent',
};

_Metric _$MetricFromJson(Map<String, dynamic> json) => _Metric(
  id: json['id'] as String,
  userId: json['userId'] as String,
  name: json['name'] as String,
  category: json['category'] as String? ?? 'general',
  type: $enumDecode(_$MetricTypeEnumMap, json['type']),
  unit: json['unit'] as String?,
  minVal: (json['minVal'] as num?)?.toDouble(),
  maxVal: (json['maxVal'] as num?)?.toDouble(),
  step: (json['step'] as num?)?.toDouble() ?? 1,
  isArchived: json['isArchived'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
  currentValue: json['currentValue'],
);

Map<String, dynamic> _$MetricToJson(_Metric instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'name': instance.name,
  'category': instance.category,
  'type': _$MetricTypeEnumMap[instance.type]!,
  'unit': instance.unit,
  'minVal': instance.minVal,
  'maxVal': instance.maxVal,
  'step': instance.step,
  'isArchived': instance.isArchived,
  'createdAt': instance.createdAt.toIso8601String(),
  'currentValue': instance.currentValue,
};

const _$MetricTypeEnumMap = {
  MetricType.boolean: 'boolean',
  MetricType.quantity: 'quantity',
  MetricType.duration: 'duration',
  MetricType.scale: 'scale',
  MetricType.count: 'count',
};

_MetricLog _$MetricLogFromJson(Map<String, dynamic> json) => _MetricLog(
  id: json['id'] as String,
  metricId: json['metricId'] as String,
  userId: json['userId'] as String,
  logDate: DateTime.parse(json['logDate'] as String),
  logTime: DateTime.parse(json['logTime'] as String),
  valNum: (json['valNum'] as num?)?.toDouble(),
  valBool: json['valBool'] as bool?,
  valText: json['valText'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MetricLogToJson(_MetricLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'metricId': instance.metricId,
      'userId': instance.userId,
      'logDate': instance.logDate.toIso8601String(),
      'logTime': instance.logTime.toIso8601String(),
      'valNum': instance.valNum,
      'valBool': instance.valBool,
      'valText': instance.valText,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_DailyCheckIn _$DailyCheckInFromJson(Map<String, dynamic> json) =>
    _DailyCheckIn(
      id: json['id'] as String,
      userId: json['userId'] as String,
      checkInDate: DateTime.parse(json['checkInDate'] as String),
      mood: (json['mood'] as num?)?.toInt() ?? 5,
      energy: (json['energy'] as num?)?.toInt() ?? 5,
      stress: (json['stress'] as num?)?.toInt() ?? 5,
      productivity: (json['productivity'] as num?)?.toInt() ?? 5,
      sleepHours: (json['sleepHours'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DailyCheckInToJson(_DailyCheckIn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'checkInDate': instance.checkInDate.toIso8601String(),
      'mood': instance.mood,
      'energy': instance.energy,
      'stress': instance.stress,
      'productivity': instance.productivity,
      'sleepHours': instance.sleepHours,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_JournalEntry _$JournalEntryFromJson(Map<String, dynamic> json) =>
    _JournalEntry(
      id: json['id'] as String,
      userId: json['userId'] as String,
      entryDate: DateTime.parse(json['entryDate'] as String),
      title: json['title'] as String?,
      content: json['content'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$JournalEntryToJson(_JournalEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'entryDate': instance.entryDate.toIso8601String(),
      'title': instance.title,
      'content': instance.content,
      'tags': instance.tags,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_ActivityEvent _$ActivityEventFromJson(Map<String, dynamic> json) =>
    _ActivityEvent(
      id: json['id'] as String,
      userId: json['userId'] as String,
      eventTime: DateTime.parse(json['eventTime'] as String),
      eventDate: DateTime.parse(json['eventDate'] as String),
      type: json['type'] as String,
      category: json['category'] as String? ?? 'general',
      value: (json['value'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ActivityEventToJson(_ActivityEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'eventTime': instance.eventTime.toIso8601String(),
      'eventDate': instance.eventDate.toIso8601String(),
      'type': instance.type,
      'category': instance.category,
      'value': instance.value,
      'unit': instance.unit,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
    };
