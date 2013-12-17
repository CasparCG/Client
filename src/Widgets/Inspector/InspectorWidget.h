#pragma once

#include "../Shared.h"
#include "ui_InspectorWidget.h"

#include <QtCore/QEvent>
#include <QtCore/QObject>

#include <QtGui/QWidget>

class WIDGETS_EXPORT InspectorWidget : public QWidget, Ui::InspectorWidget
{
    Q_OBJECT

    public:
        explicit InspectorWidget(QWidget* parent = 0);

    protected:
        virtual bool eventFilter(QObject* target, QEvent* event);

    private:
        bool masterVolumeMuted;
        bool disableCommand;

        Q_SLOT void masterVolumeClicked();
        Q_SLOT void toggleExpandItem(QTreeWidgetItem*, int);
        Q_SLOT void disableCommandClicked();
};
