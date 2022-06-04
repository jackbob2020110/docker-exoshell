FROM mcr.microsoft.com/powershell:lts-7.2-ubuntu-20.04

WORKDIR /usr/src/scripts

RUN pwsh -c "Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted"
RUN pwsh -c "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12"

RUN pwsh -c "Install-Module -Name PSWSMan -Force"
RUN pwsh -c "Install-WSMan"
RUN pwsh -c "Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.5 -Force"

COPY . .

CMD ["pwsh"]