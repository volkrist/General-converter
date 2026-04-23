import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sr'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// The application name shown in UI
  ///
  /// In en, this message translates to:
  /// **'General Converter'**
  String get appName;

  /// Button label to pick a single file
  ///
  /// In en, this message translates to:
  /// **'Pick file'**
  String get pickImage;

  /// Label to pick from gallery
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get pickFromGallery;

  /// Label to pick from file manager
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get pickFromFiles;

  /// Label for batch file selection
  ///
  /// In en, this message translates to:
  /// **'Batch files'**
  String get pickManyFiles;

  /// Convert action label
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get pickFolder;

  /// No description provided for @pickFileTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose source'**
  String get pickFileTitle;

  /// No description provided for @targetFormat.
  ///
  /// In en, this message translates to:
  /// **'Target format'**
  String get targetFormat;

  /// No description provided for @convert.
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get convert;

  /// No description provided for @convertBatch.
  ///
  /// In en, this message translates to:
  /// **'Convert batch'**
  String get convertBatch;

  /// No description provided for @converting.
  ///
  /// In en, this message translates to:
  /// **'Converting...'**
  String get converting;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Error shown when file is too large
  ///
  /// In en, this message translates to:
  /// **'File is too large'**
  String get fileTooLarge;

  /// Warning about large files
  ///
  /// In en, this message translates to:
  /// **'Large file detected. Conversion may reduce image size for stability.'**
  String get largeFileWarning;

  /// Error when device lacks memory
  ///
  /// In en, this message translates to:
  /// **'Not enough memory to process this file. Try a smaller image or close other apps.'**
  String get notEnoughMemory;

  /// Message when conversion is restricted by memory guard
  ///
  /// In en, this message translates to:
  /// **'File is too heavy for safe conversion on this device.'**
  String get memoryGuardTriggered;

  /// Message when batch selection triggers memory guard
  ///
  /// In en, this message translates to:
  /// **'Too many heavy files selected at once. Split the batch into smaller parts.'**
  String get batchMemoryGuardTriggered;

  /// Save action label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Status shown while saving
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// Confirmation that save completed
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// Share action label
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// Rename action label
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// Rename output label
  ///
  /// In en, this message translates to:
  /// **'Rename output'**
  String get renameOutput;

  /// Hint text for renaming output file
  ///
  /// In en, this message translates to:
  /// **'File name without extension'**
  String get renameHint;

  /// Apply action label
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// Dismiss action label
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// Hint shown in empty state
  ///
  /// In en, this message translates to:
  /// **'Tap + to pick from gallery or files'**
  String get emptyStateHint;

  /// Error when conversion fails
  ///
  /// In en, this message translates to:
  /// **'Conversion failed'**
  String get conversionFailed;

  /// Error when batch conversion fails
  ///
  /// In en, this message translates to:
  /// **'Batch conversion failed'**
  String get batchConversionFailed;

  /// Error when saving fails
  ///
  /// In en, this message translates to:
  /// **'Failed to save'**
  String get saveFailed;

  /// Error when picking a file fails
  ///
  /// In en, this message translates to:
  /// **'Failed to pick image'**
  String get pickFailed;

  /// Instruction to tap to pick a file
  ///
  /// In en, this message translates to:
  /// **'Tap to pick a file'**
  String get tapToPick;

  /// Error for invalid or corrupt image files
  ///
  /// In en, this message translates to:
  /// **'The file is not a valid image or appears to be damaged.'**
  String get invalidOrCorruptImage;

  /// Error for images with invalid dimensions
  ///
  /// In en, this message translates to:
  /// **'The image has invalid size (empty or zero dimensions).'**
  String get invalidImageDimensions;

  /// Error decoding HEIC
  ///
  /// In en, this message translates to:
  /// **'Failed to decode HEIC'**
  String get failedToDecodeHeic;

  /// Error encoding HEIC
  ///
  /// In en, this message translates to:
  /// **'Failed to encode HEIC'**
  String get failedToEncodeHeic;

  /// Text shown when preview is unavailable
  ///
  /// In en, this message translates to:
  /// **'Preview is not available for this format'**
  String get previewNotAvailable;

  /// Label when no thumbnail available
  ///
  /// In en, this message translates to:
  /// **'No thumbnail'**
  String get batchPreviewNoThumbnail;

  /// Label shown while thumbnail is pending
  ///
  /// In en, this message translates to:
  /// **'Thumbnail after conversion'**
  String get batchPreviewWaiting;

  /// Error encoding AVIF
  ///
  /// In en, this message translates to:
  /// **'Failed to encode AVIF'**
  String get failedToEncodeAvif;

  /// Message for unsupported format pair
  ///
  /// In en, this message translates to:
  /// **'This format pair is not supported'**
  String get formatPairNotSupported;

  /// Message when PDF rendering isn't supported
  ///
  /// In en, this message translates to:
  /// **'PDF could not be rendered on this device'**
  String get pdfRenderUnavailable;

  /// Error when saving PDF fails
  ///
  /// In en, this message translates to:
  /// **'Failed to save PDF'**
  String get savePdfFailed;

  /// Message for unsupported input formats
  ///
  /// In en, this message translates to:
  /// **'Unsupported input format'**
  String get unsupportedInputFormat;

  /// Open action label
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// Error when opening file with another app fails
  ///
  /// In en, this message translates to:
  /// **'Could not open file with another app'**
  String get openFileFailed;

  /// Message when opening files in another app is not available on web
  ///
  /// In en, this message translates to:
  /// **'Opening files in another app is not available on web'**
  String get openFileUnavailableWeb;

  /// Error when output file is empty
  ///
  /// In en, this message translates to:
  /// **'Output file is empty'**
  String get outputFileEmpty;

  /// Error when output becomes unreadable after saving
  ///
  /// In en, this message translates to:
  /// **'Output file was not readable after save'**
  String get outputEncodeRoundTripFailed;

  /// Label to toggle theme
  ///
  /// In en, this message translates to:
  /// **'Toggle theme'**
  String get toggleTheme;

  /// Message when temporary workspace cannot be prepared
  ///
  /// In en, this message translates to:
  /// **'Cannot prepare a temporary workspace for this file. Try another source or free storage.'**
  String get policyPreShrinkNoWritableDir;

  /// Quick conversion hint
  ///
  /// In en, this message translates to:
  /// **'Usually finishes in a few seconds.'**
  String get conversionHintQuick;

  /// Heavy conversion hint
  ///
  /// In en, this message translates to:
  /// **'Large file — conversion may take ~10–30 seconds.'**
  String get conversionHintHeavy;

  /// PDF conversion hint
  ///
  /// In en, this message translates to:
  /// **'PDF export may take longer (~10–30 seconds).'**
  String get conversionHintPdf;

  /// Message when batch queue is ready
  ///
  /// In en, this message translates to:
  /// **'Batch queue is ready'**
  String get batchReady;

  /// Message when batch completes
  ///
  /// In en, this message translates to:
  /// **'Batch conversion completed'**
  String get batchDone;

  /// Message when no batch files are selected
  ///
  /// In en, this message translates to:
  /// **'No files selected for batch conversion'**
  String get noBatchFiles;

  /// Label for file count in progress
  ///
  /// In en, this message translates to:
  /// **'files'**
  String get progressFiles;

  /// Title for batch mode
  ///
  /// In en, this message translates to:
  /// **'Batch conversion'**
  String get batchModeTitle;

  /// Subtitle explaining batch mode
  ///
  /// In en, this message translates to:
  /// **'Choose target format, then convert all files. Single-file view is hidden in this mode.'**
  String get batchModeSubtitle;

  /// Label for total in batch summary
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get batchSummaryTotal;

  /// Label for done in batch summary
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get batchSummaryDone;

  /// Label for failed in batch summary
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get batchSummaryFailed;

  /// Label for queued in batch summary
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get batchSummaryQueued;

  /// Confirmation when all saves succeeded
  ///
  /// In en, this message translates to:
  /// **'Save all successful'**
  String get saveAllSuccessful;

  /// Status shown when saving all files
  ///
  /// In en, this message translates to:
  /// **'Saving files...'**
  String get batchSaveAllStarting;

  /// No description provided for @batchSaveAllProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Saving {current}/{total}'**
  String batchSaveAllProgressLabel(int current, int total);

  /// No description provided for @retryFailed.
  ///
  /// In en, this message translates to:
  /// **'Retry failed'**
  String get retryFailed;

  /// No description provided for @clearCompleted.
  ///
  /// In en, this message translates to:
  /// **'Clear completed'**
  String get clearCompleted;

  /// No description provided for @clearCompletedTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove items marked as saved from this list'**
  String get clearCompletedTooltip;

  /// No description provided for @clearBatchQueue.
  ///
  /// In en, this message translates to:
  /// **'Clear queue'**
  String get clearBatchQueue;

  /// No description provided for @batchStatusQueued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get batchStatusQueued;

  /// No description provided for @batchStatusConverting.
  ///
  /// In en, this message translates to:
  /// **'Converting'**
  String get batchStatusConverting;

  /// No description provided for @batchStatusDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get batchStatusDone;

  /// No description provided for @batchStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get batchStatusFailed;

  /// No description provided for @batchStatusSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving'**
  String get batchStatusSaving;

  /// No description provided for @batchStatusSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get batchStatusSaved;

  /// No description provided for @batchStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get batchStatusCancelled;

  /// No description provided for @appNameWebSuffix.
  ///
  /// In en, this message translates to:
  /// **'(Web)'**
  String get appNameWebSuffix;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemLanguage.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemLanguage;

  /// No description provided for @errorDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorDialogTitle;

  /// No description provided for @pickedFileCaption.
  ///
  /// In en, this message translates to:
  /// **'Picked file'**
  String get pickedFileCaption;

  /// No description provided for @keepScreenOn.
  ///
  /// In en, this message translates to:
  /// **'Keep screen on'**
  String get keepScreenOn;

  /// No description provided for @keepScreenOnTooltip.
  ///
  /// In en, this message translates to:
  /// **'Prevent the device display from turning off while the app is active.'**
  String get keepScreenOnTooltip;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bg',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fi',
    'fr',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nb',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sr',
    'sv',
    'th',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
