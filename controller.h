#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "worker.h"

#include <QObject>
#include <QThread>



class Controller : public QObject
{
    Q_OBJECT
    QThread workerThread;
public:
    Controller() {
        Worker *worker = new Worker;
        worker->moveToThread(&workerThread);

        connect(&workerThread, &QThread::started, worker, &Worker::run);
        //connect(worker, &Worker::positionChanged, this, &Controller::handleResults);
        connect(worker, &Worker::positionChanged, this, &Controller::handleResults, Qt::DirectConnection);
    }
    ~Controller() {
        workerThread.quit();
        workerThread.wait();
    }

    Q_INVOKABLE void start_test() {workerThread.start();}

public slots:
    void handleResults(float xPos, float yPos);
signals:
    void operate(float xPos, float yPos);
};
#endif // CONTROLLER_H
