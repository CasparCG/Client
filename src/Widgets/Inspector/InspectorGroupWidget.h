#pragma once

#include "../Shared.h"
#include "ui_InspectorGroupWidget.h"

#include "Commands/GroupCommand.h"
#include "Models/LibraryModel.h"

#include <QtCore/QEvent>
#include <QtCore/QObject>

#include <QtGui/QWidget>

class WIDGETS_EXPORT InspectorGroupWidget : public QWidget, Ui::InspectorGroupWidget
{
    Q_OBJECT

    public:
        explicit InspectorGroupWidget(QWidget* parent = 0);

    protected:
        virtual bool eventFilter(QObject* target, QEvent* event);

    private:
        LibraryModel* model;
        GroupCommand* command;
        bool disableVideoProgress;

        void blockAllSignals(bool block);

        Q_SLOT void notesChanged();
        Q_SLOT void resetNotes(QString);
        Q_SLOT void autoStepChanged(int);
        Q_SLOT void resetAutoStep(QString);
        Q_SLOT void autoPlayChanged(int);
};
