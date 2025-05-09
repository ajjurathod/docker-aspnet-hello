FROM mcr.microsoft.com/dotnet/sdk:7.0

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Restore dependencies
RUN dotnet restore docker-aspnet-hello.csproj

# Build and publish the app
RUN dotnet publish docker-aspnet-hello.csproj -c Release -o out

# Set working directory to the published output
WORKDIR /app/out

# Expose default HTTP port
EXPOSE 80

# Run the application
ENTRYPOINT ["dotnet", "docker-aspnet-hello.dll"]
