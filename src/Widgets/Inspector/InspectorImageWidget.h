#pragma once

#include "../Shared.h"
#include "ui_InspectorImageWidget.h"

#include "Commands/ImageCommand.h"
#include "Events/Rundown/RundownItemSelectedEvent.h"
#include "Models/LibraryModel.h"

#include <QtCore/QEvent>
#include <QtCore/QObject>
#include <QtCore/QString>

#include <QtGui/QWidget>

class WIDGETS_EXPORT InspectorImageWidget : public QWidget, Ui::InspectorImageWidget
{
    Q_OBJECT

    public:
        explicit InspectorImageWidget(QWidget* parent = 0);

    private:
        LibraryModel* model;
        ImageCommand* command;

        void loadDirection();
        void loadTransition();
        void loadTween();
        void blockAllSignals(bool block);

        Q_SLOT void transitionChanged(QString);
        Q_SLOT void durationChanged(int);
        Q_SLOT void directionChanged(QString);
        Q_SLOT void tweenChanged(QString);
        Q_SLOT void useAutoChanged(int);
        Q_SLOT void triggerOnNextChanged(int);
        Q_SLOT void resetTransition(QString);
        Q_SLOT void resetDuration(QString);
        Q_SLOT void resetDirection(QString);
        Q_SLOT void resetTween(QString);
        Q_SLOT void resetTriggerOnNext(QString);
        Q_SLOT void resetUseAuto(QString);
        Q_SLOT void rundownItemSelected(const RundownItemSelectedEvent&);
};
