:FAM-HACKER_CLIENT
 @ECHO OFF
 REM                       ███████╗╔█████╗─███╗───███╗─██╗──██╗╔█████╗─╔██████╗██╗──██╗██████╗─
 REM                       ██╔════╝██╔══██╗████╗─████║─██║──██║██╔══██╗██╔════╝██║─██╔╝██╔══██╗─
 REM                       █████╗──███████║██╔████╔██║─███████║███████║██║─────█████╔╝─██████╔╝─
 REM                       ██╔══╝──██╔══██║██║╚██╔╝██║─██╔══██║██╔══██║██║─────██╔═██╗─██╔══██╗─
 REM                       ██║─────██║──██║██║─╚═╝─██║─██║──██║██║──██║╚██████╗██║──██╗██║──██║─
 REM                       ╚═╝─────╚═╝──╚═╝╚═╝─────╚═╝─╚═╝──╚═╝╚═╝──╚═╝─╚═════╝╚═╝──╚═╝╚═╝──╚═╝─
 REM                                ╔██████╗██╗─────██╗███████╗███╗───██╗████████╗─
 REM                                ██╔════╝██║─────██║██╔════╝████╗──██║╚══██╔══╝─
 REM                                ██║─────██║─────██║█████╗──██╔██╗─██║───██║─
 REM                                ██║─────██║─────██║██╔══╝──██║╚██╗██║───██║─
 REM                                ╚██████╗███████╗██║███████╗██║─╚████║───██║─
 REM                                 ╚═════╝╚══════╝╚═╝╚══════╝╚═╝──╚═══╝───╚═╝─
 REM                     ----------------------------Nah-Fam_Studios----------------------------
