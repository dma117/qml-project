#include "movable_object.h"

movable_object::movable_object(QObject *parent) : QObject(parent)
{
}

float movable_object::xPosition() const
{
    return m_xPosition;
}

float movable_object::yPosition() const
{
    return m_yPosition;
}

void movable_object::setXPosition(float xPos) {
    setXPrev(m_xPosition);

    if (xPos == m_xPosition)
        return;

    setXPrev(m_xPosition);

    m_xPosition = xPos;
    emit xPositionChanged(m_xPosition);
}

void movable_object::setYPosition(float yPos) {
    setYPrev(m_yPosition);

    if (yPos == m_yPosition)
        return;

    setYPrev(m_yPosition);

    m_yPosition = yPos;
    emit yPositionChanged(m_yPosition);
}

float movable_object::xPrev() const
{
    return m_xPrev;
}

void movable_object::setXPrev(float newXPrev)
{
    if (qFuzzyCompare(m_xPrev, newXPrev))
        return;

    m_xPrev = newXPrev;

    emit xPrevChanged(m_xPrev);
}

float movable_object::yPrev() const
{
    return m_yPrev;
}

void movable_object::setYPrev(float newYPrev)
{
    if (qFuzzyCompare(m_yPrev, newYPrev))
        return;
    m_yPrev = newYPrev;

    emit yPrevChanged(m_yPrev);
}
