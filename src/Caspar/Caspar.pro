QT -= gui
QT += network

CONFIG += c++11

TARGET = caspar
TEMPLATE = lib

DEFINES += CASPAR_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    CasparDevice.h \
    Shared.h \
    Models/CasparThumbnail.h \
    Models/CasparTemplate.h \
    Models/CasparMedia.h \
    Models/CasparData.h \
    AmcpDevice.h
	
SOURCES += \
    CasparDevice.cpp \
    Models/CasparThumbnail.cpp \
    Models/CasparTemplate.cpp \
    Models/CasparMedia.cpp \
    Models/CasparData.cpp \
    AmcpDevice.cpp

DEPENDPATH += $$OUT_PWD/../Common $$PWD/../Common
INCLUDEPATH += $$OUT_PWD/../Common $$PWD/../Common
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../Common/release/ -lcommon
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../Common/debug/ -lcommon
else:macx:LIBS += -L$$OUT_PWD/../Common/ -lcommon
else:unix:LIBS += -L$$OUT_PWD/../Common/ -lcommon
