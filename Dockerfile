FROM mcr.microsoft.com/azure-powershell:latest

WORKDIR /app

RUN pwsh -c "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12"

RUN pwsh -c "Install-Module -Name PSWSMan -Force;Install-WSMan -Force;Install-Module -Name ExchangeOnlineManagement -Force;Install-Module -Name Microsoft.Graph -Force"

CMD ["pwsh"]
