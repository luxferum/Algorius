@echo off
:inicio
title AlgoriusMake
cd "C:\Users\eduar\OneDrive\Documentos\MS Algorius\Algorius\front\algorius"
pyside6-uic login1.ui -o ui_login1.py
echo ----------------------done with login1----------------------
pyside6-uic form.ui -o ui_form.py
echo ----------------------done with form----------------------
pyside6-uic load1.ui -o ui_load1.py
echo ----------------------done with load 1----------------------
pyside6-uic register.ui -o ui_register.py
echo ----------------------done with register----------------------
pyside6-rcc .\rsc.qrc -o .\rsc_rc.py
echo ----------------------done with rsc_rc----------------------
set /p choice= "Continuar?" 
if %choice%== 1 (goto inicio) else (pause)