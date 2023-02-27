@echo off
:inicio
title AlgoriusMake
pyside6-uic .\front\login.ui -o .\src\ui_login.py
echo ----------------------done with login----------------------
pyside6-uic .\front\form.ui -o .\src\ui_form.py
echo ----------------------done with form----------------------
pyside6-uic .\front\load.ui -o .\src\ui_load.py
echo ----------------------done with load----------------------
pyside6-uic .\front\register.ui -o .\src\ui_register.py
echo ----------------------done with register----------------------
pyside6-rcc .\front\rsc.qrc -o .\src\rsc_rc.py
echo ----------------------done with rsc_rc----------------------
set /p choice= "Continuar?" 
if %choice%== 1 (goto inicio) else (pause)