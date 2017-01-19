import QtQuick 2.5
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import QtQuick.Window 2.2

Window {
    id: root
    title: qsTr("QML Explorer")
    width: 640
    height: 480
    x: 0
    y: Screen.desktopAvailableHeight - height
    visible: true
    flags: Qt.WindowStaysOnTopHint

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 9
        RowLayout {
            Layout.fillWidth: true
            TextField {
                id: input
                Layout.fillWidth: true
                focus: true
                onAccepted: {
                    root.jsCall(input.text)
                    //input.text = ''
                }
            }
            Button {
                text: qsTr("Send")
                onClicked: {
                    root.jsCall(input.text)
                    //input.text = ''
                }
            }
        }
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Rectangle {
                anchors.fill: parent
                color: '#333'
                border.color: Qt.darker(color)
                opacity: 0.2
                radius: 2
            }

            ScrollView {
                id: scrollView
                anchors.fill: parent
                anchors.margins: 9
                ListView {
                    id: resultView
                    model: ListModel {
                        id: outputModel
                    }
                    delegate: ColumnLayout {
                        width: ListView.view.width
                        Label {
                            Layout.fillWidth: true
                            color: 'green'
                            text: "> " + model.expression
                        }
                        Label {
                            Layout.fillWidth: true
                            color: 'blue'
                            text: "" + model.result
                        }
                        Rectangle {
                            height: 1
                            Layout.fillWidth: true
                            color: '#333'
                            opacity: 0.2
                        }
                    }
                }
            }
        }
    }

    function jsCall(exp) {
        var output = eval(exp);
        if (output === ''){
            output = "''"
        }
        
        if (output !== undefined){
            output = output.toString();
        }

        var data = {
          expression: exp,
          result: output
        }
        outputModel.insert(0, data)
    }
}
