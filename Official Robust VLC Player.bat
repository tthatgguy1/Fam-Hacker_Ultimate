        :FAM-HACKER_CLIENT
         @ECHO OFF
         SETLOCAL DisableDelayedExpansion
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
        SET "FAM_HACKER_INTRO=OFF"
            IF /I "%FAM_HACKER_INTRO%"=="ON" (
                CALL "%~dp0Call Files\Fam-Hacker_Client_Intro.bat"
            )
        SET "CUSTOM_PROMPT=ON"
            IF /I "%CUSTOM_PROMPT%"=="ON" (
                prompt %COLOR_FBLK_BRIGHTYELLOW%{%COLOR_RESET%%COLOR_DARKMATTERMINER%Fam%COLOR_RESET%%COLOR_FBLK_BRIGHTYELLOW%-%COLOR_RESET%%COLOR_DARK_GREEN%Hacker%COLOR_RESET%%COLOR_FBLK_BRIGHTYELLOW%}%COLOR_RESET%%COLOR_FBLK_BRIGHTCYAN%$G%COLOR_RESET%%COLOR_FBLK_BRIGHTPURPLE%$G%COLOR_RESET%
            )
        SET "GREETINGS=ON"
            IF /I "%GREETINGS%"=="ON" (           
                DATE /T
                TIME /T
                COLOR 0B
                ECHO Welcome to the advance file selection, Written by Seth J. Nelson
                TIMEOUT /T 1 >nul
            )
        :COMMANDS    
            ::--fullscreen
            ::--no-xlib
            ::--no-keyboard-events
            ::--video-wallpaper
            ::--disable-screensaver
            ::--no-video-title-show
            ::--video-title-timeout
            ::--aspect-ratio
            ::--no-autoscale
            ::--no-hdtv-fix
            ::--video-title
            ::--no-sub-autodetect-file
            ::--start-time
            ::--stop-time
            ::--run-time
            ::--bookmarks
            ::--meta-title
            ::--meta-author
            ::--meta-artist
            ::--meta-genre
            ::--meta-date
            ::--meta-url
            ::--input-title-format
            ::--no-lua
            ::--high-priority
            ::--random
            ::--loop
            ::--repeat
            ::--play-and-exit
            ::--play-and-stop
            ::--play-and-pause
            ::--start-paused
            ::--no-playlist-autostart
            ::--no-playlist-cork
            ::--no-one-instance
            ::--one-instance
            ::--started-from-file
            ::--one-instance-when-started-from-file
            ::--playlist-enqueue
            ::--no-media-library
            ::--playlist-tree
            ::--no-auto-preparse
            ::--no-metadata-network-access
            ::--color
            ::--advanced
            ::--stereo-mode=6  
            ::--key-toggle-fullscreen
            ::--global-key-play-pause
            ::--key-faster
            ::--key-slower
            ::--key-rate-normal
            ::--key-rate-faster-fine
            ::--key-rate-slower-fine
            ::--key-next
            ::--key-prev
            ::--key-stop
            ::--key-nav-up
            ::--key-nav-down
            ::--key-nav-left
            ::--key-nav-right
            ::--key-title-prev
            ::--key-title-next
            ::--key-chapter-prev
            ::--key-quit
            ::--key-vol-up
            ::--key-vol-down
            ::--key-vol-mute
            ::--key-subtitle-toggle
            ::--key-random
            ::--key-loop
            ::--key-set-bookmark01
            ::--key-set-bookmark02
            ::--key-set-bookmark03
            ::--key-set-bookmark04
            ::--key-set-bookmark05
            ::--key-set-bookmark06
            ::--key-set-bookmark07
            ::--key-set-bookmark08
            ::--key-set-bookmark09
            ::--key-set-bookmark10
            ::--key-play-bookmark01
            ::--key-play-bookmark02
            ::--key-play-bookmark03
            ::--key-play-bookmark04
            ::--key-play-bookmark05
            ::--key-play-bookmark06
            ::--key-play-bookmark07
            ::--key-play-bookmark08
            ::--key-play-bookmark09
            ::--key-play-bookmark10
            ::--bookmark01
            ::--bookmark02
            ::--bookmark03
            ::--bookmark04
            ::--bookmark05
            ::--bookmark06
            ::--bookmark07
            ::--bookmark08
            ::--bookmark09
            ::--bookmark10
        :VLC_RUN
            SET "VIDEO_SOURCE=X:\Media_Vault\TV Shows\Young Sheldon\Young Sheldon (2017) Season 5 S05 (1080p BluRay x265 HEVC 10bit AAC 5.1 Vyndros)"
            SET "VIDEO_SOURCE_2="
            SET "VIDEO_SOURCE_3="
            SET "VIDEO_SOURCE_4="
            REM "%VIDEO_SOURCE_2%" ^
            REM "%VIDEO_SOURCE_3%" ^
            REM "%VIDEO_SOURCE_4%"

            VLC ^
             --start-time=0 ^
             --no-random ^
             --one-instance ^
             --playlist-enqueue ^
             --no-fullscreen ^
             --sub-track=0 ^
             --video-title-show ^
             --autoscale ^
             --playlist-tree ^
             --auto-preparse ^
             --play-and-exit ^
            "%VIDEO_SOURCE%"
            GOTO :END
