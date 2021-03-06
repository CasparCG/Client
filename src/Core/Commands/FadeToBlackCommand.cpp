#include "FadeToBlackCommand.h"

#include <QtCore/QXmlStreamWriter>

FadeToBlackCommand::FadeToBlackCommand(QObject* parent)
    : AbstractCommand(parent)
{
    this->videolayer = Output::DEFAULT_FLASH_VIDEOLAYER;
}

const QString& FadeToBlackCommand::getColor() const
{
    return this->color;
}

const QString& FadeToBlackCommand::getTransition() const
{
    return this->transition;
}

int FadeToBlackCommand::getTransitionDuration() const
{
    return this->transitionDuration;
}

const QString& FadeToBlackCommand::getDirection() const
{
    return this->direction;
}

const QString& FadeToBlackCommand::getTween() const
{
    return this->tween;
}

bool FadeToBlackCommand::getUseAuto() const
{
    return this->useAuto;
}

bool FadeToBlackCommand::getTriggerOnNext() const
{
    return this->triggerOnNext;
}

void FadeToBlackCommand::setTransition(const QString& transition)
{
    this->transition = transition;
    emit transitionChanged(this->transition);
}

void FadeToBlackCommand::setTransitionDuration(int transitionDuration)
{
    this->transitionDuration = transitionDuration;
    emit transitionDurationChanged(this->transitionDuration);
}

void FadeToBlackCommand::setDirection(const QString& direction)
{
    this->direction = direction;
    emit directionChanged(this->direction);
}

void FadeToBlackCommand::setTween(const QString& tween)
{
    this->tween = tween;
    emit tweenChanged(this->tween);
}

void FadeToBlackCommand::setUseAuto(bool useAuto)
{
    this->useAuto = useAuto;
    emit useAutoChanged(this->useAuto);
}

void FadeToBlackCommand::setTriggerOnNext(bool triggerOnNext)
{
    this->triggerOnNext = triggerOnNext;
    emit triggerOnNextChanged(this->triggerOnNext);
}

void FadeToBlackCommand::readProperties(boost::property_tree::wptree& pt)
{
    AbstractCommand::readProperties(pt);

    setTransition(QString::fromStdWString(pt.get(L"transition", Mixer::DEFAULT_TRANSITION.toStdWString())));
    setTransitionDuration(pt.get(L"transitionDuration", pt.get(L"transtitionDuration", Mixer::DEFAULT_DURATION)));
    setTween(QString::fromStdWString(pt.get(L"tween", Mixer::DEFAULT_TWEEN.toStdWString())));
    setDirection(QString::fromStdWString(pt.get(L"direction", Mixer::DEFAULT_DIRECTION.toStdWString())));
    setUseAuto(pt.get(L"useauto", FadeToBlack::DEFAULT_USE_AUTO));
    setTriggerOnNext(pt.get(L"triggeronnext", FadeToBlack::DEFAULT_TRIGGER_ON_NEXT));
}

void FadeToBlackCommand::writeProperties(QXmlStreamWriter& writer)
{
    AbstractCommand::writeProperties(writer);

    writer.writeTextElement("transition", getTransition());
    writer.writeTextElement("transitionDuration", QString::number(getTransitionDuration()));
    writer.writeTextElement("tween", getTween());
    writer.writeTextElement("direction", getDirection());
    writer.writeTextElement("useauto", (getUseAuto() == true) ? "true" : "false");
    writer.writeTextElement("triggeronnext", (getTriggerOnNext() == true) ? "true" : "false");
}
