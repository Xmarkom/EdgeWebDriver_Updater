# Edge Webdriver updater v1.0

## Description

Skript vykona aktualizaciu spustitelneho suboru `msedgewebdriver.exe`.
Skript vyzaduje spustenie s administratorskym opravnenim.   

The script will update (replace) the `msedgewebdriver.exe` executable file.
The script requires running with administrator rights.
        




---


## Information
Project name: **EdgeDriver Updater**      
Version: 1.0    
Programming lang: Windows CMD Bash scripting    
Created by: Marek Marko 
Date: 03/2022       
Target systems: OS Windows 10  


File structure:

```
ROOT\ >--- EdgeDriverUpdater.bat
                       readme.md
                             tmp\  > -- temporary folder
```

Variable:

```
set edriverpath1="C:\Users\%USERNAME%\AppData\Local\SeleniumBasic\"        :: path to updated file
set edriverpath2="C:\WebDriver\"                                           :: path to second updated file
set eDriverLink="https://msedgedriver.azureedge.net/119.0.2151.44/edgedriver_win64.zip"     
```