using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Configurations;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.OpenApi.Any;
using Microsoft.OpenApi.Models;

namespace Sunstealer.FunctionApp1.OpenApi;

/// <summary>
/// 
/// </summary>
public class DocumentFilter : IDocumentFilter
{
    // ajm: ---------------------------------------------------------------------------------------
    /// <summary>
    /// 
    /// </summary>
    /// <param name="req"></param>
    /// <param name="document"></param>
    public void Apply(IHttpRequestDataObject req, OpenApiDocument document)
    {
        var schemas = document.Components.Schemas;
        foreach (var schema in schemas)
        {
            if (schema.Key == "table1")
            {
                schema.Value.Example = new OpenApiArray() {
                    new OpenApiObject()
                    {
                        ["UUID"] = new OpenApiInteger(1),
                        ["Encrypted1"] = new OpenApiString("DecryptedText"),
                        ["Date1"] = new OpenApiDateTime(DateTime.Now),
                        ["Number1"] = new OpenApiInteger(1),
                        ["Text1"] = new OpenApiString("ClearText")
                    }
                };

                SetPropertyDescription(schema.Value.Properties, "uuid", "The unique identifier for the record.");
                SetPropertyDescription(schema.Value.Properties, "encrypted1", "Contains the decrypted evaluation string text.");
                SetPropertyDescription(schema.Value.Properties, "date1", "The timestamp when the transaction was logged.");
                SetPropertyDescription(schema.Value.Properties, "number1", "A numeric metric field.");
                SetPropertyDescription(schema.Value.Properties, "text1", "The unencrypted raw string data.");
            }
        }
    }

    private void SetPropertyDescription(IDictionary<string, OpenApiSchema> properties, string key, string description)
    {
        properties.TryGetValue(key, out var propertySchema);
        propertySchema?.Description = description;

    }
}

// ajm: ---------------------------------------------------------------------------------------
/// <summary>
/// 
/// </summary>
public class OpenApiConfigurationOptions : DefaultOpenApiConfigurationOptions
{
    /// <summary>
    /// 
    /// </summary>
    public OpenApiConfigurationOptions()
    {
        DocumentFilters.Add(new DocumentFilter());
    }

    /// <summary>
    /// 
    /// </summary>
    public override OpenApiInfo Info { get; set; } = new OpenApiInfo()
    {
        Version = "1.0.0",
        Title = "Azure Function API",
        Description = @""
    };

    /// <summary>
    /// 
    /// </summary>
    public override OpenApiVersionType OpenApiVersion { get; set; } = OpenApiVersionType.V3;
}
