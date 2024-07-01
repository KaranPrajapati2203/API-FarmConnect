using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace API_FarmConnect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MarketController : ControllerBase
    {
        private readonly string? _connectionString;

        public MarketController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("con");
        }

        [HttpGet]
        public async Task<IActionResult> GetMarkets()
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var getMarketsSql = @"
                        SELECT MarketId, MarketName, MarketDescription, MarketLatitude, MarketLongitude, MarketAddress, 
                               MarketOpeningTime, MarketClosingTime, CreatedAt, IsDeleted,MarketImageUrl
                        FROM Marketplaces";
                    using (var cmd = new NpgsqlCommand(getMarketsSql, connection))
                    {
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            var markets = new List<Market>();
                            while (await reader.ReadAsync())
                            {
                                markets.Add(new Market
                                {
                                    MarketId = reader.GetInt64(reader.GetOrdinal("MarketId")),
                                    MarketName = reader.GetString(reader.GetOrdinal("MarketName")),
                                    MarketDescription = reader.GetString(reader.GetOrdinal("MarketDescription")),
                                    MarketLatitude = reader.GetDecimal(reader.GetOrdinal("MarketLatitude")),
                                    MarketLongitude = reader.GetDecimal(reader.GetOrdinal("MarketLongitude")),
                                    MarketAddress = reader.GetString(reader.GetOrdinal("MarketAddress")),
                                    MarketOpeningTime = reader.IsDBNull(reader.GetOrdinal("MarketOpeningTime")) ? (TimeSpan?)null : reader.GetTimeSpan(reader.GetOrdinal("MarketOpeningTime")),
                                    MarketClosingTime = reader.IsDBNull(reader.GetOrdinal("MarketClosingTime")) ? (TimeSpan?)null : reader.GetTimeSpan(reader.GetOrdinal("MarketClosingTime")),
                                    CreatedAt = reader.GetDateTime(reader.GetOrdinal("CreatedAt")),
                                    IsDeleted = reader.GetBoolean(reader.GetOrdinal("IsDeleted")),
                                    MarketImageUrl = reader.IsDBNull(reader.GetOrdinal("MarketImageUrl")) ? null : reader.GetString(reader.GetOrdinal("MarketImageUrl"))
                                });
                            }
                            return Ok(markets);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }

        [HttpGet("{marketId}")]
        public async Task<IActionResult> GetMarketById(long marketId)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var getMarketSql = @"
                        SELECT MarketId, MarketName, MarketDescription, MarketLatitude, MarketLongitude, MarketAddress, 
                               MarketOpeningTime, MarketClosingTime, CreatedAt, IsDeleted,MarketImageUrl
                        FROM Marketplaces
                        WHERE MarketId = @MarketId";
                    using (var cmd = new NpgsqlCommand(getMarketSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@MarketId", marketId);
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            if (await reader.ReadAsync())
                            {
                                var market = new Market
                                {
                                    MarketId = reader.GetInt64(reader.GetOrdinal("MarketId")),
                                    MarketName = reader.GetString(reader.GetOrdinal("MarketName")),
                                    MarketDescription = reader.GetString(reader.GetOrdinal("MarketDescription")),
                                    MarketLatitude = reader.GetDecimal(reader.GetOrdinal("MarketLatitude")),
                                    MarketLongitude = reader.GetDecimal(reader.GetOrdinal("MarketLongitude")),
                                    MarketAddress = reader.GetString(reader.GetOrdinal("MarketAddress")),
                                    MarketOpeningTime = reader.IsDBNull(reader.GetOrdinal("MarketOpeningTime")) ? (TimeSpan?)null : reader.GetTimeSpan(reader.GetOrdinal("MarketOpeningTime")),
                                    MarketClosingTime = reader.IsDBNull(reader.GetOrdinal("MarketClosingTime")) ? (TimeSpan?)null : reader.GetTimeSpan(reader.GetOrdinal("MarketClosingTime")),
                                    CreatedAt = reader.GetDateTime(reader.GetOrdinal("CreatedAt")),
                                    IsDeleted = reader.GetBoolean(reader.GetOrdinal("IsDeleted")),
                                    MarketImageUrl = reader.IsDBNull(reader.GetOrdinal("MarketImageUrl")) ? null : reader.GetString(reader.GetOrdinal("MarketImageUrl"))
                                };
                                return Ok(market);
                            }
                            else
                            {
                                return NotFound(new { message = $"Market with ID {marketId} not found." });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }
    }
}
