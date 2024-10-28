import { datadogRum } from '@datadog/browser-rum';

datadogRum.init({
    applicationId: '3cccb6a2-d546-4809-b697-f9066b1690f7',
    clientToken: 'pubc2e818bdba0277b9af63cf5f9d34442b',
    site: 'datadoghq.eu',
    service: 'nfc-connect',
    env: 'production',
    version: '1.0.0',
    sessionSampleRate: 100,
    sessionReplaySampleRate: 20,
    trackUserInteractions: true,
    trackResources: true,
    trackLongTasks: true,
    defaultPrivacyLevel: 'mask-user-input'
});