:PEND
    ECHO OFF
    ECHO                                                   %COLOR_BRIGHTYELLOW%i%COLOR_RESET%                                                                                           
    PING localhost -n 1 >nul                                                                                                                           
    ECHO                                                  %COLOR_BRIGHTYELLOW%BMX%COLOR_RESET%                                                                                          
    PING localhost -n .5 >nul                                                                                                                           
    ECHO     %COLOR_BRIGHTBLACK%.%COLOR_RESET%                                           %COLOR_BRIGHTYELLOW%BMMM2%COLOR_RESET%                                          %COLOR_BRIGHTBLACK%.%COLOR_RESET%                                              
    PING localhost -n 1 >nul                                                                                                                           
    ECHO     %COLOR_BRIGHTBLACK%iMMZ;%COLOR_RESET%                                      %COLOR_BRIGHTYELLOW%@MMMMM8%COLOR_RESET%                                     %COLOR_BRIGHTBLACK%;ZMM.%COLOR_RESET%                                             
    PING localhost -n .5 >nul                                                                                                                           
    ECHO      %COLOR_BRIGHTBLACK%MMMMMMBX,%COLOR_RESET%                                %COLOR_BRIGHTYELLOW%MMMMMMMMW%COLOR_RESET%                                %COLOR_BRIGHTBLACK%,XWMMMMMB%COLOR_RESET%                                              
    PING localhost -n 1 >nul                                                                                                                           
    ECHO       %COLOR_BRIGHTBLACK%MMMMMMMMMMZ;                   r%COLOR_RESET%       %COLOR_BRIGHTYELLOW%MMMMMMMMMMM%COLOR_RESET%       %COLOR_BRIGHTBLACK%:                   iZMMMMMMMMMM%COLOR_RESET%                                               
    PING localhost -n .5 >nul                                                                                                                           
    ECHO       %COLOR_BRIGHTBLACK%MMMMMMMMMMMMMMWS,            :M0%COLOR_RESET%     %COLOR_BRIGHTYELLOW%,MMMMMMMMMMMMM%COLOR_RESET%      %COLOR_BRIGHTBLACK%iMS            .XBMMMMMMMMMMMMM0%COLOR_RESET%                                               
    PING localhost -n 1 >nul                                                                                                                           
    ECHO       %COLOR_BRIGHTBLACK%:MMMMMMMMMMMMMMMMMMZr       iMM%COLOR_RESET%     %COLOR_BRIGHTYELLOW%;W%COLOR_RESET%  ,,,,,,,,, %COLOR_BRIGHTYELLOW%.0,%COLOR_RESET%     %COLOR_BRIGHTBLACK%0M8       ;aMMMMMMMMMMMMMMMMMM.%COLOR_RESET%                                               
    PING localhost -n .5 >nul                                                                                                                           
    ECHO        %COLOR_BRIGHTBLACK%MMMMMMMMMMMMMMMMMMMMMM@:  iMM:%COLOR_RESET%    %COLOR_BRIGHTYELLOW%;MM7%COLOR_RESET%           %COLOR_BRIGHTYELLOW%XMM,%COLOR_RESET%     %COLOR_BRIGHTBLACK%MMZ .XWMMMMMMMMMMMMMMMMMMMMMM%COLOR_RESET%                                               
    PING localhost -n 1 >nul                                                                                                                           
    ECHO           %COLOR_BRIGHTBLACK%,i7XZ0@MMMMMMMMMMMMMMMMMMM%COLOR_RESET%    %COLOR_BRIGHTYELLOW%7MMMMB%COLOR_RESET%         %COLOR_BRIGHTYELLOW%BMMMM;%COLOR_RESET%    %COLOR_BRIGHTBLACK%8MMMMMMMMMMMMMMMMMM@0ZX7i,%COLOR_RESET%                                                  
    PING localhost -n .5 >nul                                                                                                                           
    ECHO                       %COLOR_BRIGHTBLACK%.irSZBWMMMMMMB%COLOR_RESET%   %COLOR_BRIGHTYELLOW%2MMMMMMM%COLOR_RESET%       %COLOR_BRIGHTYELLOW%MMMMMMMX%COLOR_RESET%   %COLOR_BRIGHTBLACK%rMMMMMM@BZS7i.%COLOR_RESET%                                                               
    PING localhost -n 1 >nul                                                                                                                           
    ECHO                                 %COLOR_BRIGHTBLACK%MMMZ%COLOR_RESET%  %COLOR_BRIGHTYELLOW%8MMMMMMMMM:%COLOR_RESET%   %COLOR_BRIGHTYELLOW%:MMMMMMMMMa%COLOR_RESET%  %COLOR_BRIGHTBLACK%:MMM%COLOR_RESET%                                                                         
    PING localhost -n .5 >nul                                                                                                                           
    ECHO                                %COLOR_BRIGHTBLACK%.MMMW%COLOR_RESET% %COLOR_BRIGHTYELLOW%MMMMMMMMMMMMZ%COLOR_RESET% %COLOR_BRIGHTYELLOW%aMMMMMMMMMMMM%COLOR_RESET%  %COLOR_BRIGHTBLACK%XMMM7%COLOR_RESET%                                                                         
    PING localhost -n 1 >nul                                                                                                                           
    ECHO           %COLOR_BRIGHTBLACK%;;;;7X2a80W@MMMMMMMMMMMMMM%COLOR_RESET%%COLOR_BRIGHTYELLOW%;ir;;;;;;;rrX2.SXrr;;;r;;;r7%COLOR_RESET%  %COLOR_BRIGHTBLACK%MMMMMMMMMMMMMM@W08a2X7;;;i%COLOR_RESET%                                                  
    PING localhost -n .5 >nul                                                                                                                           
    ECHO           %COLOR_BRIGHTBLACK%XMMMMMMMMMMMMMMMMMMMMMMMMMM%COLOR_RESET%                           %COLOR_BRIGHTBLACK%ZMMMMMMMMMMMMMMMMMMMMMMMMM7%COLOR_RESET%                                                   
    PING localhost -n 1 >nul                                                                                                                           
    ECHO            %COLOR_BRIGHTBLACK%iMMMMMMMMMMMMMMMMM8r  MMMMM7%COLOR_RESET%           %COLOR_BRIGHTGREEN%B:%COLOR_RESET%          %COLOR_BRIGHTBLACK%,MMMMM, iaMMMMMMMMMMMMMMMMMi%COLOR_RESET%                                                    
    PING localhost -n .5 >nul                                                                                                                           
    ECHO             %COLOR_BRIGHTBLACK%;MMMMMMMMMMMW2,      0MMMMMM8r.%COLOR_RESET%      %COLOR_BRIGHTGREEN%aMM%COLOR_RESET%       %COLOR_BRIGHTBLACK%i2MMMMMMM      .XBMMMMMMMMMMMi%COLOR_RESET%                                                     
    PING localhost -n 1 >nul                                                                                                                           
    ECHO              %COLOR_BRIGHTBLACK%rMMMMMMZ;         ZMMMMMMMMMMMMZ%COLOR_RESET%   %COLOR_BRIGHTGREEN%rMMMM%COLOR_RESET%   %COLOR_BRIGHTBLACK%:MMMMMMMMMMMM0:        ia@MMMMMr%COLOR_RESET%                                                      
    PING localhost -n .5 >nul                                                                                                                           
    ECHO               %COLOR_BRIGHTBLACK%S@X,          ;MMMMMMXBMMMMMMMM.%COLOR_RESET% %COLOR_BRIGHTGREEN%:MMMMMW%COLOR_RESET%  %COLOR_BRIGHTBLACK%MMMMMMMMWSBMMMMM7          .X@S%COLOR_RESET%                                                       
    PING localhost -n 1 >nul                                                                                                                           
    ECHO                           %COLOR_BRIGHTBLACK%2MMMMMM0   MMMMMMMB%COLOR_RESET%  %COLOR_BRIGHTGREEN%MMMMMMMZ%COLOR_RESET% %COLOR_BRIGHTBLACK%;MMMMMMM.  XMMMMMMZ%COLOR_RESET%                                                                   
    PING localhost -n .5 >nul                                                                                                                           
    ECHO                        %COLOR_BRIGHTBLACK%:BMMMMMMMi   0MMM0:,%COLOR_RESET%   %COLOR_BRIGHTGREEN%MMMMMMMMMX%COLOR_RESET%  %COLOR_BRIGHTBLACK%.i7MMMM    MMMMMMM@;%COLOR_RESET%                                                                
    PING localhost -n 1 >nul                                                                                                                           
    ECHO                     %COLOR_BRIGHTBLACK%:aMMMMMMMM8    ;MMMM.%COLOR_RESET%    %COLOR_BRIGHTGREEN%MMMMMMMMMMMS%COLOR_RESET%    %COLOR_BRIGHTBLACK%MMMMB    XMMMMMMMMZi%COLOR_RESET%                                                             
    PING localhost -n .5 >nul                                                                                                                           
    ECHO                     %COLOR_BRIGHTBLACK%0MMMMMMMM:     MMMMM%COLOR_RESET%    %COLOR_BRIGHTGREEN%@MMMMMMMMMMM@%COLOR_RESET%    %COLOR_BRIGHTBLACK%0MMMM;     @MMMMMMMW%COLOR_RESET%                                                              
    PING localhost -n 1 >nul                                                                                                                           
    ECHO                       %COLOR_BRIGHTBLACK%7MMMMa      MMMMMB%COLOR_RESET%     %COLOR_BRIGHTGREEN%;@MMMMMMMB%COLOR_RESET%      %COLOR_BRIGHTBLACK%iMMMMM      XMMMMX%COLOR_RESET%                                                               
    PING localhost -n .5 >nul                                                                                                                           
    ECHO                         %COLOR_BRIGHTBLACK%.0:      aMMMMM7%COLOR_RESET%        %COLOR_BRIGHTGREEN%2MMM@%COLOR_RESET%         %COLOR_BRIGHTBLACK%MMMMMM       0i%COLOR_RESET%                                                                 
    PING localhost -n 1 >nul                                                                                                                           
    ECHO                                 %COLOR_BRIGHTBLACK%:MMMMMM%COLOR_RESET%    %COLOR_BLUE%WMM%COLOR_RESET%   %COLOR_BRIGHTGREEN%MMMa%COLOR_RESET%  %COLOR_BLUE%WMM%COLOR_RESET%    %COLOR_BRIGHTBLACK%MMMMMM2%COLOR_RESET%                                                                         
    PING localhost -n .5 >nul                                                                                                                           
    ECHO                                    %COLOR_BRIGHTBLACK%.,7X%COLOR_RESET%   %COLOR_BLUE%BMMM%COLOR_RESET%  %COLOR_BRIGHTGREEN%WMMMM7%COLOR_RESET% %COLOR_BLUE%8MMM%COLOR_RESET%   %COLOR_BRIGHTBLACK%:Xi.%COLOR_RESET%                                                                            
    PING localhost -n 1 >nul                                                                                                                           
    ECHO                                          %COLOR_BLUE%aMM2%COLOR_RESET%  %COLOR_BRIGHTGREEN%.MMMMMM%COLOR_RESET%  %COLOR_BLUE%rMM0%COLOR_RESET%                                                                                  
    PING localhost -n .5 >nul                                                                                                                           
    ECHO                                 %COLOR_BLUE%i.   ...SMM8%COLOR_RESET%    %COLOR_BRIGHTGREEN%MMMMM2%COLOR_RESET%   %COLOR_BLUE%SMMa ..   ,, %COLOR_RESET%                                                                        
    PING localhost -n 1 >nul                                                                                                                           
    ECHO                                 %COLOR_BLUE%MMMMMMMMMMMMM%COLOR_RESET%   %COLOR_BRIGHTGREEN%,MMMM%COLOR_RESET%   %COLOR_BLUE%MMMMMMMMMMMMM %COLOR_RESET%                                                                        
    PING localhost -n .5 >nul                                                                                                                           
    ECHO                                  %COLOR_BLUE%;@MM    XM2%COLOR_RESET%     %COLOR_BRIGHTGREEN%SMM%COLOR_RESET%     %COLOR_BLUE%XMa    MMWi%COLOR_RESET%                                                                          
    PING localhost -n 1 >nul                                                                                                                           
    ECHO                                     %COLOR_BLUE%WS%COLOR_RESET%            %COLOR_BRIGHTGREEN%MB%COLOR_RESET%           %COLOR_BLUE%SW%COLOR_RESET%                                                                             
    PING localhost -n .5 >nul                                                                                                                           
    ECHO                                      %COLOR_BLUE%,                         ,%COLOR_RESET%                                    
    PING localhost -n 1 >nuL
:END