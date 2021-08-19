param location string
param appServicePlanId string
param webAppName string

resource webApp 'Microsoft.Web/sites@2021-01-15' = {
  name: webAppName
  location: location
  kind: 'app,linux,container'
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|felddy/foundryvtt:release'
    }
  }
}

output url string = 'https://${webApp.properties.hostNames}'
