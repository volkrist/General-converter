// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'ตัวแปลงทั่วไป';

  @override
  String get pickImage => 'เลือกไฟล์';

  @override
  String get pickFromGallery => 'แกลเลอรี';

  @override
  String get pickFromFiles => 'ไฟล์';

  @override
  String get pickManyFiles => 'ไฟล์เป็นชุด';

  @override
  String get pickFolder => 'โฟลเดอร์';

  @override
  String get pickFileTitle => 'เลือกแหล่งที่มา';

  @override
  String get targetFormat => 'รูปแบบเป้าหมาย';

  @override
  String get convert => 'แปลง';

  @override
  String get convertBatch => 'แปลงเป็นชุด';

  @override
  String get converting => 'กำลังแปลง...';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get fileTooLarge => 'ไฟล์ใหญ่เกินไป';

  @override
  String get largeFileWarning =>
      'ตรวจพบไฟล์ขนาดใหญ่ การแปลงอาจลดขนาดภาพเพื่อความเสถียร';

  @override
  String get notEnoughMemory =>
      'หน่วยความจำไม่เพียงพอในการประมวลผลไฟล์นี้ ลองใช้ภาพที่เล็กกว่า หรือปิดแอปอื่นๆ';

  @override
  String get memoryGuardTriggered =>
      'ไฟล์หนักเกินไปสำหรับการแปลงที่ปลอดภัยบนอุปกรณ์นี้';

  @override
  String get batchMemoryGuardTriggered =>
      'เลือกไฟล์หนักจำนวนมากเกินไปพร้อมกัน แยกชุดเป็นส่วนเล็กๆ';

  @override
  String get save => 'บันทึก';

  @override
  String get saving => 'กำลังบันทึก...';

  @override
  String get saved => 'บันทึกแล้ว';

  @override
  String get share => 'แชร์';

  @override
  String get rename => 'เปลี่ยนชื่อ';

  @override
  String get renameOutput => 'เปลี่ยนชื่อเอาต์พุต';

  @override
  String get renameHint => 'ชื่อไฟล์โดยไม่ต้องใส่นามสกุล';

  @override
  String get apply => 'ใช้';

  @override
  String get dismiss => 'ปิด';

  @override
  String get emptyStateHint => 'แตะ + เพื่อเลือกจากแกลเลอรีหรือไฟล์';

  @override
  String get conversionFailed => 'การแปลงล้มเหลว';

  @override
  String get batchConversionFailed => 'การแปลงเป็นชุดล้มเหลว';

  @override
  String get saveFailed => 'บันทึกล้มเหลว';

  @override
  String get pickFailed => 'การเลือกล้มเหลว';

  @override
  String get tapToPick => 'แตะเพื่อเลือกไฟล์';

  @override
  String get invalidOrCorruptImage =>
      'ไฟล์ไม่ใช่ภาพที่ถูกต้องหรืออาจมีความเสียหาย';

  @override
  String get invalidImageDimensions => 'ภาพมีขนาดไม่ถูกต้อง (ว่างหรือศูนย์)';

  @override
  String get failedToDecodeHeic => 'ถอดรหัส HEIC ล้มเหลว';

  @override
  String get failedToEncodeHeic => 'เข้ารหัส HEIC ล้มเหลว';

  @override
  String get previewNotAvailable => 'ไม่สามารถแสดงตัวอย่างสำหรับรูปแบบนี้ได้';

  @override
  String get batchPreviewNoThumbnail => 'ไม่มีภาพขนาดย่อ';

  @override
  String get batchPreviewWaiting => 'ภาพขนาดย่อหลังการแปลง';

  @override
  String get failedToEncodeAvif => 'เข้ารหัส AVIF ล้มเหลว';

  @override
  String get formatPairNotSupported => 'คู่รูปแบบนี้ไม่รองรับ';

  @override
  String get pdfRenderUnavailable => 'อุปกรณ์นี้ไม่สามารถเรนเดอร์ PDF ได้';

  @override
  String get savePdfFailed => 'บันทึก PDF ล้มเหลว';

  @override
  String get unsupportedInputFormat => 'รูปแบบอินพุตไม่รองรับ';

  @override
  String get open => 'เปิด';

  @override
  String get openFileFailed => 'ไม่สามารถเปิดไฟล์ด้วยแอปอื่นได้';

  @override
  String get openFileUnavailableWeb =>
      'การเปิดไฟล์ในแอปอื่นไม่สามารถใช้ได้บนเว็บ';

  @override
  String get outputFileEmpty => 'ไฟล์ผลลัพธ์ว่างเปล่า';

  @override
  String get outputEncodeRoundTripFailed =>
      'ไฟล์ผลลัพธ์ไม่สามารถอ่านได้หลังการบันทึก';

  @override
  String get toggleTheme => 'สลับธีม';

  @override
  String get policyPreShrinkNoWritableDir =>
      'ไม่สามารถเตรียมพื้นที่ทำงานชั่วคราวสำหรับไฟล์นี้ ลองใช้แหล่งอื่นหรือเคลียร์ที่เก็บข้อมูล';

  @override
  String get conversionHintQuick => 'โดยปกติจะเสร็จในไม่กี่วินาที';

  @override
  String get conversionHintHeavy =>
      'ไฟล์ใหญ่ — การแปลงอาจใช้เวลาประมาณ 10–30 วินาที';

  @override
  String get conversionHintPdf =>
      'การส่งออก PDF อาจใช้เวลานานขึ้น (ประมาณ 10–30 วินาที)';

  @override
  String get batchReady => 'คิวชุดพร้อมแล้ว';

  @override
  String get batchDone => 'การแปลงชุดเสร็จสิ้น';

  @override
  String get noBatchFiles => 'ไม่มีไฟล์ที่เลือกสำหรับการแปลงเป็นชุด';

  @override
  String get progressFiles => 'ไฟล์';

  @override
  String get batchModeTitle => 'การแปลงเป็นชุด';

  @override
  String get batchModeSubtitle =>
      'เลือกฟอร์แมตเป้าหมาย แล้วแปลงไฟล์ทั้งหมด มุมมองไฟล์เดี่ยวจะถูกซ่อนในโหมดนี้';

  @override
  String get batchSummaryTotal => 'รวม';

  @override
  String get batchSummaryDone => 'เสร็จสิ้น';

  @override
  String get batchSummaryFailed => 'ล้มเหลว';

  @override
  String get batchSummaryQueued => 'อยู่ในคิว';

  @override
  String get saveAllSuccessful => 'บันทึกทั้งหมดเรียบร้อย';

  @override
  String get batchSaveAllStarting => 'กำลังบันทึกไฟล์...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'กำลังบันทึก $current/$total';
  }

  @override
  String get retryFailed => 'ลองอีกครั้งล้มเหลว';

  @override
  String get clearCompleted => 'ล้างที่เสร็จแล้ว';

  @override
  String get clearCompletedTooltip =>
      'ลบรายการที่ถูกทำเครื่องหมายว่าเป็นที่บันทึกจากรายการนี้';

  @override
  String get clearBatchQueue => 'ล้างคิว';

  @override
  String get batchStatusQueued => 'อยู่ในคิว';

  @override
  String get batchStatusConverting => 'กำลังแปลง';

  @override
  String get batchStatusDone => 'เสร็จสิ้น';

  @override
  String get batchStatusFailed => 'ล้มเหลว';

  @override
  String get batchStatusSaving => 'กำลังบันทึก';

  @override
  String get batchStatusSaved => 'บันทึกแล้ว';

  @override
  String get batchStatusCancelled => 'ยกเลิกแล้ว';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'ดาวน์โหลด';

  @override
  String get language => 'ภาษา';

  @override
  String get systemLanguage => 'ค่าเริ่มต้นของระบบ';

  @override
  String get errorDialogTitle => 'ข้อผิดพลาด';

  @override
  String get pickedFileCaption => 'ไฟล์ที่เลือก';

  @override
  String get keepScreenOn => 'ให้หน้าจอเปิดอยู่';

  @override
  String get keepScreenOnTooltip =>
      'ป้องกันไม่ให้หน้าจอปิดเมื่อแอปอยู่ในสถานะใช้งาน';
}
