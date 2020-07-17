QT += core sql network widgets

CONFIG += c++11

TARGET = core
TEMPLATE = lib

DEFINES += CORE_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    DatabaseManager.h \
    DeviceManager.h \
    Shared.h \
    Commands/TemplateCommand.h \
    Events/Rundown/AddRudnownItemEvent.h \
    Events/DataChangedEvent.h \
    Events/MediaChangedEvent.h \
    Events/Rundown/RundownItemSelectedEvent.h \
    Events/StatusbarEvent.h \
    Events/Inspector/TemplateChangedEvent.h \
    Models/ConfigurationModel.h \
    Models/DeviceModel.h \
    Models/LibraryModel.h \
    Models/RundownModel.h \
    Models/TypeModel.h \
    Events/Library/LibraryItemSelectedEvent.h \
    Commands/BrightnessCommand.h \
    Commands/SaturationCommand.h \
    Commands/OpacityCommand.h \
    Commands/ContrastCommand.h \
    Commands/VolumeCommand.h \
    Commands/LevelsCommand.h \
    Commands/KeyerCommand.h \
    Commands/GridCommand.h \
    Events/ConnectionStateChangedEvent.h \
    Commands/GpiOutputCommand.h \
    GpiManager.h \
    Models/GpiModel.h \
    Commands/DeckLinkInputCommand.h \
    Models/FormatModel.h \
    Models/TransitionModel.h \
    Models/DirectionModel.h \
    Models/TweenModel.h \
    Models/GpiPortModel.h \
    Models/GpoPortModel.h \
    Commands/CommitCommand.h \
    Commands/ImageScrollerCommand.h \
    Commands/FileRecorderCommand.h \
    Commands/GroupCommand.h \
    Events/Rundown/OpenRundownEvent.h \
    Commands/BlendModeCommand.h \
    Models/BlendModeModel.h \
    Events/Rundown/SaveRundownEvent.h \
    LibraryManager.h \
    Events/Library/RefreshLibraryEvent.h \
    Events/Library/AutoRefreshLibraryEvent.h \
    Events/Rundown/CompactViewEvent.h \
    Commands/SeparatorCommand.h \
    Commands/PrintCommand.h \
    Commands/AbstractCommand.h \
    Commands/AbstractProperties.h \
    Commands/AbstractPlayoutCommand.h \
    Commands/ClearOutputCommand.h \
    Animations/ActiveAnimation.h \
    Models/ThumbnailModel.h \
    ThumbnailWorker.h \
    Commands/AudioCommand.h \
    Commands/SolidColorCommand.h \
    Events/Inspector/DeviceChangedEvent.h \
    Events/Inspector/LabelChangedEvent.h \
    Events/Inspector/TargetChangedEvent.h \
    Events/PreviewEvent.h \
    EventManager.h \
    Events/Rundown/EmptyRundownEvent.h \
    Events/Rundown/NewRundownMenuEvent.h \
    Events/Rundown/NewRundownEvent.h \
    Events/Rundown/DeleteRundownEvent.h \
    Events/Rundown/ActiveRundownChangedEvent.h \
    Events/Inspector/ChannelChangedEvent.h \
    Models/PresetModel.h \
    Events/PresetChangedEvent.h \
    Events/AddPresetItemEvent.h \
    Events/ImportPresetEvent.h \
    Events/ExportPresetEvent.h \
    Commands/CustomCommand.h \
    OscSubscription.h \
    Events/Inspector/VideolayerChangedEvent.h \
    Models/OscFileModel.h \
    Events/Inspector/AddTemplateDataEvent.h \
    Events/Action/AddActionItemEvent.h \
    Commands/ChromaCommand.h \
    Models/ChromaModel.h \
    Events/Rundown/AutoPlayRundownItemEvent.h \
    Events/Inspector/AutoPlayChangedEvent.h \
    Events/Rundown/AutoPlayNextRundownItemEvent.h \
    Models/TriCaster/TriCasterInputModel.h \
    Models/TriCaster/TriCasterStepModel.h \
    Commands/TriCaster/TakeCommand.h \
    Commands/TriCaster/AutoCommand.h \
    Models/TriCaster/TriCasterAutoTransitionModel.h \
    Models/TriCaster/TriCasterAutoSpeedModel.h \
    Models/TriCaster/TriCasterPresetModel.h \
    Commands/TriCaster/PresetCommand.h \
    Commands/TriCaster/InputCommand.h \
    Models/TriCaster/TriCasterSwitcherModel.h \
    Models/TriCaster/TriCasterSourceModel.h \
    Models/TriCaster/TriCasterDeviceModel.h \
    OscDeviceManager.h \
    TriCasterDeviceManager.h \
    Events/Rundown/ExecuteRundownItemEvent.h \
    Commands/TriCaster/NetworkSourceCommand.h \
    Models/TriCaster/TriCasterNetworkTargetModel.h \
    Commands/TriCaster/MacroCommand.h \
    Models/OscOutputModel.h \
    Commands/OscOutputCommand.h \
    Events/OscOutputChangedEvent.h \
    Models/TriCaster/TriCasterProductModel.h \
    Events/SaveAsPresetEvent.h \
    Events/Rundown/CloseRundownEvent.h \
    Events/Rundown/AllowRemoteTriggeringMenuEvent.h \
    Events/Rundown/ExecutePlayoutCommandEvent.h \
    Events/Rundown/OpenRundownMenuEvent.h \
    Events/Rundown/RemoveItemFromAutoPlayQueueEvent.h \
    Models/Atem/AtemDeviceModel.h \
    Events/Atem/AtemDeviceChangedEvent.h \
    Events/TriCaster/TriCasterDeviceChangedEvent.h \
    AtemDeviceManager.h \
    Commands/Atem/AtemInputCommand.h \
    Commands/Atem/AtemAutoCommand.h \
    Models/Atem/AtemSwitcherModel.h \
    Models/Atem/AtemStepModel.h \
    Commands/Atem/AtemCutCommand.h \
    Models/Atem/AtemAutoTransitionModel.h \
    Models/Atem/AtemAutoSpeedModel.h \
    Commands/Atem/AtemKeyerStateCommand.h \
    Models/Atem/AtemVideoFormatModel.h \
    Commands/Atem/AtemVideoFormatCommand.h \
    Models/Atem/AtemAudioInputModel.h \
    Models/Atem/AtemAudioInputStateModel.h \
    Commands/Atem/AtemAudioInputStateCommand.h \
    Commands/Atem/AtemAudioInputBalanceCommand.h \
    Commands/Atem/AtemAudioGainCommand.h \
    Events/Rundown/OpenRundownFromUrlEvent.h \
    Events/Rundown/OpenRundownFromUrlMenuEvent.h \
    Events/Rundown/ReloadRundownEvent.h \
    Models/Atem/AtemKeyerModel.h \
    Events/Inspector/ShowAddTemplateDataDialogEvent.h \
    Events/Rundown/MarkItemAsUsedEvent.h \
    Events/Rundown/MarkItemAsUnusedEvent.h \
    Events/Rundown/MarkAllItemsAsUsedEvent.h \
    Events/Rundown/MarkAllItemsAsUnusedEvent.h \
    Commands/PlayoutCommand.h \
    Events/CloseApplicationEvent.h \
    Commands/FadeToBlackCommand.h \
    Events/Rundown/PasteItemPropertiesEvent.h \
    Events/Rundown/CopyItemPropertiesEvent.h \
    Events/Library/LibraryFilterChangedEvent.h \
    Events/ExportPresetMenuEvent.h \
    Events/SaveAsPresetMenuEvent.h \
    Events/ToggleFullscreenEvent.h \
    Events/Rundown/SaveMenuEvent.h \
    Events/Rundown/SaveAsMenuEvent.h \
    Events/Rundown/AllowRemoteTriggeringEvent.h \
    Events/Rundown/RepositoryRundownEvent.h \
    Models/RepositoryChangeModel.h \
    Events/Rundown/InsertRepositoryChangesEvent.h \
    Events/Rundown/ReloadRundownMenuEvent.h \
    Events/DurationChangedEvent.h \
    Commands/Panasonic/PanasonicPresetCommand.h \
    Commands/PerspectiveCommand.h \
    Commands/RotationCommand.h \
    Commands/AnchorCommand.h \
    Commands/MovieCommand.h \
    Commands/StillCommand.h \
    Commands/FillCommand.h \
    Commands/ClipCommand.h \
    Commands/CropCommand.h \
    Commands/HttpGetCommand.h \
    Models/KeyValueModel.h \
    Events/Inspector/ShowAddHttpGetDataDialogEvent.h \
    Commands/HttpPostCommand.h \
    Events/Inspector/ShowAddHttpPostDataDialogEvent.h \
    Commands/ResetCommand.h \
    Commands/HtmlCommand.h \
    Commands/RouteChannelCommand.h \
    Commands/RouteVideolayerCommand.h \
    Commands/Sony/SonyPresetCommand.h \
    Models/Atem/AtemMixerStepModel.h \
    Commands/Spyder/SpyderPresetCommand.h \
    Events/Rundown/ClearCurrentPlayingItemEvent.h \
    Events/Rundown/CurrentItemChangedEvent.h \
    Commands/Atem/AtemMacroCommand.h \
    OscWebSocketManager.h \
    Commands/Atem/AtemFadeToBlackCommand.h

