#include <QObject>
#include <QDebug>
#include <iostream>
#include <sstream>
using namespace std;

class ButtonsClicked : public QObject {
    Q_OBJECT
public:
    static int activeButton;
    explicit ButtonsClicked (QObject* parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE QString leftMenuButtonClicked(int button, int x, int y, int width, int height) {
        ostringstream pipeline;
        activeButton = button;
        if (button == 1) {
            pipeline << "gst-pipeline: multifilesrc location=/opt/edgeai-test-data/videos/video_0000_h264.h264 loop=true caps=\"video/x-h264, width=1920, height=1080\" ! \
                        h264parse ! v4l2h264dec ! video/x-raw,format=NV12 ! \
                        tiovxmosaic sink_0::startx=\"<320>\" sink_0::starty=\"<180>\" sink_0::widths=\"<1920>\" sink_0::heights=\"<1080>\" ! \
                        video/x-raw, width=1920, height=1080 ! queue ! \
                        tiperfoverlay title=\"Object Detection Demo\" ! tiovxmultiscaler ! video/x-raw, width=1920, height=1080 ! \
                        kmssink driver-name=tidss name=\"qtvideosink\" render-rectangle=\"<" << x << ", " << y << " ," << width << " ," << height << ">\"";
        } else if (button == 2) {
            pipeline << "gst-pipeline: videotestsrc pattern=1 ! video/x-raw,format=NV12 ! capsfilter caps=\"video/x-raw, width=" << width << ", height=" << height << "\" ! kmssink driver-name=tidss name=\"qtvideosink\" render-rectangle=\"<" << x << ", " << y << " ," << width << " ," << height << ">\"";
            pipeline << "gst-pipeline: videotestsrc pattern=18 ! video/x-raw,format=NV12 ! video/x-raw, width=1920, height=1080 ! queue ! tiperfoverlay title=\"Dummy Semantic Segmentation\" ! tiovxmultiscaler ! video/x-raw, width=1920, height=1080 ! kmssink driver-name=tidss name=\"qtvideosink\" render-rectangle=\"<" << x << ", " << y << " ," << width << " ," << height << ">\"";
        } else if (button == 3) {
            // pipeline << "gst-pipeline: videotestsrc pattern=18 ! videoconvert ! videoscale ! capsfilter caps=\"video/x-raw, width=" << width << ", height=" << height << "\" ! qtvideosink";
            pipeline << "gst-pipeline: videotestsrc pattern=18 ! videoconvert ! videoscale ! capsfilter caps=\"video/x-raw, width=" << width << ", height=" << height << "\" ! kmssink driver-name=tidss name=\"qtvideosink\" render-rectangle=\"<" << x << ", " << y << " ," << width << " ," << height << ">\"";

        } else if (button >= 4) {
            printf("WARNING: Button functionality not implemented\n");
            pipeline << " ";
        } else {
            printf("WARNING: Invalid Button click from Left Menu!\n");
            pipeline << " ";
        }
        cout << "leftMenuButton" << button << " pipeline: \n" << pipeline.str() << "\n\n";
        return QString().fromStdString(pipeline.str());
        return QString("");
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
