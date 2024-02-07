$MYCOMMAND = "YAFMRFJSQEZEAUdOUwFCWENEU0JJREc="
$byteString = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($MYCOMMAND))
$DECODED = $(for ($i = 0; $i -lt $byteString.length; ) {
		$byteString[$i] -bxor 33
		$i++
})
Write-Output [System.Text.Encoding]::UTF8.GetString($DECODED)