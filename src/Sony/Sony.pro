QT -= gui
QT += network

CONFIG += c++11

TARGET = sony
TEMPLATE = lib

DEFINES += SONY_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    Shared.h \
    ViscaDevice.h
	
SOURCES += \
    ViscaDevice.cpp
