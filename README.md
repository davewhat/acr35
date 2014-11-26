Code example from this thread: http://flomio.com/forums/topic/flojack-v2-acr35-and-swift/


So, you want to use the FloJack v2 (ACR35) drivers from Swift. We did too, and it took a little effort so we thought we would spare everyone some time and write up a little walk through.

We aren’t doing step-by-step hand holding instructions… instead we assume some familiarity with XCode. We also assume you have an existing Swift based project in the works

1) Get a copy of the drivers provided by Flomio
git clone https://github.com/flomio/flomio_ios

2) Copy just the .h files you will need into your application
They are located in the sub-directory ACR35/AudioJackDemo/AudioJack
Note: You will also need the libAudioJack.a file located in that path a little later on, so feel free to move it into your application now as well.

3) Import all the .h files into your application (aka: add them to your project)

4) Setup a bridging header so you can call Objective-C (.h) from Swift (.swift)

From your target, select “Build Settings” and search for “Bridging” you will find:
Swift Compiler – Code Generation >> Objective-C Bridging Header

If you already have a bridging header, you can use it. If not, you need to create a new bridging header such as:
MyProject-Bridging-Header.h

5) Create your bridging header (or edit the existing one)

At this point an attempt to build your project will fail because you specified a bridging header file but haven’t actually added it. You should simply add an Objective-C .h file with the same name you used above. Then add the following imports:
```
// AudioJack

 #import “ACRCRC16.h”
 #import “ACRAudioJackReader.h”
 #import “ACRResult.h”
 #import “ACRStatus.h”
 #import “ACRTrack1Data.h”
 #import “ACRTrack2Data.h”
 #import “ACRTrackData.h”
 #import “ACRAesTrackData.h”
 #import “ACRDukptTrackData.h”
 #import “ACRDukptReceiver.h”
 #import “AudioJackErrors.h”
```
After doing this, you will be able to call the ACR35 drivers from your Swift code and compile will succeed but linking will fail. For example, a Mach-O Linker Error will result from the following line in Swift: ACRAudioJackReader().reset()

6) Add the .a library
In your “Build Phases” add the libAudioJack.a file into the “Link Binary With Libraries” section.

7) Add the AudioToolbox.framework to Link Binary With Libraries.

8) And now a little sprinkle of magic

Create a file called “dummy.mm” with the following contents:
```
/*
* Do not remove this file. This file is to make Xcode to link with C++ Runtime
* Library automatically.
*/
```
9) Add the dummy.mm file into your project

10) Build is now a success