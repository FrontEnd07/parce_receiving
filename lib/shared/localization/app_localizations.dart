import 'package:flutter/widgets.dart';

class AppLocalizations {
  const AppLocalizations(this.locale);
  final Locale locale;
  static const supportedLocales = [Locale('en'), Locale('ru'), Locale('zh')];
  static const delegate = _Delegate();
  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  static const _s = <String, Map<String, String>>{
    'en': {
      'diagnostics': 'Scale diagnostics',
      'settings': 'Settings',
      'language': 'Language',
      'diagnosticsSubtitle': 'Connect, command and inspect your BLE scale.',
      'connection': 'Connection',
      'nearbyDevices': 'Nearby devices',
      'scanHint': 'Keep the scale switched on and nearby.',
      'noDevicesHint': 'Start a scan to find your scale.',
      'readyToConnect': 'Ready to connect',
      'enableBluetooth': 'Enable Bluetooth',
      'connecting': 'Connecting…',
      'unnamedDevice': 'BLE device',
      'currentWeight': 'Latest weight response',
      'noWeight': 'No Co5 weight response received yet.',
      'unconfirmed': 'stability unconfirmed',
      'tareWeight': 'Tare (read)',
      'scan': 'Scan for BLE devices',
      'scanning': 'Scanning…',
      'connect': 'Connect',
      'disconnect': 'Disconnect',
      'connected': 'Connected',
      'notConnected': 'Not connected',
      'commands': 'Co5 commands',
      'gross': 'Gross',
      'net': 'Net',
      'tare': 'Tare',
      'zero': 'Zero',
      'rawLog': 'Diagnostic log',
      'clear': 'Clear',
      'noDevices': 'No BLE devices found yet.',
      'theme': 'Theme',
      'system': 'System default',
      'light': 'Light',
      'dark': 'Dark',
      'weight': 'Weight',
      'unknown': 'Unknown device',
      'hardwareNote':
          'Hardware readings require validation on the physical scale.',
    },
    'ru': {
      'diagnostics': 'Диагностика весов',
      'settings': 'Настройки',
      'language': 'Язык',
      'diagnosticsSubtitle':
          'Подключите весы, отправьте команду и проверьте ответ.',
      'connection': 'Подключение',
      'nearbyDevices': 'Устройства рядом',
      'scanHint': 'Включите весы и держите их рядом с телефоном.',
      'noDevicesHint': 'Запустите поиск, чтобы найти весы.',
      'readyToConnect': 'Готово к подключению',
      'enableBluetooth': 'Включить Bluetooth',
      'connecting': 'Подключение…',
      'unnamedDevice': 'BLE-устройство',
      'currentWeight': 'Последний ответ веса',
      'noWeight': 'Ответ Co5 с весом пока не получен.',
      'unconfirmed': 'стабильность не подтверждена',
      'tareWeight': 'Тара (чтение)',
      'scan': 'Поиск BLE-устройств',
      'scanning': 'Поиск…',
      'connect': 'Подключить',
      'disconnect': 'Отключить',
      'connected': 'Подключено',
      'notConnected': 'Нет подключения',
      'commands': 'Команды Co5',
      'gross': 'Брутто',
      'net': 'Нетто',
      'tare': 'Тара',
      'zero': 'Ноль',
      'rawLog': 'Журнал диагностики',
      'clear': 'Очистить',
      'noDevices': 'BLE-устройства пока не найдены.',
      'theme': 'Тема',
      'system': 'Как в системе',
      'light': 'Светлая',
      'dark': 'Тёмная',
      'weight': 'Вес',
      'unknown': 'Неизвестное устройство',
      'hardwareNote': 'Показания требуют проверки на реальных весах.',
    },
    'zh': {
      'diagnostics': '秤诊断',
      'settings': '设置',
      'language': '语言',
      'diagnosticsSubtitle': '连接秤、发送命令并检查 BLE 回应。',
      'connection': '连接状态',
      'nearbyDevices': '附近设备',
      'scanHint': '打开秤并将手机放在附近。',
      'noDevicesHint': '开始扫描以查找秤。',
      'readyToConnect': '准备连接',
      'enableBluetooth': '开启蓝牙',
      'connecting': '正在连接…',
      'unnamedDevice': 'BLE 设备',
      'currentWeight': '最近重量响应',
      'noWeight': '尚未收到 Co5 重量响应。',
      'unconfirmed': '稳定性未确认',
      'tareWeight': '皮重（读取）',
      'scan': '扫描 BLE 设备',
      'scanning': '正在扫描…',
      'connect': '连接',
      'disconnect': '断开连接',
      'connected': '已连接',
      'notConnected': '未连接',
      'commands': 'Co5 命令',
      'gross': '毛重',
      'net': '净重',
      'tare': '去皮',
      'zero': '归零',
      'rawLog': '诊断日志',
      'clear': '清除',
      'noDevices': '尚未发现 BLE 设备。',
      'theme': '主题',
      'system': '跟随系统',
      'light': '浅色',
      'dark': '深色',
      'weight': '重量',
      'unknown': '未知设备',
      'hardwareNote': '必须在实际秤上验证读数。',
    },
  };
  String operator [](String key) =>
      _s[locale.languageCode]?[key] ?? _s['en']![key] ?? key;
}

class _Delegate extends LocalizationsDelegate<AppLocalizations> {
  const _Delegate();
  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales.any(
    (item) => item.languageCode == locale.languageCode,
  );
  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale);
  @override
  bool shouldReload(_Delegate old) => false;
}
