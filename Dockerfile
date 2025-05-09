FROM mcr.microsoft.com/dotnet/sdk:7.0

WORKDIR /app

COPY . .

RUN dotnet restore HelloWorld.csproj

RUN dotnet publish HelloWorld.csproj -c Release -o out

WORKDIR /app/out

EXPOSE 80

ENTRYPOINT ["dotnet", "HelloWorld.dll"]
