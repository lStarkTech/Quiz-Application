from __future__ import annotations

import ctypes
from ctypes import wintypes

from PyQt6.QtCore import QObject, QTimer, pyqtSlot


class BackEnd(QObject):
    def __init__(self):
        super().__init__()
        self._punish_timer = QTimer(self)
        self._punish_timer.setInterval(5000)
        self._punish_timer.timeout.connect(self._turn_off_monitor)
    
    def _turn_off_monitor(self) -> None:
        """
        Tenta di mettere in "sospensione" il display (spegnimento monitor).
        Su Windows usa HWND_BROADCAST + SC_MONITORPOWER.
        """
        try:
            user32 = ctypes.WinDLL("user32", use_last_error=True)

            SendMessageW = user32.SendMessageW
            SendMessageW.argtypes = [wintypes.HWND, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM]
            SendMessageW.restype = wintypes.LRESULT

            GetDesktopWindow = user32.GetDesktopWindow
            GetDesktopWindow.argtypes = []
            GetDesktopWindow.restype = wintypes.HWND

            WM_SYSCOMMAND = 0x0112
            SC_MONITORPOWER = 0xF170
            MONITOR_OFF = 2

            # 1) Tentativo sul desktop window (spesso più affidabile)
            SendMessageW(GetDesktopWindow(), WM_SYSCOMMAND, SC_MONITORPOWER, MONITOR_OFF)

            # 2) Fallback broadcast
            HWND_BROADCAST = wintypes.HWND(0xFFFF)
            SendMessageW(HWND_BROADCAST, WM_SYSCOMMAND, SC_MONITORPOWER, MONITOR_OFF)
        except Exception:
            # Fallback estremo: blocca la sessione (almeno oscura lo schermo).
            try:
                user32 = ctypes.WinDLL("user32", use_last_error=True)
                LockWorkStation = user32.LockWorkStation
                LockWorkStation.argtypes = []
                LockWorkStation.restype = wintypes.BOOL
                LockWorkStation()
            except Exception:
                return

    @pyqtSlot()
    def start_screen_sleep_loop(self) -> None:
        if not self._punish_timer.isActive():
            self._turn_off_monitor()
            self._punish_timer.start()

    @pyqtSlot()
    def stop_screen_sleep_loop(self) -> None:
        if self._punish_timer.isActive():
            self._punish_timer.stop()

    @pyqtSlot(str, str, result=bool)
    def submit_answer(self, answer: str, correct_answer: str) -> bool:
        """
        Ritorna True se la risposta è corretta.
        Se errata, avvia lo spegnimento schermo ogni 5s finché non arriva quella giusta.
        """
        normalized = (answer or "").strip().lower()
        target = (correct_answer or "").strip().lower()

        if normalized == target and target != "":
            self.stop_screen_sleep_loop()
            return True

        self.start_screen_sleep_loop()
        return False