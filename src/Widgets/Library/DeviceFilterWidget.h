#pragma once

#include "../Shared.h"
#include "ui_DeviceFilterWidget.h"

#include "CasparDevice.h"

#include <QtWidgets/QWidget>
#include <QtWidgets/QListWidget>

class WIDGETS_EXPORT DeviceFilterWidget : public QWidget, Ui::DeviceFilterWidget
{
    Q_OBJECT

    public:
        explicit DeviceFilterWidget(QWidget* parent = 0);

        QList<QString> getDeviceFilter();

    protected:
        virtual bool eventFilter(QObject* target, QEvent* event);

    private:
        QListWidget listWidget;

        void blockAllSignals(bool block);

        Q_SLOT void deviceAdded(CasparDevice&);
        Q_SLOT void deviceRemoved();
        Q_SLOT void itemPressed(QListWidgetItem*);
};
