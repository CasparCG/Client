#include "DataTreeBaseWidget.h"

#include <QtCore/QMimeData>

#include <QtGui/QApplication>
#include <QtGui/QTreeWidgetItem>

DataTreeBaseWidget::DataTreeBaseWidget(QWidget* parent)
    : QTreeWidget(parent)
{
}

void DataTreeBaseWidget::mousePressEvent(QMouseEvent* event)
{
    if (event->button() == Qt::LeftButton)
        dragStartPosition = event->pos();

    QTreeWidget::mousePressEvent(event);
}

void DataTreeBaseWidget::mouseMoveEvent(QMouseEvent* event)
{
    if (!(event->buttons() & Qt::LeftButton))
             return;

    if ((event->pos() - dragStartPosition).manhattanLength() < qApp->startDragDistance())
         return;

    QMimeData* mimeData = new QMimeData();
    mimeData->setData("application/library-dataitem", QString("<%1>,%2").arg(this->objectName())
                                                                .arg(QTreeWidget::selectedItems().at(0)->text(2)).toUtf8());

    QDrag* drag = new QDrag(this);
    drag->setMimeData(mimeData);

    drag->exec(Qt::CopyAction);
}
