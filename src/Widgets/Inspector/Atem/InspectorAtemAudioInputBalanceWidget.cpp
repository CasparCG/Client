#include "InspectorAtemAudioInputBalanceWidget.h"

#include "Global.h"

#include "AtemDeviceManager.h"
#include "DatabaseManager.h"
#include "EventManager.h"
#include "Models/Atem/AtemAudioInputModel.h"

#include <QtWidgets/QApplication>

InspectorAtemAudioInputBalanceWidget::InspectorAtemAudioInputBalanceWidget(QWidget* parent)
    : QWidget(parent),
      model(NULL), command(NULL)
{
    setupUi(this);

    QObject::connect(&EventManager::getInstance(), SIGNAL(rundownItemSelected(const RundownItemSelectedEvent&)), this, SLOT(rundownItemSelected(const RundownItemSelectedEvent&)));
    QObject::connect(&EventManager::getInstance(), SIGNAL(atemDeviceChanged(const AtemDeviceChangedEvent&)), this, SLOT(atemDeviceChanged(const AtemDeviceChangedEvent&)));
}

void InspectorAtemAudioInputBalanceWidget::rundownItemSelected(const RundownItemSelectedEvent& event)
{
    this->command = nullptr;
    this->model = event.getLibraryModel();

    blockAllSignals(true);

    if (dynamic_cast<AtemAudioInputBalanceCommand*>(event.getCommand()))
    {
        this->command = dynamic_cast<AtemAudioInputBalanceCommand*>(event.getCommand());

        this->comboBoxInput->clear();
        const QSharedPointer<AtemDevice> device = AtemDeviceManager::getInstance().getDeviceByName(this->model->getDeviceName());
        if (device != NULL)
        {
            this->inputs = device->inputInfos();

            loadAtemAudioInput();
        }

        this->comboBoxInput->setCurrentIndex(this->comboBoxInput->findData(this->command->getInput()));
        this->sliderBalance->setValue(this->command->getBalance() * 100);
        this->doubleSpinBoxBalance->setValue(this->command->getBalance());
        this->checkBoxTriggerOnNext->setChecked(this->command->getTriggerOnNext()); 
    }

    checkEmptyInput();

    blockAllSignals(false);
}

void InspectorAtemAudioInputBalanceWidget::atemDeviceChanged(const AtemDeviceChangedEvent& event)
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

                loadAtemAudioInput();
                checkEmptyInput();
            }
        }
    }
}

void InspectorAtemAudioInputBalanceWidget::loadAtemAudioInput()
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

void InspectorAtemAudioInputBalanceWidget::blockAllSignals(bool block)
{
    this->comboBoxInput->blockSignals(block);
    this->sliderBalance->blockSignals(block);
    this->doubleSpinBoxBalance->blockSignals(block);
    this->checkBoxTriggerOnNext->blockSignals(block);
}

void InspectorAtemAudioInputBalanceWidget::checkEmptyInput()
{
    if (this->comboBoxInput->isEnabled() && this->comboBoxInput->currentText() == "")
        this->comboBoxInput->setStyleSheet("border-color: firebrick;");
    else
        this->comboBoxInput->setStyleSheet("");
}

void InspectorAtemAudioInputBalanceWidget::inputChanged(int index)
{
    this->command->setInput(this->comboBoxInput->itemData(index).toString());

    checkEmptyInput();
}

void InspectorAtemAudioInputBalanceWidget::sliderBalanceChanged(int value)
{
    this->command->setBalance(static_cast<float>(value) / 100);

    this->doubleSpinBoxBalance->blockSignals(true);
    this->doubleSpinBoxBalance->setValue(static_cast<float>(value) / 100);
    this->doubleSpinBoxBalance->blockSignals(false);
}

void InspectorAtemAudioInputBalanceWidget::doubleSpinBoxBalanceChanged(double value)
{
    this->command->setBalance(static_cast<float>(value));

    this->sliderBalance->blockSignals(true);
    this->sliderBalance->setValue(value * 100);
    this->sliderBalance->blockSignals(false);
}

void InspectorAtemAudioInputBalanceWidget::triggerOnNextChanged(int state)
{
    this->command->setTriggerOnNext((state == Qt::Checked) ? true : false);
}