:RAR2
    SETLOCAL DisableDelayedExpansion
    SET "EXTERNAL_CMD=OFF"
        IF /I "%EXTERNAL_CMD%"=="ON" (
            IF /I NOT "%~1"=="__RAR_NEW_WINDOW__" (
                START "Rar Ultimate" "%ComSpec%" /K ""%~f0" __RAR_NEW_WINDOW__"
                EXIT /B
            )
            SHIFT
        )
    SET "COLOR_CALL=ON"
        IF /I "%COLOR_CALL%"=="ON" (
            CALL "%~dp0Call Files\Safe Color Set - Missing Only.bat"
        )
    SET "FAM_HACKER_INTRO=ON"
        IF /I "%FAM_HACKER_INTRO%"=="ON" (
            CALL "%~dp0Call Files\Fam-Hacker_Client_Intro.bat"
        )
        CLS
    SET "SIGNATURE=Seth J. Nelson"
    SET "SIGNATURE2=Nah-Fam_Studios 2026"
    SET "RAR_PATH="
        FOR %%A IN ("%RAR_PATH%") DO (
            SET "RAR_PATH_NAME=%%~nxA"
            )
    SET "DEST_FOLDER="
        FOR %%A IN ("%DEST_FOLDER%") DO (
                SET "DEST_FOLDER_NAME=%%~nxA"
                )
    SET "ARCHIVE_NAME="
        IF NOT EXIST "%DEST_FOLDER%\" (
            MKDIR "%DEST_FOLDER%"
        )
        SET "DEST_PATH=%DEST_FOLDER%\%ARCHIVE_NAME%.rar"
            FOR %%A IN ("%DEST_PATH%") DO (
                SET "DEST_PATH_NAME=%%~nxA"
                )
    SET "PASSWORD_SET=ON"
        SET "PASSWORD=CHANGE_THIS_PASSWORD"
        SET "PASSWORD_SWITCH="
        IF /I "%PASSWORD_SET%"=="ON" (
            IF "%PASSWORD%"=="CHANGE_THIS_PASSWORD" (
                ECHO.
                ECHO %COLOR_GOLDMINER%===========================================================
                ECHO %COLOR_IRONMINER%You must replace %COLOR_GOLDMINER%CHANGE_THIS_PASSWORD%COLOR_RESET% %COLOR_IRONMINER%before continuing.%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%===========================================================
                ECHO.
                GOTO :RAR_FINISH
            )
            SET "PASSWORD_SWITCH=-hp%PASSWORD%"
        )
    SET "JPG_MERGE_SET=ON"
        SET "JPG_FILE="
            FOR %%A IN ("%JPG_FILE%") DO (
                    SET "JPG_FILE_NAME_ONLY=%%~nxA"
                )
            SET "OUTPUT_JPG=%DEST_FOLDER%\%ARCHIVE_NAME%.jpg"
                FOR %%A IN ("%OUTPUT_JPG%") DO (
                    SET "JPG_NAME_ONLY=%%~nxA"
                )
        SET "DELETE_NEWRAR=ON"
        SET "DELETE_SOURCE_JPG=ON"
    SET "MERGE_ONLY=OFF"
        IF /I "%MERGE_ONLY%"=="ON" (
            GOTO :MERGE
        )
    SET "LOG_FILE=ON"
        SET "ADD_LOG_TO_ARCHIVE=ON"
            IF /I "%ADD_LOG_TO_ARCHIVE%"=="ON" (
                SET "RE_COMPRESSION=-m0"
            )
        SET "LOG_FILE_DEST=X:\Visual-Studio Code\Logz\WinRAR Logz"
        SET "RAR_LOG=%LOG_FILE_DEST%\%ARCHIVE_NAME% - WinRAR.log"
            FOR %%A IN ("%RAR_LOG%") DO (
                    SET "RAR_LOG_NAME_ONLY=%%~nxA"
                )
        SET "LOG_FILE_SWITCH="
            IF /I "%LOG_FILE%"=="ON" (
                SET LOG_FILE_SWITCH="-logaf=%RAR_LOG%"
            )
        SET "LOG_FILE_FOLDER=ON"
            SET "LOG_FOLDER_NAME=%ARCHIVE_NAME% - Log File"
            SET "LOG_FILE_FOLDER_SWITCH="
                IF /I "%LOG_FILE_FOLDER%"=="ON" (
                    SET LOG_FILE_FOLDER_SWITCH=-ap"%LOG_FOLDER_NAME%"
                )
    SET "ADD_FILES=ON"
        SET "ADD_FILES_SWITCH="
            IF /I "%ADD_FILES%"=="ON" (
                SET "ADD_FILES_SWITCH=a"
            )
            IF /I NOT "%ADD_FILES%"=="ON" GOTO :RAR_FINISH
    SET "COMPRESSION=-m5"
    SET "WIPE_FILES=OFF"
        SET "WIPE_SWITCH="
            IF /I "%WIPE_FILES%"=="ON" (
                SET "WIPE_SWITCH=-dw"
            )
    SET "RECURSE_SUBD=ON"
        SET "RECURSE_SUBD_SWITCH="
            IF /I "%RECURSE_SUBD%"=="ON" (
                SET "RECURSE_SUBD_SWITCH=-r"
            )
    SET "DEL_FOLDER=OFF"
    SET "PING_SECONDS=4"
    SET "EXC_PATHS_FROM_NAMES=ON"
        SET "EXC_PATHS_SWITCH="
            IF /I "%EXC_PATHS_FROM_NAMES%"=="ON" (
                SET "EXC_PATHS_SWITCH=-ep"
            )
    SET "TEST_FILES=ON"
        SET "TEST_SWITCH="
            IF /I "%TEST_FILES%"=="ON" (
                SET "TEST_SWITCH=-t"
            )
    SET "CLEAR_ARCHIVE_ATTRIBUTES=OFF"
        SET "CLEAR_ATTRIBUTES_SWITCH="
            IF /I "%CLEAR_ARCHIVE_ATTRIBUTES%"=="ON" (
                SET "CLEAR_ATTRIBUTES_SWITCH=-ac"
            )
    SET "VOLUME_SET=OFF"
        SET "VOLUME_AMOUNT=10g"
        SET "VOLUME_SET_SWITCH="
            IF /I "%VOLUME_SET%"=="ON" (
                SET "VOLUME_SET_SWITCH=-v%VOLUME_AMOUNT%"
            )
    SET "DICTIONARY_SET=ON"
        SET "DICTIONARY_AMOUNT=1g"
        SET "DICTIONARY_SET_SWITCH="
            IF /I "%DICTIONARY_SET%"=="ON" (
                SET "DICTIONARY_SET_SWITCH=-md%DICTIONARY_AMOUNT%"
            )
    SET "ADD_COMMENT=ON"
        SET "COMMENTS_SWITCH="
            IF /I "%ADD_COMMENT%"=="ON" (
                SET "COMMENTS_SWITCH=-z"
            )
        SET "COMMENT_FOLDER=X:\The Interface\Nah-Fam_Studios WinRAR Logz"
            IF NOT EXIST "%COMMENT_FOLDER%\" (
                MKDIR "%COMMENT_FOLDER%"
            )
            FOR /F "delims=" %%A IN ('TIME /T') DO SET "TIMENOW=%%A"
            FOR /F "delims=" %%A IN ('DATE /T') DO SET "DATENOW=%%A"
            FOR %%A IN ("%COMMENT_FOLDER%") DO (
                    SET "COMMENT_FOLDER_NAME_ONLY=%%~nxA"
                )
        SET "COMMENT_FILE=%COMMENT_FOLDER%\WinComment.txt"
         (
         ECHO Archive setting for -
         ECHO %ARCHIVE_NAME%
         ECHO %TIMENOW%, %DATENOW%
         ECHO.
         ECHO ==============================================================
         ECHO Add Files: %ADD_FILES%
         ECHO Exclude Paths From Names: %EXC_PATHS_FROM_NAMES%
         ECHO Recurse SUBD: %RECURSE_SUBD%
         ECHO Password Set: %PASSWORD_SET%
         ECHO JPG Merge: %JPG_MERGE_SET%
         ECHO Compression: %COMPRESSION%
         ECHO Re-Compression: %RE_COMPRESSION%
         ECHO Volume Set: %VOLUME_SET% - %VOLUME_AMOUNT%
         ECHO Dictionary Set: %DICTIONARY_SET% - %DICTIONARY_AMOUNT%
         ECHO File Test: %TEST_FILES%
         ECHO Original Files Wiped: %WIPE_FILES%
         ECHO Source Folder Deleted: %DEL_FOLDER%
         ECHO Clear Archive Attr: %CLEAR_ARCHIVE_ATTRIBUTES%
         ECHO New RAR Delete: %DELETE_NEWRAR% - %DEST_PATH_NAME%
         ECHO Original JPG File: %JPG_FILE_NAME_ONLY%
         ECHO Merge JPG Output: %JPG_NAME_ONLY%
         ECHO.
         ECHO %SIGNATURE%
         ECHO %SIGNATURE2%
         ECHO ==============================================================
         ) > "%COMMENT_FILE%"
         IF NOT EXIST "%COMMENT_FILE%" (
            ECHO.
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            ECHO %COLOR_IRONMINER%Unable to create the temporary comment file%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
            ECHO %COLOR_SLB_GREEN%"%COMMENT_FILE%"%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            GOTO :RAR_FINISH
         )

