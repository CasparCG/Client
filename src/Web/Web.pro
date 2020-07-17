QT -= gui
QT += network

CONFIG += c++11

TARGET = web
TEMPLATE = lib

DEFINES += WEB_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    Shared.h \
    HttpRequest.h
	
SOURCES += \
    HttpRequest.cpp
