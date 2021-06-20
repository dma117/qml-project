#ifndef MOVABLE_OBJECT_H
#define MOVABLE_OBJECT_H

#include <qobject.h>



class movable_object : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float xPosition READ xPosition WRITE setXPosition NOTIFY xPositionChanged)
    Q_PROPERTY(float yPosition READ yPosition WRITE setYPosition NOTIFY yPositionChanged)
    Q_PROPERTY(float xPrev READ xPrev WRITE setXPrev NOTIFY xPrevChanged)
    Q_PROPERTY(float yPrev READ yPrev WRITE setYPrev NOTIFY yPrevChanged)

public:
    movable_object(QObject *parent = nullptr);

    float xPosition() const;
    float yPosition() const;
    void setXPosition(float xPos);
    void setYPosition(float yPos);

    float xPrev() const;
    void setXPrev(float newXPrev);

    float yPrev() const;
    void setYPrev(float newYPrev);

signals:
    void xPositionChanged(float message);
    void yPositionChanged(float message);
    void xPrevChanged(float message);
    void yPrevChanged(float message);

private:
    float m_xPosition;
    float m_yPosition;
    float m_xPrev;
    float m_yPrev;
};

#endif // MOVABLE_OBJECT_H
