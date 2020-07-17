QT -= gui
QT += network

CONFIG += c++11

TARGET = spyder
TEMPLATE = lib

DEFINES += SPYDER_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    Shared.h \
    SpyderDevice.h
	
SOURCES += \
    SpyderDevice.cpp
