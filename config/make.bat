@echo off
echo --- Compiling %1.asm ---
tasm %1.asm
if errorlevel 1 goto end
echo --- Linking %1.obj ---
tlink %1.obj
echo --- Done. %1.exe created. ---
:end