SOURCES += \
    DatabaseManager.cpp \
    DeviceManager.cpp \
    Commands/TemplateCommand.cpp \
    Events/Rundown/AddRudnownItemEvent.cpp \
    Events/DataChangedEvent.cpp \
    Events/MediaChangedEvent.cpp \
    Events/Rundown/RundownItemSelectedEvent.cpp \
    Events/StatusbarEvent.cpp \
    Events/Inspector/TemplateChangedEvent.cpp \
    Models/ConfigurationModel.cpp \
    Models/DeviceModel.cpp \
    Models/LibraryModel.cpp \
    Models/RundownModel.cpp \
    Models/TypeModel.cpp \
    Events/Library/LibraryItemSelectedEvent.cpp \
    Commands/BrightnessCommand.cpp \
    Commands/SaturationCommand.cpp \
    Commands/OpacityCommand.cpp \
    Commands/ContrastCommand.cpp \
    Commands/VolumeCommand.cpp \
    Commands/LevelsCommand.cpp \
    Commands/KeyerCommand.cpp \
    Commands/GridCommand.cpp \
    Events/ConnectionStateChangedEvent.cpp \
    Commands/GpiOutputCommand.cpp \
    GpiManager.cpp \
    Models/GpiModel.cpp \
    Commands/DeckLinkInputCommand.cpp \
    Models/FormatModel.cpp \
    Models/TransitionModel.cpp \
    Models/DirectionModel.cpp \
    Models/TweenModel.cpp \
    Models/GpiPortModel.cpp \
    Models/GpoPortModel.cpp \
    Commands/CommitCommand.cpp \
    Commands/ImageScrollerCommand.cpp \
    Commands/FileRecorderCommand.cpp \
    Commands/GroupCommand.cpp \
    Events/Rundown/OpenRundownEvent.cpp \
    Models/BlendModeModel.cpp \
    Commands/BlendModeCommand.cpp \
    Events/Rundown/SaveRundownEvent.cpp \
    LibraryManager.cpp \
    Events/Library/AutoRefreshLibraryEvent.cpp \
    Events/Library/RefreshLibraryEvent.cpp \
    Events/Rundown/CompactViewEvent.cpp \
    Commands/SeparatorCommand.cpp \
    Commands/PrintCommand.cpp \
    Commands/AbstractCommand.cpp \
    Commands/ClearOutputCommand.cpp \
    Commands/AbstractPlayoutCommand.cpp \
    Commands/AbstractProperties.cpp \
    Animations/ActiveAnimation.cpp \
    Models/ThumbnailModel.cpp \
    ThumbnailWorker.cpp \
    Commands/AudioCommand.cpp \
    Commands/SolidColorCommand.cpp \
    Events/Inspector/DeviceChangedEvent.cpp \
    Events/Inspector/LabelChangedEvent.cpp \
    Events/Inspector/TargetChangedEvent.cpp \
    Events/PreviewEvent.cpp \
    EventManager.cpp \
    Events/Rundown/EmptyRundownEvent.cpp \
    Events/Rundown/NewRundownMenuEvent.cpp \
    Events/Rundown/NewRundownEvent.cpp \
    Events/Rundown/DeleteRundownEvent.cpp \
    Events/Rundown/ActiveRundownChangedEvent.cpp \
    Events/Inspector/ChannelChangedEvent.cpp \
    Models/PresetModel.cpp \
    Events/PresetChangedEvent.cpp \
    Events/AddPresetItemEvent.cpp \
    Events/ImportPresetEvent.cpp \
    Events/ExportPresetEvent.cpp \
    Commands/CustomCommand.cpp \
    OscSubscription.cpp \
    Events/Inspector/VideolayerChangedEvent.cpp \
    Models/OscFileModel.cpp \
    Events/Inspector/AddTemplateDataEvent.cpp \
    Events/Action/AddActionItemEvent.cpp \
    Commands/ChromaCommand.cpp \
    Models/ChromaModel.cpp \
    Events/Rundown/AutoPlayRundownItemEvent.cpp \
    Events/Inspector/AutoPlayChangedEvent.cpp \
    Events/Rundown/AutoPlayNextRundownItemEvent.cpp \
    Models/TriCaster/TriCasterInputModel.cpp \
    Models/TriCaster/TriCasterStepModel.cpp \
    Commands/TriCaster/TakeCommand.cpp \
    Commands/TriCaster/AutoCommand.cpp \
    Models/TriCaster/TriCasterAutoTransitionModel.cpp \
    Models/TriCaster/TriCasterAutoSpeedModel.cpp \
    Models/TriCaster/TriCasterPresetModel.cpp \
    Commands/TriCaster/PresetCommand.cpp \
    Commands/TriCaster/InputCommand.cpp \
    Models/TriCaster/TriCasterSwitcherModel.cpp \
    Models/TriCaster/TriCasterSourceModel.cpp \
    Models/TriCaster/TriCasterDeviceModel.cpp \
    OscDeviceManager.cpp \
    TriCasterDeviceManager.cpp \
    Events/Rundown/ExecuteRundownItemEvent.cpp \
    Commands/TriCaster/NetworkSourceCommand.cpp \
    Models/TriCaster/TriCasterNetworkTargetModel.cpp \
    Commands/TriCaster/MacroCommand.cpp \
    Models/OscOutputModel.cpp \
    Commands/OscOutputCommand.cpp \
    Events/OscOutputChangedEvent.cpp \
    Models/TriCaster/TriCasterProductModel.cpp \
    Events/SaveAsPresetEvent.cpp \
    Events/Rundown/CloseRundownEvent.cpp \
    Events/Rundown/AllowRemoteTriggeringMenuEvent.cpp \
    Events/Rundown/ExecutePlayoutCommandEvent.cpp \
    Events/Rundown/OpenRundownMenuEvent.cpp \
    Events/Rundown/RemoveItemFromAutoPlayQueueEvent.cpp \
    Models/Atem/AtemDeviceModel.cpp \
    Events/Atem/AtemDeviceChangedEvent.cpp \
    Events/TriCaster/TriCasterDeviceChangedEvent.cpp \
    AtemDeviceManager.cpp \
    Commands/Atem/AtemInputCommand.cpp \
    Commands/Atem/AtemAutoCommand.cpp \
    Models/Atem/AtemSwitcherModel.cpp \
    Models/Atem/AtemStepModel.cpp \
    Commands/Atem/AtemCutCommand.cpp \
    Models/Atem/AtemAutoTransitionModel.cpp \
    Models/Atem/AtemAutoSpeedModel.cpp \
    Commands/Atem/AtemKeyerStateCommand.cpp \
    Models/Atem/AtemVideoFormatModel.cpp \
    Commands/Atem/AtemVideoFormatCommand.cpp \
    Models/Atem/AtemAudioInputModel.cpp \
    Models/Atem/AtemAudioInputStateModel.cpp \
    Commands/Atem/AtemAudioInputStateCommand.cpp \
    Commands/Atem/AtemAudioInputBalanceCommand.cpp \
    Commands/Atem/AtemAudioGainCommand.cpp \
    Events/Rundown/OpenRundownFromUrlEvent.cpp \
    Events/Rundown/OpenRundownFromUrlMenuEvent.cpp \
    Events/Rundown/ReloadRundownEvent.cpp \
    Models/Atem/AtemKeyerModel.cpp \
    Events/Inspector/ShowAddTemplateDataDialogEvent.cpp \
    Events/Rundown/MarkItemAsUsedEvent.cpp \
    Events/Rundown/MarkItemAsUnusedEvent.cpp \
    Events/Rundown/MarkAllItemsAsUsedEvent.cpp \
    Events/Rundown/MarkAllItemsAsUnusedEvent.cpp \
    Commands/PlayoutCommand.cpp \
    Events/CloseApplicationEvent.cpp \
    Commands/FadeToBlackCommand.cpp \
    Events/Rundown/PasteItemPropertiesEvent.cpp \
    Events/Rundown/CopyItemPropertiesEvent.cpp \
    Events/Library/LibraryFilterChangedEvent.cpp \
    Events/ExportPresetMenuEvent.cpp \
    Events/SaveAsPresetMenuEvent.cpp \
    Events/ToggleFullscreenEvent.cpp \
    Events/Rundown/SaveMenuEvent.cpp \
    Events/Rundown/SaveAsMenuEvent.cpp \
    Events/Rundown/AllowRemoteTriggeringEvent.cpp \
    Events/Rundown/RepositoryRundownEvent.cpp \
    Models/RepositoryChangeModel.cpp \
    Events/Rundown/InsertRepositoryChangesEvent.cpp \
    Events/Rundown/ReloadRundownMenuEvent.cpp \
    Events/DurationChangedEvent.cpp \
    Commands/Panasonic/PanasonicPresetCommand.cpp \
    Commands/PerspectiveCommand.cpp \
    Commands/RotationCommand.cpp \
    Commands/AnchorCommand.cpp \
    Commands/MovieCommand.cpp \
    Commands/StillCommand.cpp \
    Commands/FillCommand.cpp \
    Commands/ClipCommand.cpp \
    Commands/CropCommand.cpp \
    Commands/HttpGetCommand.cpp \
    Models/KeyValueModel.cpp \
    Events/Inspector/ShowAddHttpGetDataDialogEvent.cpp \
    Commands/HttpPostCommand.cpp \
    Events/Inspector/ShowAddHttpPostDataDialogEvent.cpp \
    Commands/ResetCommand.cpp \
    Commands/HtmlCommand.cpp \
    Commands/RouteChannelCommand.cpp \
    Commands/RouteVideolayerCommand.cpp \
    Commands/Sony/SonyPresetCommand.cpp \
    Models/Atem/AtemMixerStepModel.cpp \
    Commands/Spyder/SpyderPresetCommand.cpp \
    Events/Rundown/ClearCurrentPlayingItemEvent.cpp \
    Events/Rundown/CurrentItemChangedEvent.cpp \
    Commands/Atem/AtemMacroCommand.cpp \
    OscWebSocketManager.cpp \
    Commands/Atem/AtemFadeToBlackCommand.cpp

