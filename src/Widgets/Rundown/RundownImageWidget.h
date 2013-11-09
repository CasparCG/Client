#pragma once

#include "../Shared.h"
#include "AbstractRundownWidget.h"
#include "ui_RundownImageWidget.h"

#include "Global.h"

#include "CasparDevice.h"

#include "GpiDevice.h"

#include "Animations/ActiveAnimation.h"
#include "Commands/AbstractCommand.h"
#include "Commands/AbstractPlayoutCommand.h"
#include "Commands/ImageCommand.h"
#include "Models/LibraryModel.h"

#include <QtCore/QString>
#include <QtCore/QTimer>

#include <QtGui/QWidget>

class WIDGETS_EXPORT RundownImageWidget : public QWidget, Ui::RundownImageWidget, public AbstractRundownWidget, public AbstractPlayoutCommand
{
    Q_OBJECT

    public:
        explicit RundownImageWidget(const LibraryModel& model, QWidget* parent = 0, const QString& color = Color::DEFAULT_TRANSPARENT_COLOR,
                                    bool active = false, bool loaded = false, bool paused = false, bool playing = false,
                                    bool inGroup = false, bool compactView = false);

        virtual AbstractRundownWidget* clone();

        virtual bool isGroup() const;
        virtual bool isInGroup() const;

        virtual AbstractCommand* getCommand();
        virtual LibraryModel* getLibraryModel();

        virtual void setActive(bool active);
        virtual void setInGroup(bool inGroup);
        virtual void setColor(const QString& color);

        virtual void setExpanded(bool expanded) {}

        virtual bool executeCommand(enum Playout::PlayoutType::Type type);

        virtual void readProperties(boost::property_tree::wptree& pt);
        virtual void writeProperties(QXmlStreamWriter* writer);

        virtual void setCompactView(bool compactView);

    protected:
        virtual bool eventFilter(QObject* target, QEvent* event);

    private:
        bool active;
        bool loaded;
        bool paused;
        bool playing;
        bool inGroup;
        bool compactView;
        QString color;
        LibraryModel model;
        ImageCommand command;
        ActiveAnimation* animation;

        QTimer executeTimer;

        void setThumbnail();
        void checkEmptyDevice();
        void checkGpiConnection();
        void checkDeviceConnection();

        Q_SLOT void executeClearVideolayer();
        Q_SLOT void executeClearChannel();
        Q_SLOT void channelChanged(int);
        Q_SLOT void executeLoad();
        Q_SLOT void executePlay();
        Q_SLOT void executePause();
        Q_SLOT void executeStop();
        Q_SLOT void videolayerChanged(int);
        Q_SLOT void delayChanged(int);
        Q_SLOT void allowGpiChanged(bool);
        Q_SLOT void gpiConnectionStateChanged(bool, GpiDevice*);
        Q_SLOT void deviceConnectionStateChanged(CasparDevice&);
        Q_SLOT void deviceAdded(CasparDevice&);
};
