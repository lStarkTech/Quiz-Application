import sys
import os
from PyQt6.QtGui import QGuiApplication, QIcon
from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtCore import QUrl
from backend import BackEnd

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
dir_music = trova_file("./music/background.wav")

percorso = trova_file("./qml/main.qml")
engine = QQmlApplicationEngine()
backend = BackEnd()
engine.rootContext().setContextProperty("backend", backend)
engine.rootContext().setContextProperty("musicPath", QUrl.fromLocalFile(dir_music).toString())
engine.quit.connect(app.quit)
engine.load(percorso)
if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec())
