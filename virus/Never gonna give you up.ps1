Import-Module Selenium.WebDriver

$chromeDriverPath = "Ruta\al\ChromeDriver.exe"

$chromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$chromeOptions.AddArguments("--window-size=800,600")  # Configura les dimensions de la finestra
$chromeOptions.AddArguments("--disable-infobars")     # Desactiva les barres d'informació del navegador

$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($chromeDriverPath, $chromeOptions)

$videoUrl = "https://www.youtube.com/watch?v=https://www.youtube.com/watch?v=dQw4w9WgXcQ"
$driver.Navigate().GoToUrl($videoUrl)

$playerButton = $driver.FindElementById("movie_player")
$playerButton.Click()

# Redueix el volum (ajusta el valor segons les teves necessitats)
$volumeScript = @"
var video = document.querySelector("video");
video.volume = 1.0;
"@
$driver.ExecuteScript($volumeScript)

# Espera fins que el vídeo es reprodueixi durant un temps determinat
Start-Sleep -Seconds 600000000

# Tanca el navegador
$driver.Quit()