
import 'platform_channel_platform_interface.dart';

class PlatformChannel {
  Future<String?> getPlatformVersion() {
    return PlatformChannelPlatform.instance.getPlatformVersion();
  }
}
