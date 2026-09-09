using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Moq;
using OpenTelemetry.Metrics;
using Sunstealer.FunctionApp1.Functions;
using Sunstealer.FunctionApp1.Models;
using Sunstealer.FunctionApp1.Services;
using System.Diagnostics.Metrics;

namespace Sunslealer.FunctionApp1.Tests;

public class UnitTest1
{
    private readonly IApplicationService _application;
    private readonly IConfiguration _configuration;
    private readonly IDbContextFactory<ApplicationDbContext> _dbContextFactory;
    private readonly ILogger<Functions> _logger;
    private readonly IMeterFactory _meterFactory;
    private readonly MeterProvider _meterProvider;
    private readonly ServiceCollection _ServiceCollection;

    public UnitTest1()
    {
        _ServiceCollection = new ServiceCollection();
        _ServiceCollection.AddLogging();
        var serviceProvider = _ServiceCollection.BuildServiceProvider();

        _configuration = new ConfigurationBuilder()
            .AddJsonFile(@"C:\Users\ajm\Documents\projects\ajm.azure\SunstealerFunctionApp1\local.settings.json")
            .Build();

        _logger = new Mock<ILogger<Functions>>().Object;

        var mockMeterFactory = new Mock<IMeterFactory>();
        mockMeterFactory
            .Setup(f => f.Create(It.IsAny<MeterOptions>()))
            .Returns(new Meter("Sunstealer.FunctionApp1.Worker"));
        _meterFactory = mockMeterFactory.Object;

        _meterProvider = new Mock<MeterProvider>().Object;

        var rawData = new List<Table1>
        {
            new Table1 { UUID = 1, Date1 = DateTime.UtcNow, Encrypted1 = "", Number1 = 1, Text1 = "One" },
            new Table1 { UUID = 2, Date1 = DateTime.UtcNow, Encrypted1 = "", Number1 = 2, Text1 = "Two" }
        };

        // var mockDbSet = rawData.BuildMockDbSet();

       var mockDbContextFactory = new Mock<IDbContextFactory<ApplicationDbContext>>();

        mockDbContextFactory.Setup(f => f.CreateDbContext())
            .Returns(() => new ApplicationDbContext(new DbContextOptionsBuilder<ApplicationDbContext>()
            .UseInMemoryDatabase("InMemoryTest")
            .Options));

        _dbContextFactory = mockDbContextFactory.Object;

        _application = new Mock<IApplicationService>().Object;
    }

    [Fact]
    public void Test1()
    {
        // arrange
        var context = new DefaultHttpContext();
        var request = context.Request;

        var function = new Functions(_application, _configuration, _dbContextFactory, _logger, _meterFactory, _meterProvider);

        // act
        IActionResult result = function.Log(request);

        if (ConfigurationModel.ChunkResponse == 0)
        {
            // assert
            Assert.IsType<ContentResult>(result);
            Assert.NotNull(result);
        }
        else
        {
            // assert
            Assert.IsType<ObjectResult>(result);
            Assert.NotNull(result);
        }
    }

    [Fact]
    public async Task Test2()
    {
        // arrange
        FixtureFunctionHost fixture = new FixtureFunctionHost();
        await fixture.Initialize();

        // act
        var response = await fixture._client.GetAsync($"{fixture._baseUrl}/api/Log");

        var headers = response.Headers;

        // assert
        Assert.True(headers.Contains("Server"));

        fixture.Dispose();
    }


    [Fact]
    public async Task Test3()
    {
        // arrange
        FixtureFunctionHost fixture = new FixtureFunctionHost();
        await fixture.Initialize();

        // act
        var response = await fixture._client.GetAsync($"{fixture._baseUrl}/api/Throw");

        var headers = response.Headers;

        // assert
        Assert.True(headers.Contains("Server"));

        fixture.Dispose();
    }
}
