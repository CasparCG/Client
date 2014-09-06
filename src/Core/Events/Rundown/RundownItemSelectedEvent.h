#pragma once

#include "../../Shared.h"
#include "../../Commands/AbstractCommand.h"
#include "../../Models/LibraryModel.h"

#include <QtCore/QSharedPointer>

#if QT_VERSION >= 0x050000
#include <QtWidgets/QWidget>
#else
#include <QtGui/QWidget>
#endif

class CORE_EXPORT RundownItemSelectedEvent
{
    public:
        explicit RundownItemSelectedEvent(AbstractCommand* command, LibraryModel* model, QWidget* source = NULL, QWidget* parent = NULL);

        AbstractCommand* getCommand() const;
        LibraryModel* getLibraryModel() const;
        QWidget* getSource() const;
        QWidget* getParent() const;

    private:
        AbstractCommand* command;
        LibraryModel* model;
        QWidget* source;
        QWidget* parent;
};
