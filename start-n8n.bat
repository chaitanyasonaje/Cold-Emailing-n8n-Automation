@echo off
title Starting n8n Automation Engine...
echo ===================================================
echo   Starting n8n Automation (No Docker Required)
echo   Database: D:\Automation\DockerData\n8n Data
echo   URL: http://localhost:5678
echo ===================================================
echo.

set N8N_USER_FOLDER=d:\Automation\DockerData\n8n Data
n8n start
pause
