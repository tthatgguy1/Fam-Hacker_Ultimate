@ECHO OFF
SETLOCAL
    TITLE FFMpeg Lime Percent
    SET "INPUT_FOLDER=X:\Media_Vault\YouTube\TerminalMontage"
    SET "CRF=18"
        REM ultrafast superfast faster fast medium slow slower veryslow placebo
    SET "PRESET=slower"
        REM 1536k-HandBrake 1024k-Very-High 768k-High 640k-High-Common 512k-Good
        REM 448k-Under-Good 384k-Acceptable 320k-Moderate 256k-Low 192k-Very-Compressed
    SET "BITRATE=1536k"
        REM 8000-Voice 16000-Radio 22050-Low-Quality 24000-Speech
        REM 32000-Broadcast 44100-CD 48000-Standard-Video
        REM 88200-720p 96000-1080p 176400-1440p 192000-2160p
    SET "SR=48000"
    SET "VOL=1.00"
    SET "LIBX=libx265"
        REM Add an underscore with a signature before the extension type.
    SET "FILE_TYPE=_x265.mkv"
    SET "BAT_SELF=%~f0"

     powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$raw=[IO.File]::ReadAllText($env:BAT_SELF); $marker='###__POWERSHELL__###'; $i=$raw.LastIndexOf($marker); if($i -lt 0){ throw 'Embedded PowerShell marker not found.' }; Invoke-Expression ($raw.Substring($i+$marker.Length))"

    SET "FFMPEG_EXIT=%ERRORLEVEL%"

        IF ERRORLEVEL 1 (
            ECHO Folder conversion completed with errors.
        ) ELSE (
            ECHO Folder conversion completed successfully.
        )

        ENDLOCAL
        GOTO :END

:END
GOTO :EOF

###__POWERSHELL__###

$ErrorActionPreference = 'Stop'

$folder   = $env:INPUT_FOLDER
$vol      = $env:VOL
$filetype = $env:FILE_TYPE
$libx     = $env:LIBX
$bitrate  = $env:BITRATE
$sr       = $env:SR
$crf      = $env:CRF
$preset   = $env:PRESET

# Keep Unicode progress-bar characters intact when text is piped to lolcat.
$utf8 = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = $utf8
$OutputEncoding = $utf8

$lolcatCommand = Get-Command lolcat -ErrorAction SilentlyContinue | Select-Object -First 1
$lolcat = $null
if ($lolcatCommand) {
    $lolcat = [string]$lolcatCommand.Source
    if ([string]::IsNullOrWhiteSpace($lolcat)) {
        $lolcat = [string]$lolcatCommand.Name
    }
}

# Native ANSI fallback for the one-line live display.  Some Windows
# lolcat ports intentionally remove color when stdout is redirected.
# We only use this fallback if lolcat does not return a genuinely
# rainbow ANSI string.
$ansiEsc = [string][char]27

function Get-NativeRainbowText {
    param(
        [string]$text,
        [int]$phase = 0
    )

    # 256-color rainbow palette.  Keeping all coloring inside the
    # returned string lets the caller redraw one fixed console row.
    $palette = @(
        196,202,208,214,220,226,
        190,154,118,82,46,47,
        48,49,50,51,45,39,
        33,27,57,93,129,165,
        201,200,199,198,197
    )

    $builder = [Text.StringBuilder]::new()

    for ($i = 0; $i -lt $text.Length; $i++) {
        $paletteIndex = (
            [Math]::Floor($i / 2) + $phase
        ) % $palette.Count

        [void]$builder.Append(
            $ansiEsc +
            '[38;5;' +
            $palette[$paletteIndex] +
            'm' +
            $text[$i]
        )
    }

    # Explicit reset so the next console output does not inherit the
    # final progress-bar color.
    [void]$builder.Append($ansiEsc + '[0m')

    return $builder.ToString()
}




