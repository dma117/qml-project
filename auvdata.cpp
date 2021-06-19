#include "auvdata.h"


AUVData::AUVData(QObject *parent) : QObject(parent)
{
}

float AUVData::high() const
{
    return m_high;
}

void AUVData::setHigh(float newHigh)
{
    if (m_high == newHigh)
        return;

    m_high = newHigh;
    emit highChanged(m_high);
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
