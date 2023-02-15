# TestGIMA

If a Swift Package Manager package links 3.18.4, the unit tests will fail to run on simulator with the following error:

```
.../Debug-iphonesimulator/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' not valid for use in process: Trying to load an unsigned library
```

I believe the "unsigned" part is a red herring, but I haven't been able to determine what the real cause is.

3.18.2 successfully runs unit tests, and the big difference that I can see between 3.18.2 and 3.18.4 is the removal of i386. 
I do not have a theory on why this would lead to a code signing error. Neither is signed (and this is fine; Xcode will sign it).
I am building on an M1.

To use this sample project, go to `Package.swift` and switch between 3.18.2 and 3.18.4, and try to run unit tests on iPhone 
Simulator. Tested on iPhone 14 with Xcode 14.2.

A full log follows:

```
2023-02-15 17:17:08.001543-0500 xctest[40705:19734380] The bundle “TestGIMATests” couldn’t be loaded. Try reinstalling the bundle.
2023-02-15 17:17:08.001674-0500 xctest[40705:19734380] (dlopen(/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/TestGIMATests.xctest/TestGIMATests, 0x0109): Library not loaded: @rpath/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds
  Referenced from: <CC2B4919-37EA-3B3B-B0F5-5DE8E45C6AE7> /Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/TestGIMATests.xctest/TestGIMATests
  Reason: tried: '/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (code signature in <2BEFBEBF-60DA-3C30-BCDA-6545A602B599> '/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' not valid for use in process: Trying to load an unsigned library), '/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/PackageFrameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Applications/Xcode-14.2.0.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/Frameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/TestGIMATests.xctest/Frameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/TestGIMATests.xctest/../Frameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/TestGIMATests.xctest/Frameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/TestGIMATests.xctest/Frameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/TestGIMATests.xctest/../Frameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Users/ornapier/Library/Developer/Xcode/DerivedData/TestGIMA-asssetovewhecjdwcrrkmoylndpd/Build/Products/Debug-iphonesimulator/TestGIMATests.xctest/Frameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Applications/Xcode-14.2.0.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/Frameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Applications/Xcode-14.2.0.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/PrivateFrameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Applications/Xcode-14.2.0.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/lib/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2), '/Applications/Xcode-14.2.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/Frameworks/GoogleInteractiveMediaAds.framework/GoogleInteractiveMediaAds' (errno=2))
Program ended with exit code: 83
```
