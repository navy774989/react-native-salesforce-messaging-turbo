import SalesforceMessagingTurbo from './NativeSalesforceMessagingTurbo';

export function configureMessagingService(
  serviceAPIUrl: string | undefined,
  organizationId: string,
  developerName: string
): string | undefined {
  return SalesforceMessagingTurbo.configureMessagingService(
    serviceAPIUrl,
    organizationId,
    developerName
  );
}

export function openChatPage() {
  return SalesforceMessagingTurbo.openChatPage();
}

export function setPreChatData(data: { [key: string]: string }): void {
  return SalesforceMessagingTurbo.setPreChatData(data);
}
