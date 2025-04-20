import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  configureMessagingService(
    serviceAPIUrl: string | undefined,
    organizationId: string,
    developerName: string
  ): string | undefined;
  openChatPage(): void;
  setPreChatData(data: { [key: string]: string }): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>(
  'SalesforceMessagingTurbo'
);
