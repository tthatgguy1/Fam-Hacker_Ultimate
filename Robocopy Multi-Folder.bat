SET "COLOR_CALL=ON"
    IF /I "%COLOR_CALL%"=="ON" (
        CALL "%~dp0Call Files\Safe Color Set - Missing Only.bat"
    )
SET "FAM_HACKER_INTRO=OFF"
    IF /I "%FAM_HACKER_INTRO%"=="ON" (
        CALL "%~dp0Call Files\Fam-Hacker_Client_Intro.bat"
    )
    CLS
SET "COPYx1=ON"
    IF /I "%COPYx1%"=="ON" (
        SETLOCAL EnableDelayedExpansion
            REM ================================================================
            REM Destination root
            REM Selected source folders are processed individually
            REM ================================================================

        SET "DEST_FOLDER=X:\Media_Vault\TV Shows\Young Sheldon"
        SET "MOVE_FILES=ON"
            SET "MOVE_FILES_SWITCH="
                IF /I "!MOVE_FILES!"=="ON" (
                    SET "MOVE_FILES_SWITCH=/MOVE"
                )
        SET "LOLCAT=ON"
            FOR %%S IN (
                "X:\Media_Vault\TV Shows\The Big Bang Theory\Young Sheldon (2017) Season 6 S06 (1080p BluRay x265 HEVC 10bit AAC 5.1 Vyndros)"
            ) DO (
                CALL :COPYx1_ROBOCOPY "%%~S"
            )
        ENDLOCAL
    )
    GOTO :END
    :COPYx1_ROBOCOPY
        SETLOCAL
        SET "SOURCE_FOLDER=%~1"
        FOR %%A IN ("%SOURCE_FOLDER%") DO (
            SET "FOLDER_NAME=%%~nxA"
        )
        IF /I "%LOLCAT%"=="ON" (
            ROBOCOPY ^
                "%SOURCE_FOLDER%" ^
                "%DEST_FOLDER%\%FOLDER_NAME%" ^
                /E ^
                /J ^
                %MOVE_FILES_SWITCH% ^
                /MT:6 ^
                /R:5 ^
                /W:5 | lolcat --seed 75
        ) ELSE (
            ROBOCOPY ^
                "%SOURCE_FOLDER%" ^
                "%DEST_FOLDER%\%FOLDER_NAME%" ^
                /E ^
                /J ^
                %MOVE_FILES_SWITCH% ^
                /MT:6 ^
                /R:5 ^
                /W:5
        )
        SET "ROBOCOPY_EXIT=%ERRORLEVEL%"
        ENDLOCAL & EXIT /B %ROBOCOPY_EXIT%