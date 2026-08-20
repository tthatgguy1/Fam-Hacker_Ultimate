@ECHO OFF
SETLOCAL DisableDelayedExpansion
SET "COLOR_CALL=ON"
    IF /I "%COLOR_CALL%"=="ON" (
        CALL "%~dp0Call Files\Safe Color Set - Missing Only.bat"
    )

SET "FAM_HACKER_INTRO=OFF"
    IF /I "%FAM_HACKER_INTRO%"=="ON" (
        CALL "%~dp0Call Files\Fam-Hacker_Client_Intro.bat"
    )
    CLS

SET "MKV_FILE=X:\Media_Vault\TV Shows\House {10-bit x265 NFS}\Season - 02\House, M.D. - S02E21 - Euphoria Part 2.mkv"
    FOR %%A IN ("%MKV_File%") DO (
        SET "MKV_FILE_NAME=%%~nxA"
    )
    FOR %%A IN ("%MKV_FILE%") DO (
        SET "MKV_FILE_NAME_ONLY=%%~nA"
    )

SET "CHAPTERS_FILE=X:\NFS Code Center\Chapters\House\House - Season 02\House, M.D. - S02E21 - Euphoria Part 2.txt"
    FOR %%A IN ("%CHAPTERS_FILE%") DO (
        SET "CHAPTERS_FILE_NAME=%%~nxA"
    )
    FOR %%A IN ("%CHAPTERS_FILE%") DO (
        SET "CHAPTERS_FILE_NAME_ONLY=%%~nA"
    )
SET "PING_SECONDS=3"
:FAILSAFES
    WHERE mkvpropedit >nul 2>&1
        IF ERRORLEVEL 1 (
            ECHO.
            ECHO ============================================================
            ECHO Error: mkvpropedit not found or not accessible.
            ECHO ============================================================
            ECHO.
            GOTO :PROP_END
        )
        IF NOT EXIST "%MKV_FILE%" (
            ECHO.
            ECHO ============================================================
            ECHO Error: 
            ECHO MKV file not found.
            ECHO %MKV_FILE%
            ECHO ============================================================
            ECHO.
            GOTO :PROP_END
        )
        IF NOT EXIST "%CHAPTERS_FILE%" (
            ECHO.
            ECHO ============================================================
            ECHO Error: 
            ECHO Chapters file not found.
            ECHO %CHAPTERS_FILE%
            ECHO ============================================================
            ECHO.
            GOTO :PROP_END
        )
        IF NOT "%MKV_FILE_NAME_ONLY%"=="%CHAPTERS_FILE_NAME_ONLY%" (
            ECHO.
            ECHO ============================================================
            ECHO Error: 
            ECHO The MKV file name does not match the chapters file name,
            ECHO which may lead to incorrect chapter placement for
            ECHO %MKV_FILE_NAME%
            ECHO ============================================================
            ECHO.
            GOTO :PROP_END
        )
:PROP_EDIT
    CLS
    ECHO.
    ECHO %COLOR_GOLDMINER%============================================================%COLOR_RESET%
    ECHO %COLOR_IRONMINER%Now adding chapters to the%COLOR_RESET% %COLOR_GOLDMINER%MKV%COLOR_RESET% file%COLOR_GOLDMINER%:%COLOR_RESET%
    ECHO %COLOR_SLB_BLUE%%CHAPTERS_FILE_NAME%%COLOR_RESET%
    ECHO %COLOR_GOLDMINER%+%COLOR_RESET%
    ECHO %COLOR_SLB_GREEN%%MKV_FILE_NAME%%COLOR_RESET%
    ECHO %COLOR_GOLDMINER%============================================================%COLOR_RESET%
    ECHO.

    PING localhost -n %PING_SECONDS% >nul
    mkvpropedit ^
        "%MKV_FILE%" ^
        --chapters ^
        "%CHAPTERS_FILE%" | lolcat --seed 75
        SET "MKV_EXIT_CODE=%ERRORLEVEL%"
            IF NOT "%MKV_EXIT_CODE%"=="0" (
                ECHO.
                ECHO %COLOR_GOLDMINER%============================================================%COLOR_RESET%
                ECHO Error:
                ECHO mkvpropedit failed with exit code %MKV_EXIT_CODE%.
                ECHO %COLOR_GOLDMINER%============================================================%COLOR_RESET%
                ECHO.
            ) ELSE (
                ECHO.
                ECHO %COLOR_GOLDMINER%============================================================%COLOR_RESET%
                ECHO %COLOR_IRONMINER%Chapters added successfully to the%COLOR_RESET% %COLOR_GOLDMINER%MKV%COLOR_RESET% file.
                ECHO %MKV_FILE_NAME% | lolcat -a -d 40 -s 10
                ECHO %COLOR_GOLDMINER%============================================================%COLOR_RESET%
                ECHO.
            )
        GOTO :PROP_END
:PROP_END