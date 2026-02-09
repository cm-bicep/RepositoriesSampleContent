extension microsoftGraphV1

resource app 'Microsoft.Graph/applications@v1.0' = {
  uniqueName: 'TestMsGraphBicep'
  displayName: 'TestMsGraphBicep'
  description: 'TestMsGraphBicep'
}
