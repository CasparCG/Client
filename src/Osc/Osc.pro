QT += core network websockets

CONFIG += c++11

TARGET = osc
TEMPLATE = lib

DEFINES += OSC_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    Shared.h \
    OscThread.h \
    OscSender.h \
    OscWebSocketListener.h \
    OscControlListener.h \
    OscMonitorListener.h

SOURCES += \
    OscThread.cpp \
    OscSender.cpp \
    OscWebSocketListener.cpp \
    OscControlListener.cpp \
    OscMonitorListener.cpp

CONFIG(system-boost) {
    LIBS += -lboost_date_time -lboost_system -lboost_thread -lboost_filesystem -lboost_chrono
} else {
    DEPENDPATH += $$PWD/../../lib/boost
    INCLUDEPATH += $$PWD/../../lib/boost
    win32:LIBS += -L$$PWD/../../lib/boost/stage/lib/win32/ -lboost_date_time-mgw73-mt-1_57 -lboost_system-mgw73-mt-1_57 -lboost_thread-mgw73-mt-1_57 -lboost_filesystem-mgw73-mt-1_57 -lboost_chrono-mgw73-mt-1_57 -lws2_32
    else:macx:LIBS += -L$$PWD/../../lib/boost/stage/lib/macx/ -lboost_date_time -lboost_system -lboost_thread -lboost_filesystem -lboost_chrono
    else:unix:LIBS += -L$$PWD/../../lib/boost/stage/lib/linux/ -lboost_date_time-gcc-mt-1_57 -lboost_system-gcc-mt-1_57 -lboost_thread-gcc-mt-1_57 -lboost_filesystem-gcc-mt-1_57 -lboost_chrono-gcc-mt-1_57
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
