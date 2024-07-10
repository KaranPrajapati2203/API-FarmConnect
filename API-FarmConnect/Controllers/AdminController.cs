using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace API_FarmConnect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly string? _connectionString;

        public AdminController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("con");
        }

        [HttpGet("dashboard-data")]
        public async Task<IActionResult> GetDashboardData()
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Total counts queries (unchanged)
                    var totalUsersSql = "SELECT COUNT(*) FROM Users WHERE IsDeleted = FALSE";
                    var totalProductsSql = "SELECT COUNT(*) FROM Products WHERE IsDeleted = FALSE";
                    var totalOrdersSql = "SELECT COUNT(*) FROM Orders WHERE IsDeleted = FALSE";
                    var totalMarketplacesSql = "SELECT COUNT(*) FROM Marketplaces WHERE IsDeleted = FALSE";

                    long totalUsers, totalProducts, totalOrders, totalMarketplaces;

                    using (var cmd = new NpgsqlCommand(totalUsersSql, connection))
                    {
                        totalUsers = (long)await cmd.ExecuteScalarAsync();
                    }

                    using (var cmd = new NpgsqlCommand(totalProductsSql, connection))
                    {
                        totalProducts = (long)await cmd.ExecuteScalarAsync();
                    }

                    using (var cmd = new NpgsqlCommand(totalOrdersSql, connection))
                    {
                        totalOrders = (long)await cmd.ExecuteScalarAsync();
                    }

                    using (var cmd = new NpgsqlCommand(totalMarketplacesSql, connection))
                    {
                        totalMarketplaces = (long)await cmd.ExecuteScalarAsync();
                    }

                    // Product categories query (unchanged)
                    var productCategoriesSql = @"
                SELECT pt.ProductTypeName, COUNT(p.ProductId) AS ProductCount
                FROM Products p
                INNER JOIN ProductTypes pt ON p.ProductTypeId = pt.ProductTypeId
                WHERE p.IsDeleted = FALSE
                GROUP BY pt.ProductTypeName";

                    var productCategories = new List<object>();
                    using (var cmd = new NpgsqlCommand(productCategoriesSql, connection))
                    {
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                productCategories.Add(new
                                {
                                    ProductTypeName = reader.GetString(0),
                                    ProductCount = reader.GetInt32(1)
                                });
                            }
                        }
                    }

                    // New queries for additional metrics
                    // 1. User Registration Over Time
                    //    var userRegistrationOverTimeSql = @"
                    //SELECT DATE_TRUNC('month', CreatedAt) AS RegistrationMonth, COUNT(*) AS UserCount
                    //FROM Users
                    //WHERE IsDeleted = FALSE
                    //GROUP BY DATE_TRUNC('month', CreatedAt)
                    //ORDER BY RegistrationMonth";

                    //    var userRegistrationOverTime = new List<object>();
                    //    using (var cmd = new NpgsqlCommand(userRegistrationOverTimeSql, connection))
                    //    {
                    //        using (var reader = await cmd.ExecuteReaderAsync())
                    //        {
                    //            while (await reader.ReadAsync())
                    //            {
                    //                userRegistrationOverTime.Add(new
                    //                {
                    //                    RegistrationMonth = reader.GetDateTime(0),
                    //                    UserCount = reader.GetInt32(1)
                    //                });
                    //            }
                    //        }
                    //    }
                    var userRegistrationOverTimeSql = @"
                SELECT DATE_TRUNC('day', CreatedAt) AS RegistrationDay, COUNT(*) AS UserCount
                FROM Users
                WHERE IsDeleted = FALSE
                GROUP BY DATE_TRUNC('day', CreatedAt)
                ORDER BY RegistrationDay";

                    var userRegistrationOverTime = new List<object>();
                    using (var cmd = new NpgsqlCommand(userRegistrationOverTimeSql, connection))
                    {
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                userRegistrationOverTime.Add(new
                                {
                                    RegistrationDay = reader.GetDateTime(0),
                                    UserCount = reader.GetInt32(1)
                                });
                            }
                        }
                    }

                    // 2. Product Listings by Sellers
                    var productListingsBySellersSql = @"
                SELECT u.FirstName || ' ' || u.LastName AS SellerName, COUNT(pl.ListingId) AS ListingCount
                FROM ProductListings pl
                INNER JOIN Users u ON pl.SellerId = u.UserId
                WHERE pl.IsDeleted = FALSE
                GROUP BY u.FirstName, u.LastName";

                    var productListingsBySellers = new List<object>();
                    using (var cmd = new NpgsqlCommand(productListingsBySellersSql, connection))
                    {
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                productListingsBySellers.Add(new
                                {
                                    SellerName = reader.GetString(0),
                                    ListingCount = reader.GetInt32(1)
                                });
                            }
                        }
                    }

                    // 3. Orders Over Time
                    //    var ordersOverTimeSql = @"
                    //SELECT DATE_TRUNC('month', OrderDate) AS OrderMonth, COUNT(*) AS OrderCount
                    //FROM Orders
                    //WHERE IsDeleted = FALSE
                    //GROUP BY DATE_TRUNC('month', OrderDate)
                    //ORDER BY OrderMonth";

                    //    var ordersOverTime = new List<object>();
                    //    using (var cmd = new NpgsqlCommand(ordersOverTimeSql, connection))
                    //    {
                    //        using (var reader = await cmd.ExecuteReaderAsync())
                    //        {
                    //            while (await reader.ReadAsync())
                    //            {
                    //                ordersOverTime.Add(new
                    //                {
                    //                    OrderMonth = reader.GetDateTime(0),
                    //                    OrderCount = reader.GetInt32(1)
                    //                });
                    //            }
                    //        }
                    //    }
                    var ordersOverTimeSql = @"
                SELECT DATE_TRUNC('day', OrderDate) AS OrderDay, COUNT(*) AS OrderCount
                FROM Orders
                WHERE IsDeleted = FALSE
                GROUP BY DATE_TRUNC('day', OrderDate)
                ORDER BY OrderDay";

                    var ordersOverTime = new List<object>();
                    using (var cmd = new NpgsqlCommand(ordersOverTimeSql, connection))
                    {
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                ordersOverTime.Add(new
                                {
                                    OrderDay = reader.GetDateTime(0),
                                    OrderCount = reader.GetInt32(1)
                                });
                            }
                        }
                    }

                    // 4. Revenue by Product Type
                    var revenueByProductTypeSql = @"
               SELECT pt.ProductTypeName, SUM(oi.Quantity * oi.Price) AS TotalRevenue
                FROM OrderItems oi
                INNER JOIN Products p ON oi.ProductId = p.ProductId
                INNER JOIN ProductTypes pt ON p.ProductTypeId = pt.ProductTypeId
                INNER JOIN Orders o ON oi.OrderId = o.OrderId
                WHERE o.IsDeleted = FALSE 
                GROUP BY pt.ProductTypeName;";

                    var revenueByProductType = new List<object>();
                    using (var cmd = new NpgsqlCommand(revenueByProductTypeSql, connection))
                    {
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                revenueByProductType.Add(new
                                {
                                    ProductTypeName = reader.GetString(0),
                                    TotalRevenue = reader.GetDecimal(1)
                                });
                            }
                        }
                    }

                    var dashboardData = new
                    {
                        totalUsers,
                        totalProducts,
                        totalOrders,
                        totalMarketplaces,
                        productCategories,
                        userRegistrationOverTime,
                        productListingsBySellers,
                        ordersOverTime,
                        revenueByProductType
                    };

                    return Ok(dashboardData);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }

    }
}
