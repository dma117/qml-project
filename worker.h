#ifndef WORKER_H
#define WORKER_H

#include <QObject>
#include <QQmlEngine>
#include <QThread>


class Worker : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(Worker)
public:
    Worker(QObject *parent = nullptr);
    Q_INVOKABLE void start_test();

public slots:
    void run();

signals:
    void positionChanged(float xPos, float yPos);

private:
    float xPositions[5] = { 540, 640, 740, 540, 740 };
    float yPositions[5] = { 360, 160, 360, 260, 260 };
    uint position = 0;
    QThread thread_;
};

#endif // WORKER_H
