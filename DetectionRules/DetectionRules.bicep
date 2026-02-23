extension MicrosoftSecurity

// targetScope = 'tenant'

resource test_detection_rule 'Microsoft.Security/detectionRules@2026-01-01-preview' = {
  displayName: 'Hello from Github - bicep test'
  isEnabled: false
  queryCondition: {
    queryText: 'DeviceEvents\r\n| take 10'
  }
  schedule: {
    period: '24H'
  }
  detectionAction: {
    alertTemplate: {
      title: 'test bicep detection rule'
      description: 'test bicep detection rule'
      severity: 'medium'
      category: 'Exfiltration'
      recommendedActions: 'test bicep detection rule'
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
