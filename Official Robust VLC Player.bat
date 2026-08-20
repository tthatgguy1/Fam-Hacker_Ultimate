

SET "CUSTOM_PROMPT=ON"
    IF /I "%CUSTOM_PROMPT%"=="ON" (
        prompt %COLOR_FBLK_BRIGHTYELLOW%{%COLOR_RESET%%COLOR_DARKMATTERMINER%Fam%COLOR_RESET%%COLOR_FBLK_BRIGHTYELLOW%-%COLOR_RESET%%COLOR_DARK_GREEN%Hacker%COLOR_RESET%%COLOR_FBLK_BRIGHTYELLOW%}%COLOR_RESET%%COLOR_FBLK_BRIGHTCYAN%$G%COLOR_RESET%%COLOR_FBLK_BRIGHTPURPLE%$G%COLOR_RESET%
    )

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
    
:GREETING_SET
SET "GREETINGS=ON"
    IF /I "%GREETINGS%"=="ON" (           
        DATE /T
        TIME /T
        COLOR 0B
        ECHO Welcome to the Fam-Hacker Client VLC File Player.
        TIMEOUT /T 1 >nul
    )

:COMMANDS    
        REM --fullscreen
        REM --no-xlib
        REM --no-keyboard-events
        REM --video-wallpaper
        REM --disable-screensaver
        REM --no-video-title-show
        REM --video-title-timeout
        REM --aspect-ratio
        REM --no-autoscale
        REM --no-hdtv-fix
        REM --video-title
        REM --no-sub-autodetect-file
        REM --start-time
        REM --stop-time
        REM --run-time
        REM --bookmarks
        REM --meta-title
        REM --meta-author
        REM --meta-artist
        REM --meta-genre
        REM --meta-date
        REM --meta-url
        REM --input-title-format
        REM --no-lua
        REM --high-priority
        REM --random
        REM --loop
        REM --repeat
        REM --play-and-exit
        REM --play-and-stop
        REM --play-and-pause
        REM --start-paused
        REM --no-playlist-autostart
        REM --no-playlist-cork
        REM --no-one-instance
        REM --one-instance
        REM --started-from-file
        REM --one-instance-when-started-from-file
        REM --playlist-enqueue
        REM --no-media-library
        REM --playlist-tree
        REM --no-auto-preparse
        REM --no-metadata-network-access
        REM --color
        REM --advanced
        REM --stereo-mode=6  
        REM --key-toggle-fullscreen
        REM --global-key-play-pause
        REM --key-faster
        REM --key-slower
        REM --key-rate-normal
        REM --key-rate-faster-fine
        REM --key-rate-slower-fine
        REM --key-next
        REM --key-prev
        REM --key-stop
        REM --key-nav-up
        REM --key-nav-down
        REM --key-nav-left
        REM --key-nav-right
        REM --key-title-prev
        REM --key-title-next
        REM --key-chapter-prev
        REM --key-quit
        REM --key-vol-up
        REM --key-vol-down
        REM --key-vol-mute
        REM --key-subtitle-toggle
        REM --key-random
        REM --key-loop
        REM --key-set-bookmark01
        REM --key-set-bookmark02
        REM --key-set-bookmark03
        REM --key-set-bookmark04
        REM --key-set-bookmark05
        REM --key-set-bookmark06
        REM --key-set-bookmark07
        REM --key-set-bookmark08
        REM --key-set-bookmark09
        REM --key-set-bookmark10
        REM --key-play-bookmark01
        REM --key-play-bookmark02
        REM --key-play-bookmark03
        REM --key-play-bookmark04
        REM --key-play-bookmark05
        REM --key-play-bookmark06
        REM --key-play-bookmark07
        REM --key-play-bookmark08
        REM --key-play-bookmark09
        REM --key-play-bookmark10
        REM --bookmark01
        REM --bookmark02
        REM --bookmark03
        REM --bookmark04
        REM --bookmark05
        REM --bookmark06
        REM --bookmark07
        REM --bookmark08
        REM --bookmark09
        REM --bookmark10

:VLC_RUN
    SET "VIDEO_SOURCE_1=X:\Media_Vault\TV Shows\The Big Bang Theory\The Big Bang Theory - Season 05"
    SET "VIDEO_SOURCE_2="
    SET "VIDEO_SOURCE_3="
    SET "VIDEO_SOURCE_4="
    SET "VIDEO_SOURCE_5="
    REM "%VIDEO_SOURCE_2%" ^
    REM "%VIDEO_SOURCE_3%" ^
    REM "%VIDEO_SOURCE_4%" ^
    REM "%VIDEO_SOURCE_5%"

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
        "%VIDEO_SOURCE_1%" ^
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