:FAILSAFES
    WHERE rar >nul 2>&1
        IF ERRORLEVEL 1 (
            ECHO.
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%RAR%COLOR_RESET% %COLOR_IRONMINER%was not found in the Windows PATH%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            ECHO.
            GOTO :RAR_FINISH
        )
        IF NOT EXIST "%RAR_PATH%\" (
            ECHO.
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            ECHO %COLOR_GOLDMINER_BLINK%Source folder%COLOR_RESET% %COLOR_IRONMINER%was not found%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
            ECHO %COLOR_SLB_GREEN%"%RAR_PATH_NAME%"%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            ECHO.
            GOTO :RAR_FINISH
        )
        IF NOT EXIST "%DEST_FOLDER%\" (
            ECHO.
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            ECHO %COLOR_GOLDMINER_BLINK%Destination folder%COLOR_RESET% %COLOR_IRONMINER%was not found%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
            ECHO %COLOR_SLB_GREEN%"%DEST_FOLDER_NAME%"%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            ECHO.
            GOTO :RAR_FINISH
        )
        IF NOT EXIST "%COMMENT_FOLDER%\" (
            ECHO.
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%Comment folder%COLOR_RESET% %COLOR_IRONMINER%was not found%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
            ECHO %COLOR_SLB_GREEN%"%COMMENT_FOLDER_NAME_ONLY%"%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
            ECHO.
            GOTO :RAR_FINISH
        )
        IF /I "%ADD_LOG_TO_ARCHIVE%"=="ON" (
            IF /I "%VOLUME_SET%"=="ON" (
                ECHO.
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%Log embedding%COLOR_RESET% %COLOR_IRONMINER%cannot be used with %COLOR_GOLDMINER%split volumes%COLOR_RESET%%COLOR_IRONMINER%.%COLOR_RESET%
                ECHO %COLOR_IRONMINER%Set %COLOR_GOLDMINER%VOLUME_SET=OFF%COLOR_RESET% %COLOR_IRONMINER%or%COLOR_RESET% %COLOR_GOLDMINER%LOG_FILE=OFF%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO.
                GOTO :RAR_FINISH
            )
        )
        IF /I "%JPG_MERGE_SET%"=="ON" (
            IF /I "%VOLUME_SET%"=="ON" (
                ECHO.
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%JPG Merg%COLOR_RESET% %COLOR_IRONMINER%cannot be used with%COLOR_RESET% %COLOR_GOLDMINER%split volumes%COLOR_RESET%%COLOR_IRONMINER%.%COLOR_RESET%
                ECHO %COLOR_IRONMINER%Set %COLOR_GOLDMINER%VOLUME_SET=OFF%COLOR_RESET% %COLOR_IRONMINER%or%COLOR_RESET% %COLOR_GOLDMINER%JPG_MERGE_SET=OFF%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO.
                GOTO :RAR_FINISH
            )
            IF NOT EXIST "%JPG_FILE%" (
                ECHO.
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%JPG%COLOR_RESET% %COLOR_IRONMINER%file was not found%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
                ECHO %COLOR_SLB_GREEN%"%JPG_NAME_ONLY%"%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO.
                GOTO :RAR_FINISH
            )
            IF /I "%JPG_FILE%"=="%OUTPUT_JPG%" (
                ECHO.
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%JPG_FILE%COLOR_RESET% %COLOR_IRONMINER%and%COLOR_RESET% %COLOR_GOLDMINER%OUTPUT_JPG%COLOR_RESET% %COLOR_IRONMINER%cannot be identical%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO.
            GOTO :RAR_FINISH
            )
        )
        CD /D "%RAR_PATH%"
            IF ERRORLEVEL 1 (
                ECHO.
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO %COLOR_IRONMINER%Unable to enter the source folder%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
                ECHO %COLOR_SLB_GREEN%"%RAR_PATH_NAME%"%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%===================================================%COLOR_RESET%
                ECHO.
                DEL /Q "%COMMENT_FILE%" >nul 2>&1
                GOTO :RAR_FINISH
            )
