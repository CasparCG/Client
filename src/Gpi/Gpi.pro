QT += core

CONFIG += c++11

TARGET = gpi
TEMPLATE = lib

DEFINES += GPI_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    GpiDevice.h \
    Shared.h

SOURCES += \
    GpiDevice.cpp

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
