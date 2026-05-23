# **HStartup**: Free Custom Startup Sounds V1.0.1

## (By **G.M Isaac**)

##### About HStartup:

HStartup is a free tool where you can customize your OS Startup sound, to give a little personality kick, at any time. This currently only works for Windows and other Windows based OS's like Tomex OS (provided Task Scheduler is enabled.)

##### Requirements for HStartup:

1\. Windows 7 OS and above.

2\. x86 32-Bit or x64 64-Bit

3\. The user that runs this script should have Admin permissions, because the script has to schedule a new task.

4\. HStartup and the Setup has to be ran outside of the zip file, otherwise, it wont work.

5\. The InstallAssets folder must have all corresponding files when setting up, otherwise it wont work.

6\. Windows Script Host should be installed. Dont worry, almost all Windows 10 and above OS's have it. If this isnt on, the Setup and the Logic wont work.

##### Custom Audio Specifications:

1. The custom audio file MUST be named HSsound. (if you are lazy to drop in your audio, dont worry, HStartup comes with a sample, and you dont have to erase it since HStartup prioritizes the custom audio over the sample)
2. The custom audio file MUST be a .wav file.
3. The custom audio file MUST be encoded as a 16-Bit PCM. Windows Media Object act weird with 24 bit or 32 bit PCM Encoded audios.

##### Troubleshooting:

(**Disclaimer**: This only covers known errors. If you find any error outside of this list, make a new issue in the Github Repository for HStartup)

1. ###### Sound doesnt play, what do i do?

   * Make sure your computer isnt muted.
   * Sound doesnt follow 1 or more reccomendations in the custom audio sections.
   * If you are in a laptop, the task scheduler may have scheduled the task to only start on **AC Power**. While the installer uses **PowerShell** to automatically turn off **"Start the task only if the computer is on AC Power"**, some builds of Windows 10 and higher may override it, and ypu can manually fix this by pressing **Win R**, type **taskschd.msc** and run it, then find the task named **HStartupTask** in the library, click it and go to Properties, then Conditions, and uncheck **"Start the task only if the computer is on AC Power"**
2. ###### Setup shows "Access Denied"!

   * You must accept the **UAC prompt** for it to work to tell Task Scheduler to Schedule a new task. If the UAC prompt didnt pop up, right click HS-Setup and click **Run as Administrator**.
   * Some aggressive **Antivirus Software** may block the creation of .vbs files and/or task scheduling. Check your **Antivirus's Quarantine** or **Blocked Actions** tab.
3. ###### Setup says "Files Missing"!

   * You may have **erased** the HSInstallAssets folder or an asset in it. Check your recycle bin for any missing assets. If this doesnt work, please download HStartup again.

##### Q\&A

###### Q: Why does the setup require **Administrator privileges**?

&#x20;A: HStartup needs to "talk" with the Windows Task Scheduler to Schedule a task so your custom sound always plays.

###### Q: Can i use an .MP3 or .FLAC file instead of a .WAV file?

&#x20;A: The logic uses WMP (Windows Media Player), which can handle other formats, but .wav is more reliable for other Windows versions, and optimized versions of Windows.

###### Q: Does this replace the official Windows Startup sound?

&#x20;A: No. This script runs at Logon, not at the kernel boot level. It does not modify important system files like imageres.dll.mun. It just plays your chosen sound once the user session starts.

###### Q: What happens if I move the folder after installing?

&#x20;A: The task will break, because the scheduled task always points towards the folder position where HStartup-Setup was ran at. If you move the assets folder, or the whole HStartup folder, you will need to run the installer again to make the task point at the new folder position.

###### Q: Does this slow down my computer?

&#x20;A: No. The script uses a really tiny ammount of ram via wscript.exe, and closes itself inmediatly after the audio file finishes playing.

###### Q: Why did the setup say "Waiting for PowerShell to respond?"

&#x20;A: On laptops, Windows tasks are blocked from running on battery power by default. The installer uses PowerShell to bypass this restriction so your sound works even if your laptop is not plugged in.

###### Q: Why does Windows say this file is unverified and a risk?

&#x20; A: You will see this warning since the files are not digitally signed. As an indie software creator, i dont have a paid developer certificate from a certificate authority. It is completely normal for Windows SmartScreen to flag this software, as it is unsigned. Add it to a whitelist so you dont get a warning that this is unverified everytime you startup.

###### Q: Is HStartup safe to run?

&#x20; A: Yes, HStartup is complete open source. You can check the code right here to see how HStartup works. If you download this from this repo, it is completely safe.

###### Q: How do i run it anyway if i see the warning?

&#x20; A: Click the More Info button and select Run anyway.

###### Q: Why dont you just... sign the app?

&#x20; A: Digital certificates cost hundreds of dollars every year. For a free, indie nonprofit project like this, the price is currently too high. Keeping the project open source lets the community verify the safety of the code instead.

#### Credits n' Stuff:

&#x20; HHHHH  HHHHH   SSSSSSSSS

&#x20; HHHHH  HHHHH  SSSSSSSSSS

&#x20; HHHHHHHHHHHH  SSSS

&#x20; HHHHHHHHHHHH   SSSSSSSSS

&#x20; HHHHH  HHHHH        SSSS

&#x20; HHHHH  HHHHH  SSSSSSSSSS

&#x20; HHHHH  HHHHH   SSSSSSSSS

FREE STARTUP SOUND CUSTOMIZER

##### Brought to you by:

&#x20; GGGGGGGGG       MMMM     MMMM     IIIIIIIII 

&#x20;GGGGGGGGGGG      MMMMM   MMMMM     IIIIIIIII

&#x20;GGG              MMMMMM MMMMMM        IIIII

&#x20;GGG    GGGG      MMMMMMMMMMMMM        IIIII

&#x20;GGG    GGGG      MMMM MMM MMMM        IIIII

&#x20;GGGGGGGGGGG      MMMM     MMMM     IIIIIIIII

&#x20; GGGGGGGGG       MMMM     MMMM     IIIIIIIII

G.M Isaac

&#x20;   \_\_\_\_\_\_\_\_\_

&#x20;  /    

&#x20;  |  |  |          

&#x20;  |   

&#x20;  |    u

&#x20;  \\\_\_\_\_\_\_\_\_\_