:RAR_START
    CLS
    ECHO.
    ECHO %COLOR_GOLDMINER%===========================================%COLOR_RESET%
    ECHO %COLOR_GOLDMINER%RAR%COLOR_RESET% %COLOR_IRONMINER%will now add the selected files to the archive%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
    ECHO %COLOR_SLB_GREEN%"%RAR_PATH_NAME%"%COLOR_RESET%
    ECHO %COLOR_GOLDMINER%With the following archive settings.%COLOR_RESET%
    ECHO %COLOR_GOLDMINER%===========================================%COLOR_RESET%
        (
        ECHO Add Files: %ADD_FILES%
        ECHO Exclude Paths From Names: %EXC_PATHS_FROM_NAMES%
        ECHO Recurse SUBD: %RECURSE_SUBD%
        ECHO Password Set: %PASSWORD_SET%
        ECHO JPG Merge: %JPG_MERGE_SET%
        ECHO Compression: %COMPRESSION%
        ECHO Re-Compression: %RE_COMPRESSION%
        ECHO Volume Set: %VOLUME_SET% - %VOLUME_AMOUNT%
        ECHO Dictionary Set: %DICTIONARY_SET% - %DICTIONARY_AMOUNT%
        ECHO File Test: %TEST_FILES%
        ECHO Original Files Wiped: %WIPE_FILES%
        ECHO Source Folder Deleted: %DEL_FOLDER%
        ECHO Clear Archive Attr: %CLEAR_ARCHIVE_ATTRIBUTES%
        ECHO New RAR Delete: %DELETE_NEWRAR% - %DEST_PATH_NAME%
        ECHO Original JPG File: %JPG_FILE_NAME_ONLY%
        ECHO Merge JPG Output: %JPG_NAME_ONLY%
        ) | lolcat --seed 75
        ECHO %COLOR_GOLDMINER%============================================%COLOR_RESET%
        ECHO.
        PING localhost -n %PING_SECONDS% >nul
    rar ^
        %ADD_FILES_SWITCH% ^
        %RECURSE_SUBD_SWITCH% ^
        %CLEAR_ATTRIBUTES_SWITCH% ^
        %TEST_SWITCH% ^
        %WIPE_SWITCH% ^
        %DICTIONARY_SET_SWITCH% ^
        %VOLUME_SET_SWITCH% ^
        %COMPRESSION% ^
        %PASSWORD_SWITCH% ^
        %LOG_FILE_SWITCH% ^
        %COMMENTS_SWITCH%"%COMMENT_FILE%" ^
        "%DEST_PATH%" ^
        *.* | lolcat
        SET "RAR_EXIT_CODE=%ERRORLEVEL%"
        DEL /Q "%COMMENT_FILE%" >nul 2>&1
            IF NOT "%RAR_EXIT_CODE%"=="0" (
                ECHO.
                ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%RAR%COLOR_RESET% %COLOR_RED%failed%COLOR_RESET% %COLOR_IRONMINER%with exit code%COLOR_RESET% %COLOR_DARK_GREEN%%RAR_EXIT_CODE%%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%JPG Merge%COLOR_RESET% %COLOR_IRONMINER%and%COLOR_RESET% %COLOR_GOLDMINER%Folder Deletion%COLOR_RESET% %COLOR_IRONMINER%have been cancelled%COLOR_GOLDMINER%.%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
                GOTO :RAR_FINISH
            )
