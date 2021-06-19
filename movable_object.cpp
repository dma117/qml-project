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

void movable_object::setXPosition(float xPos)
{
    if (xPos == m_xPosition)
        return;

    m_xPosition = xPos;
    emit xPositionChanged(m_xPosition);
}

void movable_object::setYPosition(float yPos) {
    if (yPos == m_yPosition)
        return;

    m_yPosition = yPos;
    emit yPositionChanged(m_yPosition);
}
