FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /app
COPY *.csproj ./
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o out

WORKDIR /app/out
EXPOSE 80
ENTRYPOINT ["dotnet", "MyDotNetApp.dll"]
