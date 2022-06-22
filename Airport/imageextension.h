#ifndef PLANE_H
#define PLANE_H

#include <QImage>
#include <qqml.h>

class ImageExtension : public QObject, public QImage
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)

public:
    ImageExtension(QObject *parent = nullptr);

    QString name() const;
    void setName(QString name);

signals:
    void nameChanged();

private:
    QString m_name;

    QImage *m_image;
};

//struct QPlaneImage
//{
//private:
//    Q_GADGET;
//    QML_FOREIGN(QImage);
//    QML_NAMED_ELEMENT(PlaneImage);
//    QML_EXTENDED(ImageExtension);
//};

#endif // PLANE_H
