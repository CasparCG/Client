QT -= gui
QT += network

CONFIG += c++11

TARGET = panasonic
TEMPLATE = lib

DEFINES += PANASONIC_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    Shared.h \
    PtzDevice.h
	
SOURCES += \
    PtzDevice.cpp
