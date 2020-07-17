#-------------------------------------------------
#
# Project created by QtCreator 2011-04-07T13:50:44
#
#-------------------------------------------------

QT += core gui sql network widgets

CONFIG += c++11

TARGET = shell
TEMPLATE = app

DEFINES += _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    Application.h \
    Mac/AppNap.h

SOURCES += \
    Main.cpp \
    Application.cpp

OBJECTIVE_SOURCES += \
    Mac/AppNap.mm

FORMS += \

RESOURCES += \
    Shell.qrc

OTHER_FILES += \
    Images/CasparCG.ico \
    Images/CasparCG.icns \
    Windows.rc \
    Fonts/OpenSans-SemiboldItalic.ttf \
    Fonts/OpenSans-Semibold.ttf \
    Fonts/OpenSans-Regular.ttf \
    Fonts/OpenSans-LightItalic.ttf \
    Fonts/OpenSans-Light.ttf \
    Fonts/OpenSans-Italic.ttf \
    Fonts/OpenSans-ExtraBoldItalic.ttf \
    Fonts/OpenSans-ExtraBold.ttf \
    Fonts/OpenSans-BoldItalic.ttf \
    Fonts/OpenSans-Bold.ttf

win32:RC_FILE = Windows.rc
else:macx:ICON = Images/CasparCG.icns

macx:LIBS += -framework Foundation

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

CONFIG(system-libvlc) {
    LIBS += -lvlc -lvlccore
} else {
    DEPENDPATH += $$PWD/../../lib/libvlc/include
    INCLUDEPATH += $$PWD/../../lib/libvlc/include
    win32:LIBS += -L$$PWD/../../lib/libvlc/lib/win32/ -lvlc -lvlccore
    else:macx:LIBS += -L$$PWD/../../lib/libvlc/lib/macx/ -lvlc -lvlccore
    else:unix:LIBS += -lvlc -lvlccore
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

DEPENDPATH += $$OUT_PWD/../Panasonic $$PWD/../Panasonic
INCLUDEPATH += $$OUT_PWD/../Panasonic $$PWD/../Panasonic
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Panasonic/release/ -lpanasonic
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Panasonic/debug/ -lpanasonic
else:macx:LIBS += -L$$OUT_PWD/../Panasonic/ -lpanasonic
else:unix:LIBS += -L$$OUT_PWD/../Panasonic/ -lpanasonic

DEPENDPATH += $$OUT_PWD/../Sony $$PWD/../Sony
INCLUDEPATH += $$OUT_PWD/../Sony $$PWD/../Sony
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Sony/release/ -lsony
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Sony/debug/ -lsony
else:macx:LIBS += -L$$OUT_PWD/../Sony/ -lsony
else:unix:LIBS += -L$$OUT_PWD/../Sony/ -lsony

DEPENDPATH += $$OUT_PWD/../Spyder $$PWD/../Spyder
INCLUDEPATH += $$OUT_PWD/../Spyder $$PWD/../Spyder
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Spyder/release/ -lspyder
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Spyder/debug/ -lspyder
else:macx:LIBS += -L$$OUT_PWD/../Spyder/ -lspyder
else:unix:LIBS += -L$$OUT_PWD/../Spyder/ -lspyder

DEPENDPATH += $$OUT_PWD/../Web $$PWD/../Web
INCLUDEPATH += $$OUT_PWD/../Web $$PWD/../Web
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Web/release/ -lweb
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Web/debug/ -lweb
else:macx:LIBS += -L$$OUT_PWD/../Web/ -lweb
else:unix:LIBS += -L$$OUT_PWD/../Web/ -lweb

DEPENDPATH += $$OUT_PWD/../Osc $$PWD/../Osc
INCLUDEPATH += $$OUT_PWD/../Osc $$PWD/../Osc
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Osc/release/ -losc
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Osc/debug/ -losc
else:macx:LIBS += -L$$OUT_PWD/../Osc/ -losc
else:unix:LIBS += -L$$OUT_PWD/../Osc/ -losc

DEPENDPATH += $$OUT_PWD/../Repository $$PWD/../Repository
INCLUDEPATH += $$OUT_PWD/../Repository $$PWD/../Repository
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Repository/release/ -lrepository
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Repository/debug/ -lrepository
else:macx:LIBS += -L$$OUT_PWD/../Repository/ -lrepository
else:unix:LIBS += -L$$OUT_PWD/../Repository/ -lrepository

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

DEPENDPATH += $$OUT_PWD/../Core $$PWD/../Core
INCLUDEPATH += $$OUT_PWD/../Core $$PWD/../Core
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Core/release/ -lcore
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Core/debug/ -lcore
else:macx:LIBS += -L$$OUT_PWD/../Core/ -lcore
else:unix:LIBS += -L$$OUT_PWD/../Core/ -lcore

DEPENDPATH += $$OUT_PWD/../Widgets $$PWD/../Widgets
INCLUDEPATH += $$OUT_PWD/../Widgets $$PWD/../Widgets
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Widgets/release/ -lwidgets
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Widgets/debug/ -lwidgets
else:macx:LIBS += -L$$OUT_PWD/../Widgets/ -lwidgets
else:unix:LIBS += -L$$OUT_PWD/../Widgets/ -lwidgets