DISTFILES += \
    Sql/Schema.sql \
    Sql/ChangeScript-208.sql \
    Sql/ChangeScript-209.sql \
    Sql/ChangeScript-210.sql \
    Sql/ChangeScript-211.sql \
    Sql/ChangeScript-212.sql \
    Sql/ChangeScript-213.sql \
    Sql/ChangeScript-214.sql \
    Sql/ChangeScript-215.sql \
    Sql/ChangeScript-216.sql

RESOURCES += \
    Core.qrc

CONFIG(system-libqatemcontrol) {
    LIBS += -lqatemcontrol
} else {
    DEPENDPATH += $$PWD/../../lib/qatemcontrol/include
    INCLUDEPATH += $$PWD/../../lib/qatemcontrol/include
    win32:CONFIG(release, debug|release):LIBS += -L$$PWD/../../lib/qatemcontrol/lib/win32/release/ -lqatemcontrol
    else:win32:CONFIG(debug, debug|release):LIBS += -L$$PWD/../../lib/qatemcontrol/lib/win32/debug/ -lqatemcontrol
    else:macx:CONFIG(release, debug|release):LIBS += -L$$PWD/../../lib/qatemcontrol/lib/macx/release/ -lqatemcontrol
    else:macx:CONFIG(debug, debug|release):LIBS += -L$$PWD/../../lib/qatemcontrol/lib/macx/debug/ -lqatemcontrol
    else:unix:CONFIG(release, debug|release):LIBS += -L$$PWD/../../lib/qatemcontrol/lib/linux/release/ -lqatemcontrol
    else:unix:CONFIG(debug, debug|release):LIBS += -L$$PWD/../../lib/qatemcontrol/lib/linux/debug/ -lqatemcontrol
}

