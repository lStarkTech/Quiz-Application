import sys
import os
from PyQt6.QtCore import QObject, pyqtSlot
from PyQt6.QtGui import QGuiApplication, QIcon
from PyQt6.QtQml import QQmlApplicationEngine

def trova_file(nome_file):
    """
    Se l'app è un .exe, cerca nella cartella segreta _MEIPASS.
    Altrimenti, cerca nella cartella normale di VS Code.
    """
    if hasattr(sys, '_MEIPASS'):
        return os.path.join(sys._MEIPASS, nome_file)
    return os.path.join(os.path.abspath("."), nome_file)

app = QGuiApplication(sys.argv)
app.setWindowIcon(QIcon(trova_file("./images/icon.ico")))

percorso = trova_file("main.qml")
engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load(percorso)
if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec())
