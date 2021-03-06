#include "CropCommand.h"

#include <QtCore/QXmlStreamWriter>

CropCommand::CropCommand(QObject* parent)
    : AbstractCommand(parent)
{
}

float CropCommand::getLeft() const
{
    return this->left;
}

float CropCommand::getTop() const
{
    return this->top;
}

float CropCommand::getRight() const
{
    return this->right;
}

float CropCommand::getBottom() const
{
    return this->bottom;
}

int CropCommand::getTransitionDuration() const
{
    return this->transitionDuration;
}

const QString& CropCommand::getTween() const
{
    return this->tween;
}

bool CropCommand::getDefer() const
{
    return this->defer;
}

void CropCommand::setLeft(float left)
{
    this->left = left;
    emit leftChanged(this->left);
}

void CropCommand::setTop(float top)
{
    this->top = top;
    emit topChanged(this->top);
}

void CropCommand::setRight(float right)
{
    this->right = right;
    emit rightChanged(this->right);
}

void CropCommand::setBottom(float bottom)
{
    this->bottom = bottom;
    emit bottomChanged(this->bottom);
}

void CropCommand::setTransitionDuration(int transitionDuration)
{
    this->transitionDuration = transitionDuration;
    emit transitionDurationChanged(this->transitionDuration);
}

void CropCommand::setTween(const QString& tween)
{
    this->tween = tween;
    emit tweenChanged(this->tween);
}

void CropCommand::setDefer(bool defer)
{
    this->defer = defer;
    emit deferChanged(this->defer);
}

void CropCommand::readProperties(boost::property_tree::wptree& pt)
{
    AbstractCommand::readProperties(pt);

    setLeft(pt.get(L"left", Mixer::DEFAULT_CROP_LEFT));
    setTop(pt.get(L"top", Mixer::DEFAULT_CROP_TOP));
    setRight(pt.get(L"right", Mixer::DEFAULT_CROP_RIGHT));
    setBottom(pt.get(L"bottom", Mixer::DEFAULT_CROP_BOTTOM));
    setTransitionDuration(pt.get(L"transitionDuration", pt.get(L"transtitionDuration", Mixer::DEFAULT_DURATION)));
    setTween(QString::fromStdWString(pt.get(L"tween", Mixer::DEFAULT_TWEEN.toStdWString())));
    setDefer(pt.get(L"defer", Mixer::DEFAULT_DEFER));
}

void CropCommand::writeProperties(QXmlStreamWriter& writer)
{
    AbstractCommand::writeProperties(writer);

    writer.writeTextElement("left", QString::number(getLeft()));
    writer.writeTextElement("top", QString::number(getTop()));
    writer.writeTextElement("right", QString::number(getRight()));
    writer.writeTextElement("bottom", QString::number(getBottom()));
    writer.writeTextElement("transitionDuration", QString::number(getTransitionDuration()));
    writer.writeTextElement("tween", this->getTween());
    writer.writeTextElement("defer", (getDefer() == true) ? "true" : "false");
}
