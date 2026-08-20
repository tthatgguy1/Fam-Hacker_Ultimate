:: <───── Rare Logo ─────> ::
    @ECHO OFF
    SETLOCAL
    TITLE Aria2c Torrent Downloader

:: <───── Configuration ─────> ::
    REM Change this to the desired download folder.
    SET "DOWNLOAD_DIR=X:\Media_Vault\TV Shows\The Big Bang Theory"

    REM Folder where you place .torrent files.
    SET "WATCH_DIR=X:\NFS Code Center\Torrent Watcher"

    REM Successfully processed .torrent files go here.
    SET "COMPLETED_DIR=X:\NFS Code Center\Torrents\Completed Torrent Downloads"

    REM Failed .torrent files go here.
    SET "FAILED_DIR=X:\NFS Code Center\Torrents\Failed Torrent Downloads"

:: <───── Find Aria2c ─────> ::
    WHERE aria2c.exe >nul 2>&1

        IF %ERRORLEVEL% EQU 0 (
            SET "ARIA2=aria2c.exe"
        ) ELSE (
        IF EXIST "%~dp0aria2c.exe" (
            SET "ARIA2=%~dp0aria2c.exe"
        ) ELSE (
        ECHO.
        ECHO %COLOR_GOLDMINER%====================================================%COLOR_RESET%
        ECHO ERROR: %COLOR_GOLDMINER%aria2c.exe%COLOR_RESET% %COLOR_IRONMINER%was not found%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
        ECHO %COLOR_GOLDMINER%====================================================%COLOR_RESET%
        ECHO.
        ECHO Either:
        ECHO.
        ECHO   1. Add aria2c.exe to your Windows PATH
        ECHO.
        ECHO OR
        ECHO.
        ECHO   2. Put aria2c.exe in the same folder as this BAT.
        ECHO.
        ECHO
        EXIT /B 1
    )
)

:: <───── Create Required Folders ─────> ::
    IF NOT EXIST "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"
    IF NOT EXIST "%WATCH_DIR%" mkdir "%WATCH_DIR%"
    IF NOT EXIST "%COMPLETED_DIR%" mkdir "%COMPLETED_DIR%"
    IF NOT EXIST "%FAILED_DIR%" mkdir "%FAILED_DIR%"

:: <───── Menu ─────> ::
    :MENU
        CLS

        ECHO %COLOR_GOLDMINER%============================================================%COLOR_RESET%
        ECHO                 ARIA2C TORRENT DOWNLOADER
        ECHO %COLOR_GOLDMINER%============================================================%COLOR_RESET%
        ECHO.
        ECHO Download folder:
        ECHO   %DOWNLOAD_DIR%
        ECHO.
        ECHO Torrent watch folder:
        ECHO   %WATCH_DIR%
        ECHO.
        ECHO ------------------------------------------------------------
        ECHO.
        ECHO [1] Scan Watch folder for .torrent files
        ECHO [2] Download from magnet link
        ECHO [3] Exit
        ECHO.
        CHOICE ^
         /C ^
         123 ^
         /N ^
         /M ^
         "Select an option: "
            IF ERRORLEVEL 3 GOTO :EXIT
            IF ERRORLEVEL 2 GOTO :MAGNET
            IF ERRORLEVEL 1 GOTO :SCAN

:: <───── Scan Torrent Watch Folder ─────> ::
    :SCAN
        CLS

        ECHO ============================================================
        ECHO Scanning torrent watch folder...
        ECHO ============================================================
        ECHO.
        ECHO %WATCH_DIR%
        ECHO.

        DIR /B /A-D "%WATCH_DIR%\*.torrent" >nul 2>&1

            IF ERRORLEVEL 1 (
                ECHO No .torrent files were found.
                ECHO.
                PAUSE
                GOTO :MENU
            )

            FOR %%F IN ("%WATCH_DIR%\*.torrent") DO (
                CALL :PROCESS_TORRENT "%%~fF"
            )

        ECHO.
        ECHO ============================================================
        ECHO Scan finished.
        ECHO ============================================================
        ECHO.
        PAUSE
        GOTO :MENU

:: <───── Process One Torrent ─────> ::
    :PROCESS_TORRENT

        SET "TORRENT=%~1"

        ECHO ------------------------------------------------------------
        ECHO Torrent:
        ECHO %~nx1
        ECHO ------------------------------------------------------------
        ECHO.

        "%ARIA2%" ^
         --dir="%DOWNLOAD_DIR%" ^
         --summary-interval=0 ^
         --continue=true ^
         --seed-time=0 ^
         --check-integrity=true ^
        "%TORRENT%" | lolcat --seed 75

:: <───── Aria2c Error Handling ─────> ::
    SET "ARIA_EXIT=%ERRORLEVEL%"

    ECHO.

        IF "%ARIA_EXIT%"=="0" (
            ECHO Download completed successfully.
            ECHO Moving torrent to Completed...
            MOVE /Y "%TORRENT%" "%COMPLETED_DIR%\" >nul

            IF ERRORLEVEL 1 (
                ECHO WARNING: Could not move torrent file.
            )
            ) else (
                ECHO Download failed.
                ECHO aria2c exit code: %ARIA_EXIT%
                ECHO Moving torrent to Failed...
                MOVE /Y "%TORRENT%" "%FAILED_DIR%\" >nul

            IF ERRORLEVEL 1 (
                ECHO WARNING: Could not move torrent file.
            )
        )

    ECHO.
    EXIT /B

:: <───── Process Magnet Download ─────> ::
    :MAGNET
        CLS

        ECHO ============================================================
        ECHO                    MAGNET DOWNLOAD
        ECHO ============================================================
        ECHO.
        ECHO Paste a magnet link below.
        ECHO.
        ECHO Leave it blank and press ENTER to return to the menu.
        ECHO.

        SET "MAGNET="
        SET /P "MAGNET=Magnet: "

        IF NOT DEFINED MAGNET GOTO :MENU

        ECHO.
        ECHO ============================================================
        ECHO Starting magnet download...
        ECHO ============================================================
        ECHO.

        "%ARIA2%" ^
         --dir="%DOWNLOAD_DIR%" ^
         --summary-interval=0 ^
         --continue=true ^
         --seed-time=0 ^
         --check-integrity=true ^
        "%MAGNET%" | lolcat --seed 75

        SET "ARIA_EXIT=%ERRORLEVEL%"

        ECHO.

            IF "%ARIA_EXIT%"=="0" (
                ECHO ========================================================
                ECHO Download completed successfully.
                ECHO ========================================================
            ) ELSE (
                ECHO ========================================================
                ECHO Download failed.
                ECHO aria2c exit code: %ARIA_EXIT%
                ECHO ========================================================
            )

        ECHO.
        PAUSE
        GOTO MENU

:: <───── Exit ─────> ::
    :EXIT
        ECHO.
        ECHO Exiting...
        ENDLOCAL
        EXIT /B