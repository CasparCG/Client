#pragma once

#include "../Shared.h"

#include <QtCore/QObject>

#if QT_VERSION >= 0x050000
#include <QtWidgets/QComboBox>
#include <QMouseEvent>
#else
#include <QtGui/QComboBox>
#include <QtGui/QMouseEvent>
#endif

class WIDGETS_EXPORT TargetComboBaseWidget : public QComboBox
{
    Q_OBJECT

    public:
        explicit TargetComboBaseWidget(QWidget* parent = 0);

        const QString& getPreviousText() const;

    protected:
        virtual void mousePressEvent(QMouseEvent* event);

    private:
        QString previousText;
};