CONFIG(system-oscpack) {
    LIBS += -loscpack
} else {
    DEPENDPATH += $$PWD/../../lib/oscpack/include
    INCLUDEPATH += $$PWD/../../lib/oscpack/include
    win32:LIBS += -L$$PWD/../../lib/oscpack/lib/win32/ -loscpack
    else:macx:LIBS += -L$$PWD/../../lib/oscpack/lib/macx/ -loscpack
    else:unix:LIBS += -L$$PWD/../../lib/oscpack/lib/linux/ -loscpack
}

CONFIG(system-boost) {
    LIBS += -lboost_date_time -lboost_system -lboost_thread -lboost_filesystem -lboost_chrono
} else {
    DEPENDPATH += $$PWD/../../lib/boost
    INCLUDEPATH += $$PWD/../../lib/boost
    win32:LIBS += -L$$PWD/../../lib/boost/stage/lib/win32/ -lboost_date_time-mgw73-mt-1_57 -lboost_system-mgw73-mt-1_57 -lboost_thread-mgw73-mt-1_57 -lboost_filesystem-mgw73-mt-1_57 -lboost_chrono-mgw73-mt-1_57 -lws2_32
    else:macx:LIBS += -L$$PWD/../../lib/boost/stage/lib/macx/ -lboost_date_time -lboost_system -lboost_thread -lboost_filesystem -lboost_chrono
    else:unix:LIBS += -L$$PWD/../../lib/boost/stage/lib/linux/ -lboost_date_time-gcc-mt-1_57 -lboost_system-gcc-mt-1_57 -lboost_thread-gcc-mt-1_57 -lboost_filesystem-gcc-mt-1_57 -lboost_chrono-gcc-mt-1_57
}