function Get-LimeText {
    param([string]$text)

    # Bright lime green (xterm 256-color index 118)
    return (
        $ansiEsc +
        '[38;5;118m' +
        $text +
        $ansiEsc +
        '[0m'
    )
}


function Get-SynthwaveText {
    param(
        [string]$text,
        [int]$phase = 0
    )

    # Synthwave 256-color gradient:
    # hot pink -> magenta -> violet -> electric blue -> cyan -> violet.
    $palette = @(
        198,199,200,201,207,213,
        212,206,200,164,165,171,
        135,129,93,99,105,111,
        75,69,63,57,27,33,
        39,45,51,50,49,48,
        45,39,33,27,57,63,
        93,129,165,201
    )

    $builder = [Text.StringBuilder]::new()

    for ($i = 0; $i -lt $text.Length; $i++) {
        $paletteIndex = (
            [Math]::Floor($i / 2) + $phase
        ) % $palette.Count

        [void]$builder.Append(
            $ansiEsc +
            '[38;5;' +
            $palette[$paletteIndex] +
            'm' +
            $text[$i]
        )
    }

    [void]$builder.Append($ansiEsc + '[0m')

    return $builder.ToString()
}


function Get-RainbowText {
    param([string]$text)

    if ($lolcat) {
        # Run lolcat with stdin/stdout fully redirected so it never gets
        # direct access to the console cursor.  UTF-8 must be set on INPUT
        # as well as output or the Unicode block characters can make some
        # Windows lolcat builds return an uncolored line.
        foreach ($argLine in @('--force','-f','')) {
            $process = $null

            try {
                $psi = [Diagnostics.ProcessStartInfo]::new()
                $psi.FileName = $lolcat
                $psi.Arguments = (($argLine + ' --seed 75').Trim())
                $psi.UseShellExecute = $false
                $psi.CreateNoWindow = $true
                $psi.RedirectStandardInput = $true
                $psi.RedirectStandardOutput = $true
                $psi.RedirectStandardError = $true

                try {
                    $psi.StandardInputEncoding = $utf8
                    $psi.StandardOutputEncoding = $utf8
                    $psi.StandardErrorEncoding = $utf8
                }
                catch {
                }

                # Help ports implemented in Python/Ruby/Node keep ANSI
                # colors enabled even though stdout is redirected.
                try {
                    $psi.EnvironmentVariables['TERM'] = 'xterm-256color'
                    $psi.EnvironmentVariables['COLORTERM'] = 'truecolor'
                    $psi.EnvironmentVariables['CLICOLOR_FORCE'] = '1'
                    $psi.EnvironmentVariables['FORCE_COLOR'] = '1'
                    $psi.EnvironmentVariables['PYTHONIOENCODING'] = 'utf-8'
                }
                catch {
                }

                $process = [Diagnostics.Process]::new()
                $process.StartInfo = $psi

                [void]$process.Start()

                $process.StandardInput.WriteLine($text)
                $process.StandardInput.Close()

                $colored = $process.StandardOutput.ReadToEnd()
                [void]$process.StandardError.ReadToEnd()

                $process.WaitForExit()

                if (
                    $process.ExitCode -eq 0 -and
                    -not [string]::IsNullOrEmpty($colored)
                ) {
                    # lolcat is allowed to emit CR/LF, but not to control
                    # the cursor directly.
                    $colored = $colored -replace '[\r\n]',''

                    # Do not accept plain text masquerading as a successful
                    # lolcat call.  Require several SGR color sequences so
                    # the entire bar/status really is rainbow.
                    $sgrCount = [regex]::Matches(
                        $colored,
                        ([regex]::Escape($ansiEsc) + '\[[0-9;]*m')
                    ).Count

                    if ($sgrCount -ge 4) {
                        return $colored
                    }
                }
            }
            catch {
            }
            finally {
                if ($null -ne $process) {
                    $process.Dispose()
                }
            }
        }
    }

    # Reliable fallback: preserve the exact visible characters/spacing,
    # but color every character locally so the fixed-row progress display
    # can never become white.
    return Get-NativeRainbowText $text
}

