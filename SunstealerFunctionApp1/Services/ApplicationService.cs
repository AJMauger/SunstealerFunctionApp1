
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Sunstealer.FunctionApp1.Models;
using Sunstealer.FunctionApp1.Monitor;

namespace Sunstealer.FunctionApp1.Services;

// ajm --------------------------------------------------------------------------------------------
/// <summary>
/// 
/// </summary>
public interface IApplicationService
{
    /// <summary>
    /// 
    /// </summary>
    public ConfigurationModel Configuration { get; }
}

// ajm --------------------------------------------------------------------------------------------
/// <summary>
/// 
/// </summary>
public class ApplicationService: IApplicationService, IHostedService
{
    /// <summary>
    /// 
    /// </summary>
    private readonly IConfiguration? _configuration;

    /// <summary>
    /// 
    /// </summary>
    private readonly ILogger? _logger;

    /// <summary>
    /// 
    /// </summary>
    public static LogLevel _logLevel = LogLevel.Trace;

    /// <summary>
    /// 
    /// </summary>
    public ConfigurationModel Configuration { get; set; } = new ConfigurationModel();

    // ajm ----------------------------------------------------------------------------------------
    /// <summary>
    /// 
    /// </summary>
    /// <param name="configuration"></param>
    /// <param name="logger"></param>
    /// <exception cref="Exception"></exception>
    public ApplicationService(IConfiguration configuration, ILogger<ApplicationService> logger)
    {
        _configuration = configuration ?? throw new Exception("configuration");
        _logger = logger ?? throw new Exception("logger");

        _logger.LogInformation($"ApplicationService.ApplicationService().", string.Empty);
    }

    // ajm ----------------------------------------------------------------------------------------
    /// <summary>
    /// 
    /// </summary>
    /// <param name="cancellationToken"></param>
    /// <returns></returns>
    public Task StartAsync(CancellationToken cancellationToken)
    {
        try {
            _logger?.LogInformation("ApplicationService.StartAsync()");
        }
        catch (Exception e)
        {
            _logger?.LogError(e, "ApplicationService.StartAsync()");
        }
        return Task.CompletedTask;
    }

    // ajm ----------------------------------------------------------------------------------------
    /// <summary>
    /// 
    /// </summary>
    /// <param name="cancellationToken"></param>
    /// <returns></returns>
    public Task StopAsync(CancellationToken cancellationToken)
    {
        try {
            _logger?.LogInformation("ApplicationService.StopAsync()");
        }
        catch (Exception e)
        {
            _logger?.LogError(e, "ApplicationService.StopAsync()");
        }

        return Task.CompletedTask;
    }


}
