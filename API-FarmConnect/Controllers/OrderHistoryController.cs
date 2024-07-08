using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace API_FarmConnect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderHistoryController : ControllerBase
    {
        private readonly string _connectionString;

        public OrderHistoryController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("con");
        }

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetOrderHistory(long userId)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var orders = new List<Order>();

                    var getOrderSql = @"
                    SELECT o.OrderId, o.UserId, o.OrderDate, o.TotalAmount, o.OrderStatus, o.CreatedAt,
                           oi.OrderItemId, oi.ProductId, oi.Quantity, oi.Price, oi.CreatedAt as OrderItemCreatedAt,
                           p.ProductName, p.ProductDescription, p.SellingPrice, p.ProductMeasureType, p.ProductImage
                    FROM Orders o
                    JOIN OrderItems oi ON o.OrderId = oi.OrderId
                    JOIN Products p ON oi.ProductId = p.ProductId
                    WHERE o.UserId = @UserId
                    ORDER BY o.OrderDate DESC";

                    using (var cmd = new NpgsqlCommand(getOrderSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            long currentOrderId = 0;
                            Order currentOrder = null;

                            while (await reader.ReadAsync())
                            {
                                long orderId = reader.GetInt64(reader.GetOrdinal("OrderId"));

                                if (orderId != currentOrderId)
                                {
                                    if (currentOrder != null)
                                    {
                                        orders.Add(currentOrder);
                                    }

                                    currentOrderId = orderId;
                                    currentOrder = new Order
                                    {
                                        OrderId = orderId,
                                        UserId = reader.GetInt64(reader.GetOrdinal("UserId")),
                                        OrderDate = reader.GetDateTime(reader.GetOrdinal("OrderDate")),
                                        TotalAmount = reader.GetDecimal(reader.GetOrdinal("TotalAmount")),
                                        OrderStatus = reader.GetString(reader.GetOrdinal("OrderStatus")),
                                        CreatedAt = reader.GetDateTime(reader.GetOrdinal("CreatedAt")),
                                        OrderItems = new List<OrderItem>()
                                    };
                                }

                                var orderItem = new OrderItem
                                {
                                    OrderItemId = reader.GetInt64(reader.GetOrdinal("OrderItemId")),
                                    ProductId = reader.GetInt64(reader.GetOrdinal("ProductId")),
                                    Quantity = reader.GetDecimal(reader.GetOrdinal("Quantity")),
                                    Price = reader.GetDecimal(reader.GetOrdinal("Price")),
                                    CreatedAt = reader.GetDateTime(reader.GetOrdinal("OrderItemCreatedAt")),
                                    ProductName = reader.GetString(reader.GetOrdinal("ProductName")),
                                    ProductDescription = reader.GetString(reader.GetOrdinal("ProductDescription")),
                                    ProductPrice = reader.GetDecimal(reader.GetOrdinal("SellingPrice")),
                                    ProductMeasureType = reader.GetString(reader.GetOrdinal("ProductMeasureType")),
                                    ProductImage = reader.GetString(reader.GetOrdinal("ProductImage"))
                                };

                                currentOrder.OrderItems.Add(orderItem);
                            }

                            if (currentOrder != null)
                            {
                                orders.Add(currentOrder);
                            }
                        }
                    }

                    return Ok(orders);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }
    }
}
