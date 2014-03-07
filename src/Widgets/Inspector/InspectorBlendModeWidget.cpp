#include "InspectorBlendModeWidget.h"

#include "Global.h"

#include "DatabaseManager.h"
#include "EventManager.h"
#include "Events/PreviewEvent.h"
#include "Events/Rundown/RundownItemSelectedEvent.h"
#include "Models/BlendModeModel.h"

#include <QtGui/QApplication>

InspectorBlendModeWidget::InspectorBlendModeWidget(QWidget* parent)
    : QWidget(parent),
      model(NULL), command(NULL)
{
    setupUi(this);

    loadBlendMode();

    qApp->installEventFilter(this);
}

bool InspectorBlendModeWidget::eventFilter(QObject* target, QEvent* event)
{
    if (event->type() == static_cast<QEvent::Type>(Event::EventType::RundownItemSelected))
    {
        RundownItemSelectedEvent* rundownItemSelectedEvent = dynamic_cast<RundownItemSelectedEvent*>(event);
        this->model = rundownItemSelectedEvent->getLibraryModel();

        blockAllSignals(true);

        if (dynamic_cast<BlendModeCommand*>(rundownItemSelectedEvent->getCommand()))
        {  
            this->command = dynamic_cast<BlendModeCommand*>(rundownItemSelectedEvent->getCommand());

            this->comboBoxBlendMode->setCurrentIndex(this->comboBoxBlendMode->findText(this->command->getBlendMode()));
        }

        blockAllSignals(false);
    }

    return QObject::eventFilter(target, event);
}

void InspectorBlendModeWidget::blockAllSignals(bool block)
{
    this->comboBoxBlendMode->blockSignals(block);
}

void InspectorBlendModeWidget::loadBlendMode()
{
    // We do not have a command object, block the signals.
    // Events will not be triggered while we update the values.
    this->comboBoxBlendMode->blockSignals(true);

    QList<BlendModeModel> models = DatabaseManager::getInstance().getBlendMode();
    foreach (BlendModeModel model, models)
        this->comboBoxBlendMode->addItem(model.getValue());

    this->comboBoxBlendMode->blockSignals(false);
}

void InspectorBlendModeWidget::blendModeChanged(QString blendMode)
{
    this->command->setBlendMode(blendMode);

    EventManager::getInstance().firePreviewEvent(PreviewEvent());
}

void InspectorBlendModeWidget::resetBlendMode(QString blendMode)
{
    this->comboBoxBlendMode->setCurrentIndex(this->comboBoxBlendMode->findText("Normal"));
    this->command->setBlendMode(this->comboBoxBlendMode->currentText());

    EventManager::getInstance().firePreviewEvent(PreviewEvent());
}
