# Intro to Mobile Development Workshop

## Prerequisites

(You only need to follow these directions if you plan on following along during the workshop. It will be recorded so if you simply want to listen during the stream and follow along later, you are welcome to.)

- Android Studio (download: https://developer.android.com/studio, setup: https://imgur.com/a/D66g64m)
- If you don’t have an Android device, select “Android Virtual Device” when setting up Android Studio. This installs an emulator so you can test your app even without a physical device.

Once Android Studio is done setting up, you can try making a project to ensure everything works.

1. From the “Welcome to Android Studio” window (https://i.imgur.com/6AVFb7U.png), select the “Start a new Android Studio project” option.
2. Select “Basic Activity”.
3. At the “Configure your project” screen, make the name whatever you’d like, then press Finish.

Android Studio will begin downloading everything needed to build and run your new app. This might take a while.

Once it’s done, you will see “Gradle build finished” at the bottom of your screen, and your app’s layout will be displayed in the center. (https://i.imgur.com/dMXKZKq.png)

Let’s make sure that Android Studio can see your phone (or emulator, if you don’t have one).

If you have a physical device, you need to enable USB debugging:

1. Go to Settings.
2. Go to “About device” or something similar.
3. Find the build number and tap on that 7 times.
4. Go back, enter “Developer options”.
5. Scroll down until you see USB Debugging, and enable it.

Different devices will have slightly different ways of getting there, so when in doubt try googling “[your phone] enable usb debugging”.

If you have an emulator, you need to create a virtual device:

1. Click the virtual devices button at the top of Android Studio (looks like this: https://i.imgur.com/blRFq8J.png)
2. Click “Create Virtual Device…”
3. Choose Pixel 3.
4. Select “Download” next to “Pie” if you see it. (this will take a while)
5. Once downloaded, press Finish.

Finally, it’s time to test the app! If you have a physical device, now is the time to unlock it and plug it into your computer.

Press the green play button at the top of Android Studio and wait for the list of devices to load. If you have a physical device, you will most likely see a prompt on your phone screen. Tap “Accept” (or “OK”, or whatever the positive action is).

Now, select either your phone or emulator. Press OK. This is the moment of truth! If all’s good, you should see your newly-created app pop up on your phone after approximately a minute.

If you do, great! You’re ready to follow along during the workshop. You can close Android Studio now.