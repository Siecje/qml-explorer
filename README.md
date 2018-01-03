# QML Explorer

QML Explorer is a debug window that allows you to check values in QML.

The code started with the JS Console [code](https://github.com/qmlbook/qmlbook/tree/6b74cf0532d9a781f20bb34416b7c0afa8f505d9/en/ch14/src/JSConsole)
in the [Cadaques book](http://qmlbook.github.io/).

## Usage


Add `Explorer {}` to your .qml file. It opens a new window.


```
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
```

## Example

```shell
qmlscene example.qml
```