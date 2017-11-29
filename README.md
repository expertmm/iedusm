# iedusm
IntegratorEdu System Management: manage your hardware from your self-hosted IntegratorEdu instance.

## Changes
* (2017-11-29) initial commit
	* implement self-install as per https://stackoverflow.com/questions/2072288/installing-windows-service-programmatically
	* (actual problem was bad syntax) resolve async could not be found
		* Project settings, compiling, convert to .NET Framework 4.5.1 [4.5.1 is installed in Windows 10 by default]
		* add the async targeting pack as per http://community.sharpdevelop.net/blogs/christophwille/archive/2012/05/04/async-targeting-pack-in-sharpdevelop-4-2-and-later.aspx
			* right-click project, "Manage Packages..." then download it from there (now called "Microsoft Async")
			  (still doesn't work)
	* resolve ManagementObjectSearcher could not be found:
		* add System.Management assembly reference manually


## Known Issues
* regularly get config from server (the following variables):
	* push_interval_ms
	* pull_interval_ms
	* update_interval_hours
	* web_service_base_url


## Nuget packages of note:
	* cryptography (Microsoft)
	* System.Runtime.WindowsRuntime: "improve operation between managed code and the Windows Runtime" such as System.WindowsRuntimeSystemExtensions, System.IO.WindowsRuntimeStorageExtensions, System.Runtime.InteropServices.WindowsRuntime.AsyncInfo
		* possibly use storage extension for mapping drives in a userspace application
	* System.Net.WebSockets
	* System.Security.Claims
	* System.Net.Requests is for backward compatibility but says to use System.Net.Http (now builtin) instead.
	* System.Security.Principal.Windows: "for retrieving the current Windows user and for interacting with Windows users and groups"
	* System.Net.Security: "uses SSL/TLS protocols to provide secure network communication between client and server endpoints"
	* Microsoft.Extensions.WebEncoders (I don't fully understand this but it is related to dependency injection)
	* System.IO.Pipes: "interprocess communication through anonymous and/or named pipes"
	* Bouncy Castle
	* SpecFlow: bridges the gap between domain experts and developers
	* MailKit
	* (got to page 42 of over 500)
	* various LevelDB and Redis APIs
	
## Authors
### Jacob Gustafson

## Developer Notes
* RSSID is "wi-fi signal strength ID" according to <https://answers.ros.org/question/150691/wi-fi-localisation-using-amcl/>
* inline documentation of wlanSignalQuality says it is 0 to 100, which corresponds linearly to -100dBm to -50dBm (decibel-milliwatts, aka decibels relative to a milliwatt)
	* however sometimes RSSID is -40 or even -39 (0 is perfect)
* service can be updated by overwriting the exe file, as long as service is stopped
