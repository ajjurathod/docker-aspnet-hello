FROM mcr.microsoft.com/dotnet/sdk:7.0

WORKDIR /app

# Copy csproj and restore dependencies
COPY HelloWorld/HelloWorld.csproj ./HelloWorld/
RUN dotnet restore HelloWorld/HelloWorld.csproj

# Copy rest of the source
COPY . .

# Publish the app
RUN dotnet publish HelloWorld/HelloWorld.csproj -c Release -o /app/published

WORKDIR /app/published
EXPOSE 80 
ENTRYPOINT ["dotnet", "HelloWorld.dll"]
