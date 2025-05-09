FROM mcr.microsoft.com/dotnet/sdk:7.0

WORKDIR /app

# Copy entire HelloWorld directory and restore
COPY HelloWorld ./HelloWorld
RUN dotnet restore ./HelloWorld/HelloWorld.csproj

# Publish the app
RUN dotnet publish ./HelloWorld/HelloWorld.csproj -c Release -o /app/published

WORKDIR /app/published
EXPOSE 80
ENTRYPOINT ["dotnet", "HelloWorld.dll"]
