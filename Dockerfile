FROM mcr.microsoft.com/dotnet/sdk:7.0

WORKDIR /app

COPY . .

RUN dotnet restore docker-aspnet-hello.csproj

RUN dotnet publish docker-aspnet-hello.csproj -c Release -o out

WORKDIR /app/out

EXPOSE 80

ENTRYPOINT ["dotnet", "docker-aspnet-hello.dll"]
