import sys
from PyQt6.QtCore import QSize
from PyQt6.QtWidgets import QApplication, QWidget, QPushButton, QMainWindow

app = QApplication(sys.argv)

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Truth Finder")
        self.setMinimumSize(QSize(600, 400))
        button = QPushButton("Inizia Partita")
        button.setCheckable(True)
        button.clicked.connect(self.button_clicked)
        self.setMenuWidget(button)

    def button_clicked(self):
        print("New Game Start")

window = MainWindow()
window.show()

#in this case every element of the application, comprehending
#the window is just a widget

#every widget is created but hidden initially, the show indicates to show it
#all widgets without parents are windows
#window = QMainWindow()
#window.show()
#window1 = QWidget()
#window1.show()

#the application gets executed to show everything on screen
app.exec()


