#ifndef MOVABLE_OBJECT_H
#define MOVABLE_OBJECT_H

#include <qobject.h>



class movable_object : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float xPosition READ xPosition WRITE setXPosition NOTIFY xPositionChanged)
    Q_PROPERTY(float yPosition READ yPosition WRITE setYPosition NOTIFY yPositionChanged)

public:
    movable_object(QObject *parent = nullptr);

    float xPosition() const;
    float yPosition() const;
    void setXPosition(float xPos);
    void setYPosition(float yPos);

signals:
    void xPositionChanged(float message);
    void yPositionChanged(float message);

private:
    float m_xPosition;
    float m_yPosition;
};

#endif // MOVABLE_OBJECT_H
