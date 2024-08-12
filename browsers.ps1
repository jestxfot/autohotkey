Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ������� ��� ���������� ������ ����� �������� �� �����
function Add-BrowserFolderButton {
    param (
        [int]$Top,
        [int]$Left,
		[scriptblock]$OnClick,
		[int]$IconSize = 2
    )

    $button = New-Object System.Windows.Forms.Button
    $button.Location = New-Object System.Drawing.Point($Left, $Top)
    $button.Size = New-Object System.Drawing.Size(42, 40)
    $button.Add_Click($OnClick)
	
	$icon = [System.Drawing.Icon]::ExtractAssociatedIcon("C:\Windows\explorer.exe")  # ���� � ������ ����� �� ���������
	$icon = [System.Drawing.Icon]::new($icon, $IconSize, $IconSize)
	$button.Image = $icon.ToBitmap()
	$button.ImageAlign = "MiddleLeft"
 
    # ��������� ����� ������
    $button.FlatStyle = "Popup"
    $button.FlatAppearance.BorderSize = 0  # ������� ������� ������

    $form.Controls.Add($button)
}

# ������� ��� ���������� ������ �� �����
function Add-Button {
    param (
        [string]$Text,
        [int]$Top,
        [int]$Left,
        [scriptblock]$OnClick,
        [string]$ExecutablePath,
        [int]$IconSize,
        [int]$OffsetTop,  # ����� ��������: �������� �� ��������� ������������ ������� ������
        [int]$OffsetLeft  # ����� ��������: �������� �� ����������� ������������ ������� ������
    )

    $button = New-Object System.Windows.Forms.Button
    $button.Text = $Text
    $button.Top = $Top + $OffsetTop  # ������������ ������� �� ���������
    $button.Left = $Left + $OffsetLeft  # ������������ ������� �� �����������
    $button.Size = New-Object System.Drawing.Size(230, 40)
    $button.Add_Click($OnClick)

    if ($ExecutablePath -ne "") {
        $icon = [System.Drawing.Icon]::ExtractAssociatedIcon($ExecutablePath)
        $icon = [System.Drawing.Icon]::new($icon, $IconSize, $IconSize)
        $button.Image = $icon.ToBitmap()
        $button.ImageAlign = "MiddleLeft"
    }

    # ��������� ����� ������
    $button.FlatStyle = "Popup"
    $button.FlatAppearance.BorderSize = 0  # ������� ������� ������

    $form.Controls.Add($button)
}


# ������� ������ �����
$form = New-Object System.Windows.Forms.Form
$form.Text = "Windows Browsers"
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.StartPosition = "CenterScreen"

# ������� ��� ������� �����
function Hide-Form {
    $form.Hide()
}

# ������� ��� ���������� ������ � ����� � ��������� ������� ������
function Add-Text {
    param (
        [string]$Text,
        [int]$Top,
        [int]$Left,
        [int]$FontSize  # ����� �������� ��� ������� ������
    )

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Text
    $label.Location = New-Object System.Drawing.Point($Left, $Top)
    $label.AutoSize = $true

    # ������� ����� ������ ������ � ��������� ��������
    $font = New-Object System.Drawing.Font("Arial", $FontSize, [System.Drawing.FontStyle]::Regular)
    $label.Font = $font  # ��������� ����� � �����

    $form.Controls.Add($label)
}

$ThromiumTop = 10
Add-Text -Text "Thromium" -Top $ThromiumTop -Left 80 -FontSize 14

$ThromiumTop += 30

Add-BrowserFolderButton -Top $ThromiumTop -Left 250 -OnClick {
    Start-Process explorer.exe -ArgumentList "G:\Apps\Browsers\Thorium\BIN"
} -IconSize 16

Add-BrowserFolderButton -Top $ThromiumTop -Left 250 -OnClick {
    Start-Process explorer.exe -ArgumentList "G:\Apps\Browsers\Thorium_AVX2_117.0.5938.157"
} -IconSize 16

Add-Button -Text "Thorium OLD" -Top $ThromiumTop -Left 10 -OnClick {
    Start-Process "G:\Apps\Browsers\Thorium_AVX2_117.0.5938.157\BIN\thorium.exe" -ArgumentList '--user-data-dir="G:\Apps\Browsers\Thorium_AVX2_117.0.5938.157\USER_DATA" --disk-cache-dir="G:\Apps\Browsers\Thorium_AVX2_117.0.5938.157\USER_DATA\cache" --allow-outdated-plugins --disable-logging --disable-breakpad'
    Hide-Form
} -ExecutablePath "G:\Apps\Browsers\Thorium_AVX2_117.0.5938.157\BIN\thorium.exe" -IconSize 16 -OffsetTop 0 -OffsetLeft 0

$MercuryTop = 200
Add-Text -Text "Mercury" -Top $MercuryTop -Left 88 -FontSize 14

$MercuryTop += 30

Add-BrowserFolderButton -Top $MercuryTop -Left 250 -OnClick {
    Start-Process explorer.exe -ArgumentList "G:\Apps\Browsers\mercury1\mercury"
} -IconSize 16

Add-Button -Text "Mercury USER_DATA" -Top $MercuryTop -Left 10 -OnClick {
    Start-Process "G:\Apps\Browsers\mercury1\mercury\mercury.exe" -ArgumentList "--profile G:\Apps\Browsers\mercury1\USER_DATA"
	Hide-Form
} -ExecutablePath "G:\Apps\Browsers\mercury1\mercury\mercury.exe" -IconSize 16 -OffsetTop 0 -OffsetLeft 0

$TOR = 10
Add-Text -Text "TOR" -Top $TOR -Left 455 -FontSize 14

$TOR += 30

Add-BrowserFolderButton -Top $TOR -Left 600 -OnClick {
    Start-Process explorer.exe -ArgumentList "G:\Apps\Browsers\Tor\Browser"
} -IconSize 16

Add-Button -Text "TOR" -Top $TOR -Left 360 -OnClick {
    Start-Process "G:\Apps\Browsers\Tor\Browser\firefox.exe"
    Hide-Form
} -ExecutablePath "G:\Apps\Browsers\Tor\Browser\firefox.exe" -IconSize 16

$ThromiumOther = 100
Add-Text -Text "Thromium Other" -Top $ThromiumOther -Left 405 -FontSize 14

$ThromiumOther += 30

# ���������� �����
$form.ShowDialog() | Out-Null
