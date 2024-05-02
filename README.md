
# MKNetworkManager

MKNetworkManager is a Swift framework designed to simplify network operations in iOS applications. It provides a convenient solution for fetching data from remote servers and handling common networking scenarios.

## Features

- **Data Fetching**: Asynchronously fetch data from URLs.
- **Error Handling**: Handle common networking errors such as invalid URLs or decoding failures.
- **Generic Support**: Supports generic types to accommodate diverse data models.
- **Simplicity**: Provides a concise and intuitive interface for easy integration into projects.

## Usage

1. Import MKNetworkManager into your Swift file:

```swift
import KMNetworkManager
```

2. Import MKNetworkManager into your Swift file:

```swift
let manager = NetworkManager<MyModel>()
manager.fetchData(from: "https://api.example.com/data") { result in
    switch result {
    case .success(let data):
        // Handle successful data retrieval
    case .failure(let error):
        // Handle error
    }
}
```

# MKNetworkManager XCFramework Creation

This guide explains how to create a Universal XCFramework for MKNetworkManager, a simple network manager tool, which can be used across iOS projects. This framework allows for seamless integration and usage within your iOS applications.

## Prerequisites

- Xcode installed on your system.
- Basic knowledge of using Terminal.

## Steps to Create XCFramework

### Step 1: Navigate to the Root Folder

Open Terminal and navigate to the root folder of your MKNetworkManager project.

```bash
cd path/to/your/project
```

### Step 2: Run Xcodebuild Commands

Option 1: Separate Commands
Run the following commands one by one in Terminal:

1) For iOS Simulator:
```bash
xcodebuild archive \
-scheme MKNetworkManager \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/MKNetworkManager.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

```
2) For iOS Device:
```bash
xcodebuild archive \
-scheme MKNetworkManager \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/MKNetworkManager.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

```
3) Create XCFramework:
```bash
xcodebuild -create-xcframework \
-framework './build/MKNetworkManager.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/MKNetworkManager.framework' \
-framework './build/MKNetworkManager.framework-iphoneos.xcarchive/Products/Library/Frameworks/MKNetworkManager.framework' \
-output './build/MKNetworkManager.xcframework'

```
Option 2: Combined Command
Alternatively, you can run all commands at once:

```bash
xcodebuild archive \
-scheme MKNetworkManager \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/MKNetworkManager.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild archive \
-scheme MKNetworkManager \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/MKNetworkManager.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild -create-xcframework \
-framework './build/MKNetworkManager.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/MKNetworkManager.framework' \
-framework './build/MKNetworkManager.framework-iphoneos.xcarchive/Products/Library/Frameworks/MKNetworkManager.framework' \
-output './build/MKNetworkManager.xcframework'

```

## Output Files

After running the provided commands, you'll find the following files within the "build" folder in your project directory:

1. **MKNetworkManager.xcframework** (as folder)
2. **MKNetworkManager.framework-iphoneos.xcarchive**
3. **MKNetworkManager.framework-iphonesimulator.xcarchive**

## Integration Instructions

To integrate the MKNetworkManager framework into your Xcode project:

1. Drag and drop the **MKNetworkManager.xcframework** folder into your Xcode project's file navigator.

2. Ensure that the framework is properly embedded and signed:
   - Select your project target in Xcode.
   - Go to the "General" tab.
   - Scroll down to the "Frameworks, Libraries, and Embedded Content" section.
   - Make sure the status for **MKNetworkManager.xcframework** is set to "Embed & Sign".

By following these steps, you'll successfully incorporate the MKNetworkManager framework into your project for seamless usage.


## Note

If you are creating your own Universal Framework and using the above commands note the below points
- Replace 'MKNetworkManager' with the actual name of your framework throughout the terminal commands.
- If you're using a custom framework name, ensure to substitute it wherever 'MKNetworkManager' is mentioned in the terminal commands.
- This ensures that the commands are tailored to your specific framework, avoiding any potential errors during the XCFramework creation process.



## License
MKNetworkManager is available under the MIT license. 
