QT -= gui
QT += network

CONFIG += c++11

TARGET = repository
TEMPLATE = lib

DEFINES += REPOSITORY_LIBRARY _GLIBCXX_USE_CXX11_ABI=0 QT_COMPILING_QSTRING_COMPAT_CPP

HEADERS += \
    Shared.h \
    RepositoryDevice.h \
    RrupDevice.h \
    Models/RepositoryChangeModel.h
	
SOURCES += \
    RepositoryDevice.cpp \
    RrupDevice.cpp \
    Models/RepositoryChangeModel.cpp
