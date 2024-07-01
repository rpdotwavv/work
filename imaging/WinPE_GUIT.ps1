# Save this script as RunScriptGUI.ps1
Add-Type -AssemblyName System.Windows.Forms

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Script Runner"
$form.Size = New-Object System.Drawing.Size(300, 250)
$form.StartPosition = "CenterScreen"

# Function to run the script
function Run-Script {
    param (
        [string]$scriptPath
    )

    if (Test-Path $scriptPath) {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c $scriptPath" -Wait
        [System.Windows.Forms.MessageBox]::Show("Script completed successfully.", "Info", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    } else {
        [System.Windows.Forms.MessageBox]::Show("Script not found.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
}

# Create buttons for each script
$script1Button = New-Object System.Windows.Forms.Button
$script1Button.Text = "Run Script 1"
$script1Button.Size = New-Object System.Drawing.Size(100, 50)
$script1Button.Location = New-Object System.Drawing.Point(100, 20)
$script1Button.Add_Click({
    Run-Script -scriptPath "X:\Scripts\script1.bat"
})

$script2Button = New-Object System.Windows.Forms.Button
$script2Button.Text = "Run Script 2"
$script2Button.Size = New-Object System.Drawing.Size(100, 50)
$script2Button.Location = New-Object System.Drawing.Point(100, 80)
$script2Button.Add_Click({
    Run-Script -scriptPath "X:\Scripts\script2.bat"
})

$script3Button = New-Object System.Windows.Forms.Button
$script3Button.Text = "Run Script 3"
$script3Button.Size = New-Object System.Drawing.Size(100, 50)
$script3Button.Location = New-Object System.Drawing.Point(100, 140)
$script3Button.Add_Click({
    Run-Script -scriptPath "X:\Scripts\script3.bat"
})

# Add buttons to the form
$form.Controls.Add($script1Button)
$form.Controls.Add($script2Button)
$form.Controls.Add($script3Button)

# Show the form
$form.Topmost = $true
$form.ShowDialog()
