import { Text, View, StyleSheet, Pressable } from 'react-native';
import {
  configureMessagingService,
  openChatPage,
  setPreChatData,
} from 'react-native-salesforce-messaging-turbo';

export default function App() {
  const openChat = async () => {
    const uuid = configureMessagingService(
      'https://messaging-service-dev-ed.develop.lightning.force.com/services/apexrest/MessagingService/',
      '00D000000000000',
      'MessagingService'
    );
    setPreChatData({
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '1234567890',
    });
    if (uuid) {
      openChatPage();
    }
  };

  return (
    <View style={styles.container}>
      <Pressable
        // eslint-disable-next-line react-native/no-inline-styles
        style={{
          borderColor: 'blue',
          borderWidth: 1,
        }}
        onPress={() => openChat()}
      >
        <Text>Open Chat</Text>
      </Pressable>
    </View>
  );
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
