QT += network

CONFIG += c++11

TARGET = atem
TEMPLATE = lib

DEFINES += ATEM_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    AtemDevice.h \
    Shared.h \
    SwitcherDevice.h

SOURCES += \
    AtemDevice.cpp \
    SwitcherDevice.cpp

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
