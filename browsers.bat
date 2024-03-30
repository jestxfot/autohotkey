@echo off
:main
echo 3. Mercury                                               G:\Apps\Browsers\mercury1\mercury\mercury.exe
echo 4. Firefox (FNAF)                                        G:\Apps\Browsers\firefox
echo 5. Mercury (Skibidi)                                     G:\Apps\Browsers\mercury1\mercury\mercury.exe
echo Mercury (JestX)                                          G:\Apps\Browsers\mercury1\mercury\mercury.exe
echo 7. Mercury (Data / Pass)                                 G:\Apps\Browsers\mercury1\mercury\mercury.exe
echo 8. Thorium (Marina)                                      G:\Apps\Browsers\Thorium\BIN\thorium.exe
echo 9. Thorium (Max)                                         G:\Apps\Browsers\Thorium\BIN\thorium.exe
echo 10. Mercury (Max)                                        G:\Apps\Browsers\mercury1\mercury\mercury.exe
echo 11. Mercury (Kate)                                       G:\Apps\Browsers\mercury1\mercury\mercury.exe
echo 12. Mercury (date1)                                      G:\Apps\Browsers\mercury1\mercury\mercury.exe

set /p choice="Select: "

goto comment
if "%choice%"=="0" (
    set /p folder="Select Folder: "

    if "%folder%"=="1" (
        start explorer "G:\Apps\Browsers\mercury1\mercury"
    ) else if "%folder%"=="2" (
        start explorer "G:\Apps\Browsers\mercury1\data"
    ) else (
		echo Error folder!
        goto main
    )
)
:comment

if %choice% == 3 (
    start "" "G:\Apps\Browsers\mercury1\mercury\mercury.exe" --profile "G:\Apps\Browsers\mercury1\USER_DATA"
) else if %choice% == 4 (
    start "" "G:\Apps\Browsers\firefox\app\firefox.exe" --profile "G:\Apps\Browsers\firefox\FNAF"
) else if %choice% == 5 (
    start "" "G:\Apps\Browsers\mercury1\mercury\mercury.exe" --profile "G:\Apps\Browsers\mercury1\Skibidi"
) else if "%choice%" == "jestx" (
    start "" "G:\Apps\Browsers\mercury1\mercury\mercury.exe" --profile "G:\Apps\Browsers\mercury1\JestX"
) else if "%choice%" == "оуыеч" (
    start "" "G:\Apps\Browsers\mercury1\mercury\mercury.exe" --profile "G:\Apps\Browsers\mercury1\JestX"
) else if %choice% == 7 (
    start "" "G:\Apps\Browsers\mercury1\mercury\mercury.exe" --profile "G:\Apps\Browsers\mercury1\data"
) else if %choice% == 8 (
    start "" "G:\Apps\Browsers\Thorium\BIN\thorium.exe" --user-data-dir="G:\Apps\Browsers\Thorium\USER_DATA_MARIN" --disk-cache-dir="G:\Apps\Browsers\Thorium\USER_DATA_MARIN\cache" --allow-outdated-plugins --disable-logging --disable-breakpad
) else if %choice% == 9 (
    start "" "G:\Apps\Browsers\Thorium\BIN\thorium.exe" --user-data-dir="G:\Apps\Browsers\Thorium\USER_DATA_MAX" --disk-cache-dir="G:\Apps\Browsers\Thorium\USER_DATA_MAX\cache" --allow-outdated-plugins --disable-logging --disable-breakpad
) else if %choice% == 10 (
    start "" "G:\Apps\Browsers\mercury1\mercury\mercury.exe" --profile "G:\Apps\Browsers\mercury1\max"
) else if %choice% == 11 (
    start "" "G:\Apps\Browsers\mercury1\mercury\mercury.exe" --profile "G:\Apps\Browsers\mercury1\kate"
) else if %choice% == 12 (
    start "" "G:\Apps\Browsers\mercury1\mercury\mercury.exe" --profile "G:\Apps\Browsers\mercury1\date1"
) else if "%choice%" == "есз" (
    start "" "D:\Apps\VPN\TCP\Start"
)
