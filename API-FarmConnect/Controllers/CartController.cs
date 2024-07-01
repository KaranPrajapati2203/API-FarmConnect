using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace API_FarmConnect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        private readonly string? _connectionString;

        public CartController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("con");
        }

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetCartItems(long userId)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var getCartSql = @"
                        SELECT c.CartId, c.UserId, c.ProductId, c.Quantity, c.CreatedAt, 
                               p.ProductName, p.ProductDescription, p.ProductPrice, p.ProductMeasureType, p.ProductImage
                        FROM Cart c
                        JOIN Products p ON c.ProductId = p.ProductId
                        WHERE c.UserId = @UserId";
                    using (var cmd = new NpgsqlCommand(getCartSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            var cartItems = new List<object>();
                            while (await reader.ReadAsync())
                            {
                                cartItems.Add(new
                                {
                                    CartId = reader.GetInt64(reader.GetOrdinal("CartId")),
                                    UserId = reader.GetInt64(reader.GetOrdinal("UserId")),
                                    ProductId = reader.GetInt64(reader.GetOrdinal("ProductId")),
                                    Quantity = reader.GetDecimal(reader.GetOrdinal("Quantity")),
                                    CreatedAt = reader.GetDateTime(reader.GetOrdinal("CreatedAt")),
                                    ProductName = reader.GetString(reader.GetOrdinal("ProductName")),
                                    ProductDescription = reader.GetString(reader.GetOrdinal("ProductDescription")),
                                    ProductPrice = reader.GetDecimal(reader.GetOrdinal("ProductPrice")),
                                    ProductMeasureType = reader.GetString(reader.GetOrdinal("ProductMeasureType")),
                                    ProductImage = reader.GetString(reader.GetOrdinal("ProductImage"))
                                });
                            }
                            return Ok(cartItems);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddToCart([FromBody] CartItem cartItem)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Check if the product is already in the cart
                    var checkCartSql = "SELECT Quantity FROM Cart WHERE UserId = @UserId AND ProductId = @ProductId";
                    using (var checkCmd = new NpgsqlCommand(checkCartSql, connection))
                    {
                        checkCmd.Parameters.AddWithValue("@UserId", cartItem.UserId);
                        checkCmd.Parameters.AddWithValue("@ProductId", cartItem.ProductId);

                        var existingQuantity = await checkCmd.ExecuteScalarAsync();
                        if (existingQuantity != null)
                        {
                            // Update the quantity if the product is already in the cart
                            var updateCartSql = "UPDATE Cart SET Quantity = @Quantity WHERE UserId = @UserId AND ProductId = @ProductId";
                            using (var updateCmd = new NpgsqlCommand(updateCartSql, connection))
                            {
                                updateCmd.Parameters.AddWithValue("@Quantity", (decimal)existingQuantity + cartItem.Quantity);
                                updateCmd.Parameters.AddWithValue("@UserId", cartItem.UserId);
                                updateCmd.Parameters.AddWithValue("@ProductId", cartItem.ProductId);
                                await updateCmd.ExecuteNonQueryAsync();
                            }
                        }
                        else
                        {
                            // Insert a new cart item if the product is not in the cart
                            var insertCartSql = "INSERT INTO Cart (UserId, ProductId, Quantity) VALUES (@UserId, @ProductId, @Quantity)";
                            using (var insertCmd = new NpgsqlCommand(insertCartSql, connection))
                            {
                                insertCmd.Parameters.AddWithValue("@UserId", cartItem.UserId);
                                insertCmd.Parameters.AddWithValue("@ProductId", cartItem.ProductId);
                                insertCmd.Parameters.AddWithValue("@Quantity", cartItem.Quantity);
                                await insertCmd.ExecuteNonQueryAsync();
                            }
                        }
                    }
                    return Ok(new { message = "Product added to cart successfully." });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }

        [HttpPut("{cartId}")]
        public async Task<IActionResult> UpdateCartItem(long cartId, [FromBody] CartItem cartItem)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var updateCartSql = "UPDATE Cart SET Quantity = @Quantity WHERE CartId = @CartId";
                    using (var cmd = new NpgsqlCommand(updateCartSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@Quantity", cartItem.Quantity);
                        cmd.Parameters.AddWithValue("@CartId", cartId);
                        await cmd.ExecuteNonQueryAsync();

                        return Ok(new { message = "Cart item updated successfully." });
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }

        [HttpDelete("{cartId}")]
        public async Task<IActionResult> DeleteCartItem(long cartId)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var deleteCartSql = "DELETE FROM Cart WHERE CartId = @CartId";
                    using (var cmd = new NpgsqlCommand(deleteCartSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@CartId", cartId);
                        await cmd.ExecuteNonQueryAsync();

                        return Ok(new { message = "Cart item deleted successfully." });
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