:RARLOG
    IF /I "%ADD_LOG_TO_ARCHIVE%"=="ON" (
        IF NOT EXIST "%RAR_LOG%" (
            ECHO.
            ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
            ECHO %COLOR_IRONMINER%WinRAR%COLOR_RESET% %COLOR_GOLDMINER%log file%COLOR_RESET% %COLOR_IRONMINER%was not found%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
            ECHO %COLOR_SLB_GREEN%"%RAR_LOG_NAME_ONLY%"%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
            ECHO.
            GOTO :RAR_FINISH
        )
        ECHO.
        ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
        ECHO %COLOR_IRONMINER%Adding the%COLOR_RESET% %COLOR_GOLDMINER%WinRAR log%COLOR_RESET% %COLOR_IRONMINER%to the archive%COLOR_RESET%%COLOR_GOLDMINER%....%COLOR_RESET%
        ECHO %COLOR_SLB_GREEN%"%RAR_LOG_NAME_ONLY%"%COLOR_RESET%
        ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
        ECHO.
        PING localhost -n %PING_SECONDS% >nul
    rar ^
        %ADD_FILES_SWITCH% ^
        %TEST_SWITCH% ^
        %RE_COMPRESSION% ^
        %PASSWORD_SWITCH% ^
        %EXC_PATHS_SWITCH% ^
        %LOG_FILE_FOLDER_SWITCH% ^
        "%DEST_PATH%" ^
        "%RAR_LOG%" | lolcat
            IF ERRORLEVEL 1 (
                ECHO.
                ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
                ECHO %COLOR_BRIGHTRED%Failed%COLOR_RESET% %COLOR_IRONMINER%to add the%COLOR_RESET% %COLOR_GOLDMINER%WinRAR log%COLOR_RESET% %COLOR_IRONMINER%to the archive%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%JPG Merg%COLOR_RESET% %COLOR_IRONMINER%and%COLOR_RESET% %COLOR_GOLDMINER%Folder Deletion%COLOR_RESET% %COLOR_IRONMINER%have been cancelled%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
                ECHO.
                GOTO :RAR_FINISH
            )   
    )
    PING localhost -n %PING_SECONDS% >nul
    ECHO.
    ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
    ECHO %COLOR_IRONMINER%Archive created %COLOR_GOLDMINER%successfully%COLOR_IRONMINER%:%COLOR_RESET%
    ECHO %COLOR_SLB_GREEN%"%DEST_PATH_NAME%"%COLOR_RESET%
    ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
    ECHO.
