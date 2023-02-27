@echo off
:inicio
title AlgoriusMake
pyside6-uic login.ui -o ui_login.py
echo ----------------------done with login----------------------
pyside6-uic form.ui -o ui_form.py
echo ----------------------done with form----------------------
pyside6-uic load.ui -o ui_load.py
echo ----------------------done with load----------------------
pyside6-uic register.ui -o ui_register.py
echo ----------------------done with register----------------------
pyside6-rcc .\rsc.qrc -o .\rsc_rc.py
echo ----------------------done with rsc_rc----------------------
set /p choice= "Continuar?" 
if %choice%== 1 (goto inicio) else (pause)