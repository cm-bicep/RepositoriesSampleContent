extension MicrosoftSecurity

// targetScope = 'tenant'

resource test_detection_rule 'Microsoft.Security/detectionRules@2026-01-01-preview' = {
  displayName: 'Hello from Github'
  isEnabled: false
  queryCondition: {
    queryText: 'DeviceEvents\r\n| take 10'
  }
  schedule: {
    period: '24H'
  }
  detectionAction: {
    alertTemplate: {
      title: 'Hello from Github'
      description: 'test'
      severity: 'medium'
      category: 'Exfiltration'
      recommendedActions: 'test'
      mitreTechniques: []
      impactedAssets: [
        {
          '@odata.type': '#microsoft.graph.security.impactedDeviceAsset'
          identifier: 'deviceName'
        }
        {
          '@odata.type': '#microsoft.graph.security.impactedDeviceAsset'
          identifier: 'remoteDeviceName'
        }
        {
          '@odata.type': '#microsoft.graph.security.impactedUserAsset'
          identifier: 'accountSid'
        }
        {
          '@odata.type': '#microsoft.graph.security.impactedMailboxAsset'
          identifier: 'initiatingProcessAccountUpn'
        }
      ]
    }
    responseActions: [
      {
        '@odata.type': '#microsoft.graph.security.stopAndQuarantineFileResponseAction'
        identifier: 'deviceId,initiatingProcessSHA1'
      }
    ]
  }
}
