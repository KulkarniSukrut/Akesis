/// Supabase Configuration and Client Setup

library data.supabase;

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Supabase configuration from environment
class SupabaseConfig {
  final String url;
  final String anonKey;

  const SupabaseConfig({
    required this.url,
    required this.anonKey,
  });

  bool get isValid => url.isNotEmpty && anonKey.isNotEmpty && url.startsWith('http');
}

/// Provider for Supabase config (loads from env or secure storage)
final supabaseConfigProvider = Provider<SupabaseConfig>((ref) {
  // In production, load from --dart-define or secure storage
  // For now, use const values that will be replaced by build-time defines
  const url = String.fromEnvironment('SUPABASE_URL', defaultValue: '');
  const anonKey = String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');
  return SupabaseConfig(url: url, anonKey: anonKey);
});

/// Supabase Client Provider
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  final config = ref.watch(supabaseConfigProvider);
  if (!config.isValid) {
    throw StateError('Supabase not configured. Set SUPABASE_URL and SUPABASE_ANON_KEY');
  }
  return SupabaseClient(config.url, config.anonKey);
});

/// Auth State Stream Provider
final authStateProvider = StreamProvider<AuthState>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return client.auth.onAuthStateChange;
});

/// Current User Provider
final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.whenData((state) => state.session?.user).value;
});

/// Current User ID Provider
final currentUserIdProvider = Provider<String?>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.id;
});