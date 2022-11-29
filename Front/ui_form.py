# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'form.ui'
##
## Created by: Qt User Interface Compiler version 6.4.1
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide6.QtCore import (QCoreApplication, QDate, QDateTime, QLocale,
    QMetaObject, QObject, QPoint, QRect,
    QSize, QTime, QUrl, Qt)
from PySide6.QtGui import (QBrush, QColor, QConicalGradient, QCursor,
    QFont, QFontDatabase, QGradient, QIcon,
    QImage, QKeySequence, QLinearGradient, QPainter,
    QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtWidgets import (QApplication, QMainWindow, QMenuBar, QSizePolicy,
    QStatusBar, QWidget)

class Ui_home(object):
    def setupUi(self, home):
        if not home.objectName():
            home.setObjectName(u"home")
        home.resize(800, 600)
        self.centralwidget = QWidget(home)
        self.centralwidget.setObjectName(u"centralwidget")
        home.setCentralWidget(self.centralwidget)
        self.menubar = QMenuBar(home)
        self.menubar.setObjectName(u"menubar")
        home.setMenuBar(self.menubar)
        self.statusbar = QStatusBar(home)
        self.statusbar.setObjectName(u"statusbar")
        home.setStatusBar(self.statusbar)

        self.retranslateUi(home)

        QMetaObject.connectSlotsByName(home)
    # setupUi

    def retranslateUi(self, home):
        home.setWindowTitle(QCoreApplication.translate("home", u"home", None))
    # retranslateUi

