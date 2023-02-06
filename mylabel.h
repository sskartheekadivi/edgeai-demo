#ifndef MYLABEL_H
#define MYLABEL_H

#include <QObject>
// #include <QString>
// #include <qqml.h>

class MyLabel : public QObject
{
  Q_OBJECT
  public:
    // Object pointer
    QObject* myObject;

    explicit MyLabel(QObject *parent = 0);

  // Must call Q_INVOKABLE so that this function can be used in QML
  Q_INVOKABLE void setMyObject(QObject* obj);
};

#endif // MYLABEL_H
