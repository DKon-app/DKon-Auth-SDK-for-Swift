# DKon Auth SDK for Swift

This is a simple SDK for authenticating users via the DKon API in Swift applications. It provides seamless integration for user login functionality.

## Features

- Easy user authentication with DKon API.
- Handles API responses effectively.
- Provides success and error handling.

## Installation

1. **Add the SDK to Your Project**:
   - Clone or download the SDK repository.
   - Drag the `DKonAuthSDK.xcodeproj` into your Xcode project.
   - Link the `DKonAuthSDK.framework` in your project settings.

2. **Import the SDK**:
   In your Swift files, import the SDK:
   ```swift
   import DKonAuthSDK

## Usage

## Example Code

```swift
let dkonAuth = DKonAuth(clientId: "1302")
dkonAuth.login(username: "yourUsername", password: "yourPassword") { result in
    switch result {
    case .success(let response):
        print("Login successful!")
        print("Access Token: \(response.accessToken ?? "")")
        print("Account ID: \(response.accountId ?? "")")
        
        // Handle successful login (e.g., transition to another screen)
        
    case .failure(let error):
        print("Login failed: \(error.localizedDescription)")
        
        // Handle error (e.g., show an alert to the user)
    }
}

```

## Support 

Web: https://DKon.app/dev

