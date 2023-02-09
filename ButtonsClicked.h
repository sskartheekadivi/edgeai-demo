#include <QObject>
#include <QDebug>
#include <iostream>
#include <sstream>
using namespace std;

class ButtonsClicked : public QObject {
    Q_OBJECT
public:
    static qint32 activeButton;
    // qint32 activeButton;
    explicit ButtonsClicked (QObject* parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE QString leftMenuButtonClicked(qint32 button, int x, int y, int width, int height) {
        ostringstream pipeline;
        cout << "c++ button value = " << button << endl;
        activeButton = button;
        emit activeButton;
        cout << "c++ active button value = " << activeButton << endl;
        if (button == 1) {
            pipeline << "gst-pipeline: videotestsrc pattern=18 ! videoconvert ! videoscale ! capsfilter caps=\"video/x-raw, width=" << width << ", height=" << height << "\" ! qtvideosink";
        } else if (button == 2) {           
            pipeline << "gst-pipeline: videotestsrc pattern=18 ! videoconvert ! videoscale ! capsfilter caps=\"video/x-raw, width=" << width << ", height=" << height << "\" ! qtvideosink";
        } else if (button == 3) {
            pipeline << "gst-pipeline: videotestsrc pattern=18 ! videoconvert ! videoscale ! capsfilter caps=\"video/x-raw, width=" << width << ", height=" << height << "\" ! qtvideosink";
        } else if (button >= 4) {
            printf("WARNING: Button functionality not implemented\n");
            pipeline << " ";
        } else {
            printf("WARNING: Invalid Button click from Left Menu!\n");
            pipeline << " ";
        }
        return QString().fromStdString(pipeline.str());
    }
};

class PopupMenu : public QObject {
    Q_OBJECT
public:
    explicit PopupMenu (QObject* parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void popupInputTypeSelected(QString InputType) {
            qDebug() << "Input Type = " << InputType.toStdString().data();
            // cout << "Input Type = " << InputType.toStdString();
    }
};
