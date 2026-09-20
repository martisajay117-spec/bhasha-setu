import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class MemoryAndLatencyManager {
  static final Stopwatch _stopwatch = Stopwatch();

  // Start latency tracking when user stops speaking
  static void startLatencyBenchmark() {
    _stopwatch.reset();
    _stopwatch.start();
  }

  // End benchmark and return execution time in milliseconds
  static int stopLatencyBenchmark() {
    _stopwatch.stop();
    int elapsedMs = _stopwatch.elapsedMilliseconds;
    print("⚡ TOTAL PIPELINE LATENCY: ${elapsedMs}ms");
    return elapsedMs;
  }

  // Clear memory cache between operations to prevent spikes on 2GB RAM devices
  static Future<void> purgeMemoryCache() async {
    // Force image and text painter cache eviction
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();

    // Explicit low-memory event notification to Flutter engine
    await const MethodChannel('flutter/system').invokeMethod('Memory.lowMemory');
  }
}
