#include "DeviceManager.h"
#include "DatabaseManager.h"
#include "Events/ConnectionStateChangedEvent.h"
#include "Events/DataChangedEvent.h"
#include "Events/MediaChangedEvent.h"
#include "Events/Inspector/TemplateChangedEvent.h"
#include "Models/DeviceModel.h"

#include "CasparDevice.h"

#include <stdexcept>

#include <QtCore/QDebug>
#include <QtCore/QList>
#include <QtCore/QSharedPointer>
#include <QtCore/QStringList>
#include <QtCore/QRegExp>

#include <QtGui/QApplication>

Q_GLOBAL_STATIC(DeviceManager, deviceManager)

DeviceManager::DeviceManager()
{
    QString oscPort = DatabaseManager::getInstance().getConfigurationByName("OscPort").getValue();
    this->oscListener = QSharedPointer<OscListener>(new OscListener("0.0.0.0", (oscPort.isEmpty() == true) ? Osc::DEFAULT_PORT : oscPort.toInt()));
    if (DatabaseManager::getInstance().getConfigurationByName("DisableVideoProgress").getValue() == "false")
        this->oscListener->start();

    QString triCasterPort = DatabaseManager::getInstance().getConfigurationByName("TriCasterPort").getValue();
    this->triCasterDevice = QSharedPointer<TriCasterDevice>(new TriCasterDevice("10.21.81.172", (triCasterPort.isEmpty() == true) ? TriCaster::DEFAULT_PORT : triCasterPort.toInt()));
    this->triCasterDevice->connectDevice();
}

DeviceManager& DeviceManager::getInstance()
{
    return *deviceManager();
}

void DeviceManager::initialize()
{
    QList<DeviceModel> models = DatabaseManager::getInstance().getDevice();
    foreach (const DeviceModel& model, models)
    {
        QSharedPointer<CasparDevice> device(new CasparDevice(model.getAddress(), model.getPort()));

        this->deviceModels.insert(model.getName(), model);
        this->devices.insert(model.getName(), device);

        emit deviceAdded(*device);

        device->connectDevice();
    }
}

void DeviceManager::uninitialize()
{
    foreach (const QString& key, this->devices.keys())
    {
        QSharedPointer<CasparDevice>& device = this->devices[key];
        device->disconnectDevice();
    }
}

void DeviceManager::refresh()
{
    QList<DeviceModel> models = DatabaseManager::getInstance().getDevice();

    // Disconnect old devices.
    foreach (const QString& key, this->devices.keys())
    {
        QSharedPointer<CasparDevice>& device = this->devices[key];

        bool foundDevice = false;
        foreach (DeviceModel model, models)
        {
            if (model.getAddress() == device->getAddress())
            {
                foundDevice = true;
                break;
            }
        }

        if (!foundDevice)
        {
            device->disconnectDevice();

            this->devices.remove(key);
            this->deviceModels.remove(key);

            emit deviceRemoved();
        }
    }

    // Connect new devices.
    foreach (DeviceModel model, models)
    {
        if (!this->devices.contains(model.getName()))
        {
            QSharedPointer<CasparDevice> device(new CasparDevice(model.getAddress(), model.getPort()));

            this->deviceModels.insert(model.getName(), model);
            this->devices.insert(model.getName(), device);

            emit deviceAdded(*device);

            device->connectDevice();
        }
    }
}

QList<DeviceModel> DeviceManager::getDeviceModels() const
{
    QList<DeviceModel> models;
    foreach (const DeviceModel& model, this->deviceModels)
        models.push_back(model);

    return models;
}

const DeviceModel DeviceManager::getDeviceModelByName(const QString& name) const
{
    foreach (const DeviceModel& model, this->deviceModels)
    {
        if (model.getName() == name)
            return model;
    }

    qCritical() << "No DeviceModel found for specified name";
}

const DeviceModel DeviceManager::getDeviceModelByAddress(const QString& address) const
{
    foreach (const DeviceModel& model, this->deviceModels)
    {
        if (model.getAddress() == address)
            return model;
    }

    qCritical() << "No DeviceModel found for specified address";
}

const int DeviceManager::getDeviceCount() const
{
    return this->devices.count();
}

const QSharedPointer<CasparDevice> DeviceManager::getDeviceByName(const QString& name) const
{
    return this->devices.value(name);
}

const QSharedPointer<OscListener> DeviceManager::getOscListener() const
{
    return this->oscListener;
}

const QSharedPointer<TriCasterDevice> DeviceManager::getTriCasterDevice() const
{
    return this->triCasterDevice;
}
