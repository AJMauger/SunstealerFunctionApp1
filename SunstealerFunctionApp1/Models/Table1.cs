using System.ComponentModel.DataAnnotations;

namespace Sunstealer.FunctionApp1.Models;

/// <summary>
/// 
/// </summary>
public class Table1
{
    /// <summary>
    /// 
    /// </summary>
    [Key]
    public int UUID { get; set; }
    /// <summary>
    /// 
    /// </summary>
    public string Encrypted1 { get; set; } = string.Empty;
    /// <summary>
    /// 
    /// </summary>
    public DateTime? Date1 { get; set; }
    /// <summary>
    /// 
    /// </summary>
    public int Number1 { get; set; }
    /// <summary>
    /// 
    /// </summary>
    public string Text1 { get; set; } = string.Empty;
}