CONFIG(system-gpio-client) {
    LIBS += -lgpio-client
} else {
    DEPENDPATH += $$PWD/../../lib/gpio-client/include
    INCLUDEPATH += $$PWD/../../lib/gpio-client/include
    win32:LIBS += -L$$PWD/../../lib/gpio-client/lib/win32/ -lgpio-client
    else:macx:LIBS += -L$$PWD/../../lib/gpio-client/lib/macx/ -lgpio-client
    else:unix:LIBS += -L$$PWD/../../lib/gpio-client/lib/linux/ -lgpio-client
}

DEPENDPATH += $$OUT_PWD/../Atem $$PWD/../Atem
INCLUDEPATH += $$OUT_PWD/../Atem $$PWD/../Atem
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Atem/release/ -latem
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Atem/debug/ -latem
else:macx:LIBS += -L$$OUT_PWD/../Atem/ -latem
else:unix:LIBS += -L$$OUT_PWD/../Atem/ -latem

DEPENDPATH += $$OUT_PWD/../Caspar $$PWD/../Caspar
INCLUDEPATH += $$OUT_PWD/../Caspar $$PWD/../Caspar
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Caspar/release/ -lcaspar
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Caspar/debug/ -lcaspar
else:macx:LIBS += -L$$OUT_PWD/../Caspar/ -lcaspar
else:unix:LIBS += -L$$OUT_PWD/../Caspar/ -lcaspar

