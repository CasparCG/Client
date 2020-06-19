#include "InspectorAtemAudioInputStateWidget.h"

#include "Global.h"

#include "AtemDeviceManager.h"
#include "DatabaseManager.h"
#include "EventManager.h"
#include "Models/Atem/AtemAudioInputModel.h"

#include <QtWidgets/QApplication>

InspectorAtemAudioInputStateWidget::InspectorAtemAudioInputStateWidget(QWidget* parent)
    : QWidget(parent),
      model(NULL), command(NULL)
{
    setupUi(this);

    QObject::connect(&EventManager::getInstance(), SIGNAL(rundownItemSelected(const RundownItemSelectedEvent&)), this, SLOT(rundownItemSelected(const RundownItemSelectedEvent&)));
    QObject::connect(&EventManager::getInstance(), SIGNAL(atemDeviceChanged(const AtemDeviceChangedEvent&)), this, SLOT(atemDeviceChanged(const AtemDeviceChangedEvent&)));
}

void InspectorAtemAudioInputStateWidget::rundownItemSelected(const RundownItemSelectedEvent& event)
{
    this->command = nullptr;
    this->model = event.getLibraryModel();

    blockAllSignals(true);

    if (dynamic_cast<AtemAudioInputStateCommand*>(event.getCommand()))
    {
        this->command = dynamic_cast<AtemAudioInputStateCommand*>(event.getCommand());

        this->comboBoxInput->clear();
        const QSharedPointer<AtemDevice> device = AtemDeviceManager::getInstance().getDeviceByName(this->model->getDeviceName());
        if (device != NULL)
        {
            this->inputs = device->inputInfos();

            loadAtemInputState();
            loadAtemAudioInput();
        }

        this->comboBoxInput->setCurrentIndex(this->comboBoxInput->findData(this->command->getInput()));
        this->comboBoxState->setCurrentIndex(this->comboBoxState->findData(this->command->getState()));
        this->checkBoxTriggerOnNext->setChecked(this->command->getTriggerOnNext());
    }

    checkEmptyInput();
    checkEmptyState();

    blockAllSignals(false);
}

void InspectorAtemAudioInputStateWidget::atemDeviceChanged(const AtemDeviceChangedEvent& event)
{
    if (this->model != NULL)
    {
        // Should we update the device name?
        if (!event.getDeviceName().isEmpty() && event.getDeviceName() != this->model->getDeviceName())
        {
            const QSharedPointer<AtemDevice> device = AtemDeviceManager::getInstance().getDeviceByName(event.getDeviceName());
            if (device != NULL)
            {
                this->inputs = device->inputInfos();

                loadAtemInputState();
                loadAtemAudioInput();
                checkEmptyInput();
                checkEmptyState();
            }
        }
    }
}

void InspectorAtemAudioInputStateWidget::loadAtemAudioInput()
{
    // We do not have a command object, block the signals.
    // Events will not be triggered while we update the values
    this->comboBoxInput->blockSignals(true);

    this->comboBoxInput->clear();
    foreach (quint16 key, this->inputs.keys())
    {
        if (this->inputs.value(key).internalType == 0 || this->inputs.value(key).internalType == 4)
            this->comboBoxInput->addItem(this->inputs.value(key).longText, this->inputs.value(key).index);
    }

    this->comboBoxInput->blockSignals(false);
}

void InspectorAtemAudioInputStateWidget::blockAllSignals(bool block)
{
    this->comboBoxInput->blockSignals(block);
    this->comboBoxState->blockSignals(block);
    this->checkBoxTriggerOnNext->blockSignals(block);
}

void InspectorAtemAudioInputStateWidget::loadAtemInputState()
{
    if (comboBoxState->count())
        return;

    // We do not have a command object, block the signals.
    // Events will not be triggered while we update the values.
    this->comboBoxState->blockSignals(true);

    QList<AtemAudioInputStateModel> models = DatabaseManager::getInstance().getAtemAudioInputState();
    foreach (AtemAudioInputStateModel model, models)
        this->comboBoxState->addItem(model.getName(), model.getValue());

    this->comboBoxState->blockSignals(false);
}

void InspectorAtemAudioInputStateWidget::checkEmptyInput()
{
    if (this->comboBoxInput->isEnabled() && this->comboBoxInput->currentText() == "")
        this->comboBoxInput->setStyleSheet("border-color: firebrick;");
    else
        this->comboBoxInput->setStyleSheet("");
}

void InspectorAtemAudioInputStateWidget::checkEmptyState()
{
    if (this->comboBoxState->isEnabled() && this->comboBoxState->currentText() == "")
        this->comboBoxState->setStyleSheet("border-color: firebrick;");
    else
        this->comboBoxState->setStyleSheet("");
}

void InspectorAtemAudioInputStateWidget::inputChanged(int index)
{
    this->command->setInput(this->comboBoxInput->itemData(index).toString());

    checkEmptyInput();
}

void InspectorAtemAudioInputStateWidget::stateChanged(int index)
{
    this->command->setState(this->comboBoxState->itemData(index).toString());

    checkEmptyState();
}

void InspectorAtemAudioInputStateWidget::triggerOnNextChanged(int state)
{
    this->command->setTriggerOnNext((state == Qt::Checked) ? true : false);
}