:MERGE
    IF /I "%MERGE_ONLY%"=="ON" (
        IF /I NOT "%JPG_MERGE_SET%"=="ON" (
            ECHO.
            ECHO JPG_MERGE_SET must be set to ON to use Merge Only.
            ECHO.
            GOTO :RAR_FINISH
        )
    )
    IF /I "%MERGE_ONLY%"=="ON" (
        IF NOT EXIST "%DEST_PATH%" (
            ECHO.
            ECHO The archive was not found in the destination folder.
            ECHO.
            GOTO :RAR_FINISH
        )
    )
    IF /I "%MERGE_ONLY%"=="ON" (
        IF NOT EXIST "%JPG_FILE%" (
            ECHO.
            ECHO The JPG file was not found.
            ECHO.
            GOTO :RAR_FINISH
        )
    )
    IF /I "%JPG_MERGE_SET%"=="ON" (
        IF NOT EXIST "%DEST_PATH%" (
            ECHO.
            ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
            ECHO %COLOR_IRONMINER%The completed%COLOR_RESET% %COLOR_GOLDMINER%RAR%COLOR_RESET% %COLOR_IRONMINER%archive was not found%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
            ECHO %COLOR_SLB_GREEN%"%DEST_PATH_NAME%"%COLOR_RESET%
            ECHO %COLOR_IRONMINER%Folder deletion has been cancelled%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
            GOTO :RAR_FINISH
        )
        ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
        ECHO %COLOR_IRONMINER%Combining the%COLOR_RESET% %COLOR_GOLDMINER%JPG%COLOR_RESET% %COLOR_IRONMINER%and%COLOR_RESET% %COLOR_GOLDMINER%RAR%COLOR_RESET% %COLOR_IRONMINER%archive%COLOR_GOLDMINER%...%COLOR_RESET%
        ECHO %COLOR_SLB_BLUE%%DEST_PATH_NAME%%COLOR_RESET%
        ECHO %COLOR_SLB_PURPLE%%JPG_FILE_NAME_ONLY%%COLOR_RESET%
        ECHO %COLOR_GOLDMINER%=======================================================%COLOR_RESET%
    COPY ^
        /B ^
        /Y ^
        "%JPG_FILE%"+"%DEST_PATH%" ^
        "%OUTPUT_JPG%" >NUL
            IF ERRORLEVEL 1 (
                ECHO.
                ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%Failed%COLOR_RESET% %COLOR_IRONMINER%to combine the%COLOR_RESET% %COLOR_GOLDMINER%JPG%COLOR_RESET% %COLOR_IRONMINER%and%COLOR_RESET% %COLOR_GOLDMINER%RAR%COLOR_RESET% %COLOR_IRONMINER%archive%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%Folder Deletion%COLOR_RESET% %COLOR_IRONMINER%has been cancelled%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
                ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
                ECHO.
                GOTO :RAR_FINISH
            )
            PING localhost -n %PING_SECONDS% >nul
            ECHO.
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%JPG%COLOR_RESET% %COLOR_IRONMINER%and%COLOR_RESET% %COLOR_GOLDMINER%RAR%COLOR_RESET% %COLOR_IRONMINER%archive merged %COLOR_GOLDMINER%successfully%COLOR_RESET%%COLOR_IRONMINER%:%COLOR_RESET%
            ECHO %COLOR_SLB_GREEN%"%JPG_NAME_ONLY%"%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO.
                IF /I "%DELETE_NEWRAR%"=="ON" (
                    DEL /Q "%DEST_PATH%" >nul 2>&1
                        IF EXIST "%DEST_PATH%" (
                            ECHO.
                            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
                            ECHO %COLOR_IRONMINER%The %COLOR_GOLDMINER%Original RAR%COLOR_RESET% %COLOR_IRONMINER%archive could not be deleted%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
                            ECHO %COLOR_SLB_GREEN%"%DEST_PATH_NAME%"%COLOR_RESET%
                            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
                            ECHO.
                            GOTO :RAR_FINISH
                        )
                )
                IF /I "%DELETE_SOURCE_JPG%"=="ON" (
                    DEL /Q "%JPG_FILE%" >nul 2>&1
                        IF EXIST "%JPG_FILE%" (
                            ECHO.
                            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
                            ECHO %COLOR_IRONMINER%The %COLOR_GOLDMINER%Original JPG%COLOR_RESET% %COLOR_IRONMINER%file could not be deleted%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
                            ECHO %COLOR_SLB_GREEN%"%JPG_FILE_NAME_ONLY%"%COLOR_RESET%
                            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
                            ECHO.
                            GOTO :RAR_FINISH
                        )
                )
            )
    TIMEOUT /T 3 /NOBREAK >nul
        IF /I "%DEL_FOLDER%"=="ON" GOTO :DEL_FOLDER_TRUE
            GOTO :RAR_FINISH
