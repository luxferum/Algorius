from PySide6.QtWidgets import (
    QApplication, QDialog, QProgressBar, QSizePolicy, QWidget, QFileDialog)
from PySide6.QtGui import (QBrush, QColor, QConicalGradient, QCursor, QFont, QFontDatabase, QGradient,
                           QIcon, QImage, QKeySequence, QLinearGradient, QPainter, QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtWidgets import (QAbstractItemView, QApplication, QCheckBox, QComboBox, QDateEdit, QDoubleSpinBox, QFrame, QGraphicsView, QGridLayout, QGroupBox, QHeaderView,
                               QLCDNumber, QLabel, QLineEdit, QMainWindow, QMenu, QMenuBar, QPushButton, QSizePolicy, QSlider, QTabWidget, QTableWidget, QTableWidgetItem, QToolButton, QWidget,QTabBar)
from PySide6.QtGui import (QAction, QBrush, QColor, QConicalGradient, QCursor, QFont, QFontDatabase, QGradient,
                           QIcon, QImage, QKeySequence, QLinearGradient, QPainter, QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtCore import (QCoreApplication, QDate, QDateTime, QLocale,
                            QMetaObject, QObject, QPoint, QRect, QSize, QTime, QUrl, Qt, QThread)
from PyQt6 import QtGui
from pathlib import Path
from ui_login1 import Ui_login_window
from ui_load1 import Ui_Loading_window
from ui_form import Ui_mainWithTabs
from ui_register import Ui_register_window
import os
import time
from PySide6.QtCore import *
import PySide6.QtWidgets
import PySide6.QtGui
from PySide6 import QtCore
import PySide6
from PyQt6.QtCore import Qt
from PyQt6.QtCore import QObject, QThread, pyqtSignal
import hashlib
import sys
import rsc_rc

sys.path.append(os.path.abspath(os.path.join('')))
from rtd_classes import Worker
from ctypes import *
import win32api
import socket

class login_window(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.ui = Ui_login_window()
        self.ui.setupUi(self)
        self.ui.bt_login.clicked.connect(lambda: self.loginParaLoading())
        self.ui.bt_login_2.clicked.connect(lambda: self.loginParaRegistro())
        self.ui.bt_exit.clicked.connect(lambda: self.sair())

    def loginParaLoading(self):
        self.janelaLoading = Loading_window()
        self.janelaLoading.show()
        self.close()
        # if self.ui.linha_login.text()=="lux" and self.ui.linha_senha.text()=="99818954":

    def loginParaRegistro(self):
        self.close()
        self.janelaRegistro = register_window()
        self.janelaRegistro.show()
        self.janelaRegistro.ui.bt_back.clicked.connect(
            lambda: self.registroParaLogin())
        self.janelaRegistro.ui.bt_done.clicked.connect(
            lambda: self.registroParaLogin())

    def registroParaLogin(self):
        self.janelaLogin = login_window()
        self.janelaLogin.show()
        self.janelaRegistro.close()

    def sair(self):
        self.ui.bt_exit.clicked.connect(QApplication.instance().quit())


class register_window(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.ui = Ui_register_window()
        self.ui.setupUi(self)


class Loading_window(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.ui = Ui_Loading_window()
        self.ui.setupUi(self)
        self.ui.Loading_window_progressBar.setValue(0)
        while self.ui.Loading_window_progressBar.value() != 100:
            self.ui.Loading_window_progressBar.setValue(
                self.ui.Loading_window_progressBar.value()+1)
        self.loadingParaForm()

    def loadingParaForm(self):
        self.janelaForm = mainWithTabs()
        self.ui.pushButton_endLoad.clicked.connect(lambda: self.close())
        self.ui.pushButton_endLoad.clicked.connect(
            lambda: self.janelaForm.show())


class mainWithTabs(QMainWindow):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.ui = Ui_mainWithTabs()
        self.ui.setupUi(self)
        self.incializarSemTabs()       
        self.sair2()
        self.irTabSummarizer()
        self.irTabUser()
        self.irTabDashboard()
        self.irTabLab()
        self.irTabPrecification()
        self.irTabProbability()
        self.irTabSheet()
        self.irTabChart()
        self.irTabNewIndicator()
        self.irTabSynthAsset()
        self.irTabPythonEditor()
        self.irTabLoadIndicator()
        self.irTabConfiguration()
        self.irTabPreferences()
        self.irTabAbout()        
        self.dials()
        self.userProfile() 
        self.dropBoxInterest()
        self.rtd_worker()
        self.ui.comboBox.currentIndexChanged.connect(self.interestChanged)  
        self.ui.Welcome.tabCloseRequested.connect(self.tabVisible)      

    def rtd_worker(self):
        # Step 2: Create a QThread object
        self.thread = QThread()
        # Step 3: Create a worker object
        self.worker = Worker()
        # Step 4: Move worker to the thread
        self.worker.moveToThread(self.thread)
        # Step 5: Connect signals and slots
        self.thread.started.connect(self.worker.run)
        self.worker.res.connect(self.fairPrice)
        self.thread.start()

    def fairPrice(self, dictf):
        # print(dictf)
        # self.ui.lcdNumberFuturo.display(self.ui.lcdNumberSpot.value(
        # ) + arr.ultima[0]) # aqui vai o RTD do preço FRP0
        #teste123
        self.ui.lcdNumberSpot.display(dictf['spot'])  # aqui vai o RTD do preço spot(DOLFUT-FRP0)
        self.ui.lcdNumberJusto.display(dictf['fair']) # aqui vai o calculo do preço justo
        self.ui.lcdNumberFuturo.display(dictf['future'])  # aqui vai o RTD do preço DOLFUT  
        self.ui.lcdNumberCurva.display(0)  # aqui vai o calculo da curva

    def userProfile(self):
        self.ui.comboBox_nome.setSizeAdjustPolicy(
            self.ui.comboBox_nome.SizeAdjustPolicy.AdjustToContents)
        self.ui.comboBox_nome.activated.connect(
            lambda: self.mudaDadosUsuario())

    def mudaDadosUsuario(self):
        if self.ui.comboBox_nome.currentIndex() == 1:
            self.ui.label_nome.setText("Gabriel Bastos de Freitas")
            self.ui.label_email.setText("gabrielbastosdev@gmail.com")
            self.ui.label_cpf.setText("180.002.457-60")
        elif self.ui.comboBox_nome.currentIndex() == 0:
            self.ui.label_nome.setText("Eduardo Martins Lana Filho")
            self.ui.label_email.setText("eduardomlf97@gmail.com")
            self.ui.label_cpf.setText("155.577.247-10")
        elif self.ui.comboBox_nome.currentIndex() == 2:
            self.ui.label_nome.setText("Daniel de Almeida Duque")
            self.ui.label_email.setText("daniel.duk7@gmail.com")
            self.ui.label_cpf.setText("158.212.527-92")
        else:
            self.ui.label_nome.setText("Novo usuário")
            self.ui.label_email.setText("Novo usuário")
            self.ui.label_cpf.setText("Novo usuário")
    def dials(self):
        self.ui.dialJurosEua.valueChanged.connect(
            lambda: self.ui.doubleSpinBox_jurosEUA.setValue(self.ui.dialJurosEua.value()))
        self.ui.dialJurosBr.valueChanged.connect(
            lambda: self.ui.doubleSpinBox_jurosBR.setValue(self.ui.dialJurosBr.value()))
        
    def tabVisible(self, ix):
        self.ui.Welcome.setTabVisible(ix, False)

    def irTabUser(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionUserProfile.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(0))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionUserProfile.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(0, True))
            self.ui.actionUserProfile.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(0))

    def irTabSummarizer(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionSummarizer.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(9))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionSummarizer.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(9, True))
            self.ui.actionSummarizer.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(9))

    def irTabDashboard(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionDashboard.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(1))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionDashboard.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(1, True))
            self.ui.actionDashboard.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(1))

    def irTabLab(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionLab.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(2))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionLab.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(2, True))
            self.ui.actionLab.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(2))

    def irTabPrecification(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionDefault_Asset.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(3))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionDefault_Asset.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(3, True))
            self.ui.actionDefault_Asset.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(3))

    def irTabProbability(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionProbability.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(4))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionProbability.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(4, True))
            self.ui.actionProbability.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(4))

    def irTabSheet(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionImport_Sheet.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(5))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionImport_Sheet.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(5, True))
            self.ui.actionImport_Sheet.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(5))
        self.ui.pushButton_BrowseFile.clicked.connect(
            lambda: self.fileBrowser())
        self.ui.label_path.setText("Ok!")

    def irTabChart(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionChart.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(6))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionChart.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(6, True))
            self.ui.actionChart.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(6))

    def interestChanged(self):
        self.worker.juros_br = self.ui.comboBox.currentText()

    def dropBoxInterest(self):
        self.ui.AutoInterestRadioButton.toggled.connect(
            lambda: self.ui.comboBox.setEnabled(True))
        self.ui.ManualInterestRadioButton.toggled.connect(
            lambda: self.ui.comboBox.setEnabled(False))

    def irTabNewIndicator(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionIndicator.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(7))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionIndicator.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(7, True))
            self.ui.actionIndicator.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(7))

    def irTabSynthAsset(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionSynthetic_Asset.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(8))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionSynthetic_Asset.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(8, True))
            self.ui.actionSynthetic_Asset.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(8))

    def irTabPythonEditor(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionOpen_Python_Editor.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(10))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionOpen_Python_Editor.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(10, True))
            self.ui.actionOpen_Python_Editor.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(10))

    def irTabLoadIndicator(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionOpen_Indicator.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(11))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionOpen_Indicator.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(11, True))
            self.ui.actionOpen_Indicator.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(11))

    def irTabConfiguration(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionConfiguration.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(12))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionConfiguration.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(12, True))
            self.ui.actionConfiguration.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(12))

    def irTabPreferences(self):
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionPreferences.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(13))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionPreferences.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(13, True))
            self.ui.actionPreferences.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(13))
    def irTabAbout(self):
        self.extbtn=QPushButton()
        if self.ui.Welcome.isVisible() == True:
            self.ui.actionAbout.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(14))
        elif self.ui.Welcome.isVisible() == False:
            self.ui.actionAbout.triggered.connect(
                lambda: self.ui.Welcome.setTabVisible(14, True))
            self.ui.actionAbout.triggered.connect(
                lambda: self.ui.Welcome.setCurrentIndex(14))
        self.ui.Welcome.tabBar().setTabButton(
            16, self.ui.Welcome.tabBar().ButtonPosition.RightSide, self.extbtn)

    def sair2(self):
        self.ui.actionQuit.triggered.connect(
            QApplication.instance().quit)

    def fileBrowser(self):
        QFileDialog.getOpenFileName(
            self,
            "Open File",
            "",
            "All Files (*);; Excel Files (*.xls);; Excel Files (*.xlsm)",
        )

    def incializarSemTabs(self):
        self.ui.Welcome.setTabsClosable(True)       
        i=0
        for i in range(self.ui.Welcome.count()):
            self.ui.Welcome.setTabVisible(i, False)  
            i+=1       


###########################################################################################
# MAIN###########################################################################################
app = QApplication(sys.argv)

start = login_window()
start.show()

sys.exit(app.exec())
# MAIN###########################################################################################
