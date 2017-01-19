import QtQuick 2.5

Item {
  id: root
  property string hello: "Hello"
  property var world: "World"
  Text {
    id: txt
    text: "Hello"
  }
  Explorer {}
}
