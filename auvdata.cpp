#include "auvdata.h"


AUVData::AUVData(QObject *parent) : QObject(parent)
{
  m_height = 10;
  m_deep = 7;
  m_deep = 1;
  m_direction = 89;
}

float AUVData::height() const
{
    return m_height;
}

void AUVData::setHeight(float newHeight)
{
    if (m_height == newHeight)
        return;

    m_height = newHeight;
    emit heightChanged(m_height);
}

float AUVData::deep() const
{
    return m_deep;
}

void AUVData::setDeep(float newDeep)
{
    if (m_deep == newDeep)
        return;

    m_deep = newDeep;
    emit deepChanged(m_deep);
}

float AUVData::speed() const
{
    return m_speed;
}

void AUVData::setSpeed(float newSpeed)
{
    if (m_speed == newSpeed)
        return;

    m_speed = newSpeed;
    emit speedChanged(m_speed);
}

float AUVData::direction() const
{
    return m_direction;
}

void AUVData::setDirection(float newDirection)
{
    if (m_direction == newDirection)
        return;

    m_direction = newDirection;
    emit setDirection(m_direction);
}