:DEL_FOLDER_TRUE
    CD /D "%DEST_FOLDER%"
        IF ERRORLEVEL 1 (
            ECHO.
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO %COLOR_IRONMINER%Unable to leave the %COLOR_GOLDMINER%Source Folder%COLOR_RESET%%COLOR_IRONMINER%.%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%Folder Deletion%COLOR_RESET% %COLOR_IRONMINER%has been cancelled%COLOR_GOLDMINER%.%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            GOTO :RAR_FINISH
        )
        IF /I "%RAR_PATH%"=="%DEST_FOLDER%" (
            ECHO.
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%Source%COLOR_RESET% %COLOR_IRONMINER%and%COLOR_RESET% %COLOR_GOLDMINER%Destination Folders%COLOR_RESET% %COLOR_IRONMINER%cannot be identical%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%Folder Deletion%COLOR_RESET% %COLOR_IRONMINER%has been cancelled%COLOR_RESET%%COLOR_GOLDMINER%.%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO.
            GOTO :RAR_FINISH
        )
        IF NOT EXIST "%RAR_PATH%\" (
            ECHO.
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO %COLOR_IRONMINER%Source folder%COLOR_RESET% %COLOR_GOLDMINER%was already%COLOR_RESET% %COLOR_GOLDMINER%removed or could not be found%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
            ECHO %COLOR_SLB_GREEN%"%RAR_PATH_NAME%"%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            GOTO :RAR_FINISH
        )
    RMDIR /S /Q "%RAR_PATH%"
        IF EXIST "%RAR_PATH%\" (
            ECHO.
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%NFS%COLOR_RESET% %COLOR_IRONMINER%was%COLOR_RESET% %COLOR_BRIGHTWHITE%unable%COLOR_RESET% %COLOR_IRONMINER%to delete the selected directory%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
            ECHO %COLOR_DARK_GREEN%"%RAR_PATH_NAME%"%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO.
        ) ELSE (
            ECHO.
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO %COLOR_IRONMINER%The %COLOR_GOLDMINER%selected directory%COLOR_RESET% %COLOR_IRONMINER%was deleted%COLOR_RESET% %COLOR_BRIGHTGREEN%successfully%COLOR_RESET%%COLOR_GOLDMINER%:%COLOR_RESET%
            ECHO %COLOR_DARK_GREEN%"%RAR_PATH_NAME%"%COLOR_RESET%
            ECHO %COLOR_GOLDMINER%================================================================%COLOR_RESET%
            ECHO.
        )
:RAR_FINISH
    ENDLOCAL
    EXIT /B