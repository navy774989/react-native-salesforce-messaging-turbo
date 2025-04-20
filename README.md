# react-native-salesforce-messaging-turbo

A React Native module for integrating Salesforce Messaging (In-App) into your React Native applications, built with the new React Native architecture (Fabric).

> **Note**: This is the new architecture (Fabric) version of [react-native-salesforce-messaging-nitro](https://github.com/navy774989/react-native-salesforce-messaging-nitro). If you're using the old React Native architecture, please use the original package instead.

## Features

- Configure Salesforce Messaging service
- Set pre-chat data
- Open chat interface
- Support for both iOS and Android
- Built with React Native's new architecture (Fabric)
- TypeScript support
- Improved performance with TurboModule

## Installation

```sh
# Using npm
npm install react-native-salesforce-messaging-turbo

# OR using Yarn
yarn add react-native-salesforce-messaging-turbo
```

### iOS Installation

For iOS, the installation is handled automatically by React Native's auto-linking. Just run:

```sh
cd ios && pod install
```

### Android Installation

1. Add the following to your `android/build.gradle`:

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven {
            url "https://s3.amazonaws.com/inapp.salesforce.com/public/android"
        }
    }
}
```

2. Add the following to your `android/app/build.gradle`:

```gradle
dependencies {
    implementation "com.salesforce.service:messaging-inapp-ui:1.8.0"
}
```

## Usage

```js
import { SalesforceMessaging } from 'react-native-salesforce-messaging-turbo';

// Configure the messaging service
SalesforceMessaging.configureMessagingService(
  'your-service-api-url',
  'your-organization-id',
  'your-developer-name'
);

// Set pre-chat data
SalesforceMessaging.setPreChatData({
  name: 'John Doe',
  email: 'john@example.com',
  // Add other pre-chat fields as needed
});

// Open the chat interface
SalesforceMessaging.openChatPage();
```

## API Reference

### `configureMessagingService(serviceAPIUrl, organizationId, developerName)`

Configures the Salesforce Messaging service.

| Parameter      | Type   | Description                                  |
| -------------- | ------ | -------------------------------------------- |
| serviceAPIUrl  | string | The URL of your Salesforce Messaging service |
| organizationId | string | Your Salesforce organization ID              |
| developerName  | string | The developer name for your deployment       |

### `setPreChatData(data)`

Sets pre-chat data for the conversation.

| Parameter | Type   | Description                                |
| --------- | ------ | ------------------------------------------ |
| data      | object | An object containing pre-chat field values |

### `openChatPage()`

Opens the chat interface.

## Example

```jsx
import React from 'react';
import { Button, View } from 'react-native';
import { SalesforceMessaging } from 'react-native-salesforce-messaging-turbo';

const App = () => {
  const startChat = () => {
    try {
      // Configure the service
      SalesforceMessaging.configureMessagingService(
        'https://messaging-service-dev-ed.develop.lightning.force.com/services/apexrest/MessagingService/',
        '00D000000000000',
        'MessagingService'
      );

      // Set pre-chat data
      SalesforceMessaging.setPreChatData({
        name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '1234567890',
      });

      // Open chat
      SalesforceMessaging.openChatPage();
    } catch (error) {
      console.error('Error starting chat:', error);
    }
  };

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Button title="Start Chat" onPress={startChat} />
    </View>
  );
};

export default App;
```

## Requirements

- React Native >= 0.70.0 (new architecture)
- iOS >= 13.0
- Android API Level >= 24

## Migration from Old Architecture

If you're migrating from the old architecture version ([react-native-salesforce-messaging-nitro](https://github.com/navy774989/react-native-salesforce-messaging-nitro)), here are the key differences:

1. **Architecture Change**:

   - Old: Uses the legacy bridge architecture
   - New: Uses TurboModule system with Fabric

2. **Performance Improvements**:

   - Direct native method invocation
   - Reduced bridge overhead
   - Better memory management

3. **Type Safety**:

   - Enhanced TypeScript support
   - Better type definitions
   - Improved error handling

4. **Installation**:
   - Requires React Native 0.70.0 or higher
   - Different pod installation process
   - Updated Android configuration

## License

MIT

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