function Write-Rainbow {
    param([string]$text)

    Write-Host (Get-RainbowText $text)
}

if (-not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
    throw 'ffmpeg was not found in PATH.'
}

if (-not (Get-Command ffprobe -ErrorAction SilentlyContinue)) {
    throw 'ffprobe was not found in PATH.'
}

if (-not (Test-Path -LiteralPath $folder -PathType Container)) {
    throw ('Folder not found: ' + $folder)
}

$extensions = @(
    '.webm','.mp4','.mov','.avi','.m4v','.wmv','.flv',
    '.mpeg','.mpg','.ts','.mts','.m2ts','.vob','.ogv',
    '.3gp','.mkv'
)

$files = @(
    Get-ChildItem -LiteralPath $folder -File |
    Where-Object {
        $extensions -contains $_.Extension.ToLowerInvariant()
    } |
    Sort-Object Name
)

if ($files.Count -eq 0) {
    Write-Host 'No supported video files were found.'
    exit 0
}

$formatTime = {
    param([double]$seconds)

    $time = [TimeSpan]::FromSeconds([Math]::Max(0,$seconds))

    if ($time.TotalHours -ge 1) {
        return '{0:00}:{1:00}:{2:00}' -f `
            [Math]::Floor($time.TotalHours),
            $time.Minutes,
            $time.Seconds
    }

    return '{0:00}:{1:00}' -f `
        [Math]::Floor($time.TotalMinutes),
        $time.Seconds
}

$barWidth = 40
$converted = 0
$skipped = 0
$failed = 0
$fileNumber = 0

foreach ($file in $files) {
    $fileNumber++

    $outputFile = Join-Path `
        $file.DirectoryName `
        ($file.BaseName + $filetype)

    Write-Host ''
    Write-Rainbow ('=' * 72)
    Write-Rainbow (
        'Current file [{0}/{1}]: {2}' -f `
            $fileNumber,
            $files.Count,
            $file.Name
    )
    Write-Rainbow ('=' * 72)
    Write-Host ''

    if (Test-Path -LiteralPath $outputFile) {
        Write-Host 'Skipped: destination already exists.'
        $skipped++
        continue
    }

    $durationOutput = & ffprobe `
        -v error `
        -show_entries format=duration `
        -of 'default=noprint_wrappers=1:nokey=1' `
        $file.FullName 2>&1

    $duration = 0.0

    $durationValid = [double]::TryParse(
        ([string]($durationOutput | Select-Object -First 1)).Trim(),
        [Globalization.NumberStyles]::Float,
        [Globalization.CultureInfo]::InvariantCulture,
        [ref]$duration
    )

    if (
        $LASTEXITCODE -ne 0 -or
        -not $durationValid -or
        $duration -le 0
    ) {
        Write-Host 'Failed: unable to read the file duration.'
        $failed++
        continue
    }

    # Find external SRT subtitles beside the source video.
    # Matches:
    #   Video.srt
    #   Video.en.srt
    #   Video.eng.srt
    #   Video.forced.srt
    $srtFiles = @(
        Get-ChildItem -LiteralPath $file.DirectoryName -File -Filter '*.srt' |
        Where-Object {
            $_.BaseName -eq $file.BaseName -or
            $_.BaseName.StartsWith(
                $file.BaseName + '.',
                [StringComparison]::OrdinalIgnoreCase
            )
        } |
        Sort-Object Name
    )

    $ffmpegArguments = @(
        '-hide_banner',
        '-loglevel','error',
        '-nostdin',
        '-nostats',
        '-stats_period','0.25',
        '-progress','pipe:1',
        '-n',
        '-i',$file.FullName
    )

    # Add each matching SRT as another FFmpeg input.
    foreach ($srtFile in $srtFiles) {
        $ffmpegArguments += @(
            '-i',$srtFile.FullName
        )
    }

    # Keep the source video, audio, and any embedded subtitles.
    $ffmpegArguments += @(
        '-map','0:v:0',
        '-map','0:a?',
        '-map','0:s?'
    )

    # Map every external SRT subtitle input.
    # Input 0 is the source video, so SRT inputs begin at 1.
    for ($srtIndex = 0; $srtIndex -lt $srtFiles.Count; $srtIndex++) {
        $inputIndex = $srtIndex + 1

        $ffmpegArguments += @(
            '-map',('{0}:0' -f $inputIndex)
        )
    }

    $ffmpegArguments += @(
        '-map_metadata','0',
        '-map_chapters','0',
        '-filter:a',('volume='+$vol),
        '-c:v',$libx,
        '-preset',$preset,
        '-crf',$crf,
        '-ac','6',
        '-pix_fmt','yuv420p10le',
        '-c:a','eac3',
        '-ar',$sr,
        '-c:s','copy',
        '-b:a',$bitrate,
        $outputFile
    )

    $stopwatch = [Diagnostics.Stopwatch]::StartNew()
    $errors = [Collections.Generic.List[string]]::new()
    $latestMediaSeconds = 0.0
    $lastStatusLength = 0

    # Reserve two physical console rows:
    # one for Elapsed / ETA / File, and one for the progress bar.
    try {
        [Console]::WriteLine()
        [Console]::WriteLine()
        $infoRow = [Math]::Max(0, [Console]::CursorTop - 2)
        $progressRow = [Math]::Max(0, [Console]::CursorTop - 1)
    }
    catch {
        $infoRow = 0
        $progressRow = 1
    }

    & ffmpeg @ffmpegArguments 2>&1 | ForEach-Object {
        $line = ([string]$_).Trim()

        if ($line -match '^out_time=(.+)$') {
            $mediaTime = [TimeSpan]::Zero

            if ([TimeSpan]::TryParse(
                $matches[1],
                [Globalization.CultureInfo]::InvariantCulture,
                [ref]$mediaTime
            )) {
                $latestMediaSeconds = $mediaTime.TotalSeconds
            }
        }
        elseif ($line -match '^out_time_us=(\d+)$') {
            $latestMediaSeconds = [double]$matches[1] / 1000000
        }
        elseif ($line -match '^out_time_ms=(\d+)$') {
            $latestMediaSeconds = [double]$matches[1] / 1000000
        }
        elseif ($line -match '^progress=(continue|end)$') {
            $fraction = [Math]::Min(
                1.0,
                [Math]::Max(
                    0.0,
                    $latestMediaSeconds / $duration
                )
            )

            $percent = [Math]::Floor($fraction * 100)
            $elapsedSeconds = $stopwatch.Elapsed.TotalSeconds

            if ($fraction -gt 0.0001) {
                $etaSeconds = [Math]::Max(
                    0,
                    ($elapsedSeconds / $fraction) - $elapsedSeconds
                )

                $etaText = & $formatTime $etaSeconds
            }
            else {
                $etaText = 'Calculating'
            }

            $elapsedText = & $formatTime $elapsedSeconds

            # Keep the original 40-character bar whenever the window is
            # wide enough.  On a narrow window, shorten only the bar so the
            # status can never wrap onto another physical console row.
            try {
                $consoleWidth = [Math]::Max(20, [Console]::WindowWidth)
            }
            catch {
                $consoleWidth = 120
            }

            $infoStatus =
                'Elapsed {0}  ETA {1}  File {2}/{3}' -f `
                    $elapsedText,
                    $etaText,
                    $fileNumber,
                    $files.Count

            $suffix =
                '] {0,3}%' -f `
                    $percent

            $liveBarWidth = [Math]::Min(
                $barWidth,
                [Math]::Max(
                    1,
                    $consoleWidth - $suffix.Length - 2
                )
            )

            $filled = [Math]::Min(
                $liveBarWidth,
                [Math]::Floor($liveBarWidth * $fraction)
            )

            $bar =
                ([string][char]0x2588) * $filled +
                ([string][char]0x2591) * ($liveBarWidth - $filled)

            $status =
                '[' + $bar + $suffix

            $coloredInfo = Get-RainbowText $infoStatus
            $barOnly =
                '[' + $bar + ']'

            $percentOnly =
                ' {0,3}%' -f `
                    $percent

            $coloredStatus =
                (Get-SynthwaveText $barOnly) +
                (Get-LimeText $percentOnly)

            try {
                # Keep both live status rows pinned in place.
                $clearWidth = [Math]::Max(
                    1,
                    [Console]::WindowWidth - 1
                )

                [Console]::SetCursorPosition(0, $infoRow)
                [Console]::Write(' ' * $clearWidth)
                [Console]::SetCursorPosition(0, $infoRow)
                [Console]::Write($coloredInfo)

                [Console]::SetCursorPosition(0, $progressRow)
                [Console]::Write(' ' * $clearWidth)
                [Console]::SetCursorPosition(0, $progressRow)
                [Console]::Write($coloredStatus)
            }
            catch {
                # Fallback keeps the progress row on one line.
                [Console]::Write(
                    ([string][char]13) +
                    (' ' * [Math]::Max(1, $status.Length)) +
                    ([string][char]13) +
                    $coloredStatus
                )
            }

            $lastStatusLength = $status.Length
        }
        elseif (
            $line.Length -gt 0 -and
            $line -notmatch '^[A-Za-z0-9_]+='
        ) {
            $errors.Add($line)
        }
    }

    $ffmpegExitCode = $LASTEXITCODE
    $stopwatch.Stop()

    if ($ffmpegExitCode -eq 0) {
        $fullBar = ([string][char]0x2588) * $barWidth

        $elapsedText = & $formatTime `
            $stopwatch.Elapsed.TotalSeconds

        $finalInfo =
            'Elapsed {0}  ETA 00:00  File {1}/{2}' -f `
                $elapsedText,
                $fileNumber,
                $files.Count

        $finalStatus =
            '[{0}] 100%' -f `
                $fullBar

        try {
            $clearWidth = [Math]::Max(
                1,
                [Console]::WindowWidth - 1
            )

            [Console]::SetCursorPosition(0, $infoRow)
            [Console]::Write(' ' * $clearWidth)
            [Console]::SetCursorPosition(0, $infoRow)
            [Console]::Write((Get-RainbowText $finalInfo))

            [Console]::SetCursorPosition(0, $progressRow)
            [Console]::Write(' ' * $clearWidth)
            [Console]::SetCursorPosition(0, $progressRow)
            $finalBarOnly =
                '[' + $fullBar + ']'

            $finalPercentOnly =
                ' 100%'

            [Console]::Write(
                (Get-SynthwaveText $finalBarOnly) +
                (Get-LimeText $finalPercentOnly)
            )

            [Console]::SetCursorPosition(0, $progressRow + 1)
        }
        catch {
            Write-Host ''
            Write-Rainbow $finalInfo
            Write-Host (
                (Get-SynthwaveText ('[' + $fullBar + ']')) +
                (Get-LimeText ' 100%')
            )
        }

        Write-Host ('Completed: ' + $file.Name)
        $converted++
    }
    else {
        try {
            [Console]::SetCursorPosition(0, $progressRow + 1)
        }
        catch {
            Write-Host ''
        }

        Write-Host ('Failed: ' + $file.Name)

        $errors |
            Select-Object -Last 15 |
            ForEach-Object { Write-Host $_ }

        if (Test-Path -LiteralPath $outputFile) {
            Remove-Item -LiteralPath $outputFile -Force `
                -ErrorAction SilentlyContinue
        }

        $failed++
    }
}

Write-Host ''
Write-Host ('=' * 72)
Write-Host (
    'Finished. Converted: {0}  Skipped: {1}  Failed: {2}' -f `
        $converted,
        $skipped,
        $failed
)

if ($failed -gt 0) {
    exit 1
}

exit 0