DEPENDPATH += $$OUT_PWD/../TriCaster $$PWD/../TriCaster
INCLUDEPATH += $$OUT_PWD/../TriCaster $$PWD/../TriCaster
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../TriCaster/release/ -ltricaster
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../TriCaster/debug/ -ltricaster
else:macx:LIBS += -L$$OUT_PWD/../TriCaster/ -ltricaster
else:unix:LIBS += -L$$OUT_PWD/../TriCaster/ -ltricaster

DEPENDPATH += $$OUT_PWD/../Osc $$PWD/../Osc
INCLUDEPATH += $$OUT_PWD/../Osc $$PWD/../Osc
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Osc/release/ -losc
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Osc/debug/ -losc
else:macx:LIBS += -L$$OUT_PWD/../Osc/ -losc
else:unix:LIBS += -L$$OUT_PWD/../Osc/ -losc

DEPENDPATH += $$OUT_PWD/../Gpi $$PWD/../Gpi
INCLUDEPATH += $$OUT_PWD/../Gpi $$PWD/../Gpi
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Gpi/release/ -lgpi
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Gpi/debug/ -lgpi
else:macx:LIBS += -L$$OUT_PWD/../Gpi/ -lgpi
else:unix:LIBS += -L$$OUT_PWD/../Gpi/ -lgpi

DEPENDPATH += $$OUT_PWD/../Common $$PWD/../Common
INCLUDEPATH += $$OUT_PWD/../Common $$PWD/../Common
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Common/release/ -lcommon
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Common/debug/ -lcommon
else:macx:LIBS += -L$$OUT_PWD/../Common/ -lcommon
else:unix:LIBS += -L$$OUT_PWD/../Common/ -lcommon
