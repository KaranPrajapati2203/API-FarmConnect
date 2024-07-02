using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace API_FarmConnect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly string? _connectionString;

        public ProductsController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("con");
        }

        [HttpGet]
        public async Task<IActionResult> GetProducts()
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var products = new List<Product>();

                    var getProductsSql = "SELECT * FROM Products WHERE IsDeleted = FALSE AND IsAvailable = TRUE";
                    using (var cmd = new NpgsqlCommand(getProductsSql, connection))
                    {
                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                products.Add(new Product
                                {
                                    ProductId = reader.GetInt64(reader.GetOrdinal("ProductId")),
                                    ProductName = reader.GetString(reader.GetOrdinal("ProductName")),
                                    ProductDescription = reader.GetString(reader.GetOrdinal("ProductDescription")),
                                    ProductPrice = reader.GetDecimal(reader.GetOrdinal("ProductPrice")),
                                    ProductTypeId = reader.GetInt64(reader.GetOrdinal("ProductTypeId")),
                                    ProductMeasureType = reader.GetString(reader.GetOrdinal("ProductMeasureType")),
                                    ProductImage = reader.GetString(reader.GetOrdinal("ProductImage")),
                                    MaxQuantity = reader.GetInt32(reader.GetOrdinal("MaxQuantity")),
                                    AvailableQuantity = reader.GetInt32(reader.GetOrdinal("AvailableQuantity")),
                                    IsNeeded = reader.GetBoolean(reader.GetOrdinal("IsNeeded")),
                                    IsAvailable = reader.GetBoolean(reader.GetOrdinal("IsAvailable")),
                                    CreatedAt = reader.GetDateTime(reader.GetOrdinal("CreatedAt"))
                                });
                            }
                        }
                    }

                    return Ok(products);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetProductById(long id)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var getProductSql = "SELECT * FROM Products WHERE ProductId = @ProductId AND IsDeleted = FALSE";
                    using (var cmd = new NpgsqlCommand(getProductSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@ProductId", id);

                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            if (await reader.ReadAsync())
                            {
                                var product = new Product
                                {
                                    ProductId = reader.GetInt64(reader.GetOrdinal("ProductId")),
                                    ProductName = reader.GetString(reader.GetOrdinal("ProductName")),
                                    ProductDescription = reader.GetString(reader.GetOrdinal("ProductDescription")),
                                    ProductPrice = reader.GetDecimal(reader.GetOrdinal("ProductPrice")),
                                    ProductTypeId = reader.GetInt64(reader.GetOrdinal("ProductTypeId")),
                                    ProductMeasureType = reader.GetString(reader.GetOrdinal("ProductMeasureType")),
                                    ProductImage = reader.GetString(reader.GetOrdinal("ProductImage")),
                                    MaxQuantity = reader.GetInt32(reader.GetOrdinal("MaxQuantity")),
                                    AvailableQuantity = reader.GetInt32(reader.GetOrdinal("AvailableQuantity")),
                                    IsNeeded = reader.GetBoolean(reader.GetOrdinal("IsNeeded")),
                                    IsAvailable = reader.GetBoolean(reader.GetOrdinal("IsAvailable")),
                                    CreatedAt = reader.GetDateTime(reader.GetOrdinal("CreatedAt"))
                                };

                                return Ok(product);
                            }
                            else
                            {
                                return NotFound(new { message = "Product not found." });
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

        [HttpPost]
        public async Task<IActionResult> CreateProduct([FromBody] Product product)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var insertProductSql = "INSERT INTO Products (ProductName, ProductDescription, ProductPrice, ProductTypeId, ProductMeasureType, ProductImage, MaxQuantity, AvailableQuantity, IsNeeded, IsAvailable) " +
                                            "VALUES (@ProductName, @ProductDescription, @ProductPrice, @ProductTypeId, @ProductMeasureType, @ProductImage, @MaxQuantity, @AvailableQuantity, @IsNeeded, @IsAvailable)";
                    using (var cmd = new NpgsqlCommand(insertProductSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
                        cmd.Parameters.AddWithValue("@ProductDescription", product.ProductDescription);
                        cmd.Parameters.AddWithValue("@ProductPrice", product.ProductPrice);
                        cmd.Parameters.AddWithValue("@ProductTypeId", product.ProductTypeId);
                        cmd.Parameters.AddWithValue("@ProductMeasureType", product.ProductMeasureType);
                        cmd.Parameters.AddWithValue("@ProductImage", product.ProductImage);
                        cmd.Parameters.AddWithValue("@MaxQuantity", product.MaxQuantity);
                        cmd.Parameters.AddWithValue("@AvailableQuantity", product.AvailableQuantity);
                        cmd.Parameters.AddWithValue("@IsNeeded", product.IsNeeded);
                        cmd.Parameters.AddWithValue("@IsAvailable", product.IsAvailable);

                        await cmd.ExecuteNonQueryAsync();

                        return Ok(new { message = "Product created successfully." });
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateProduct(long id, [FromBody] Product product)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var updateProductSql = "UPDATE Products SET ProductName = @ProductName, ProductDescription = @ProductDescription, ProductPrice = @ProductPrice, ProductTypeId = @ProductTypeId, " +
                                           "ProductMeasureType = @ProductMeasureType, ProductImage = @ProductImage, MaxQuantity = @MaxQuantity, AvailableQuantity = @AvailableQuantity, IsNeeded = @IsNeeded, IsAvailable = @IsAvailable " +
                                           "WHERE ProductId = @ProductId AND IsDeleted = FALSE";
                    using (var cmd = new NpgsqlCommand(updateProductSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@ProductId", id);
                        cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
                        cmd.Parameters.AddWithValue("@ProductDescription", product.ProductDescription);
                        cmd.Parameters.AddWithValue("@ProductPrice", product.ProductPrice);
                        cmd.Parameters.AddWithValue("@ProductTypeId", product.ProductTypeId);
                        cmd.Parameters.AddWithValue("@ProductMeasureType", product.ProductMeasureType);
                        cmd.Parameters.AddWithValue("@ProductImage", product.ProductImage);
                        cmd.Parameters.AddWithValue("@MaxQuantity", product.MaxQuantity);
                        cmd.Parameters.AddWithValue("@AvailableQuantity", product.AvailableQuantity);
                        cmd.Parameters.AddWithValue("@IsNeeded", product.IsNeeded);
                        cmd.Parameters.AddWithValue("@IsAvailable", product.IsAvailable);

                        var rowsAffected = await cmd.ExecuteNonQueryAsync();
                        if (rowsAffected > 0)
                        {
                            return Ok(new { message = "Product updated successfully." });
                        }
                        else
                        {
                            return NotFound(new { message = "Product not found or already deleted." });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }

        [HttpPost("listings")]
        public async Task<IActionResult> AddProductListing([FromBody] ProductListingRequest request)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Insert into ProductListings table
                    var insertListingSql = "INSERT INTO ProductListings (SellerId, ProductId, ListingQuantity) " +
                                           "VALUES (@SellerId, @ProductId, @ListingQuantity) RETURNING ListingId";
                    long newListingId;
                    using (var cmd = new NpgsqlCommand(insertListingSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@SellerId", request.SellerId);
                        cmd.Parameters.AddWithValue("@ProductId", request.ProductId);
                        cmd.Parameters.AddWithValue("@ListingQuantity", request.ListingQuantity);

                        // Get the new listing ID generated by the RETURNING clause
                        newListingId = (long)await cmd.ExecuteScalarAsync();
                    }

                    // Update AvailableQuantity in Products table
                    var updateProductSql = "UPDATE Products SET AvailableQuantity = AvailableQuantity + @ListingQuantity " +
                                           "WHERE ProductId = @ProductId AND IsDeleted = FALSE AND IsAvailable = TRUE";
                    using (var cmd = new NpgsqlCommand(updateProductSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@ProductId", request.ProductId);
                        cmd.Parameters.AddWithValue("@ListingQuantity", request.ListingQuantity);

                        await cmd.ExecuteNonQueryAsync();
                    }

                    return Ok(new { message = "Product listed successfully.", listingId = newListingId });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }

        [HttpGet("user/{userId}/listings")]
        public async Task<IActionResult> GetListingsByUserId(long userId)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var listings = new List<ProductListing>();

                    var getListingsSql = "SELECT pl.*, p.ProductName, p.ProductPrice, p.ProductImage, p.AvailableQuantity " +
                                         "FROM ProductListings pl " +
                                         "JOIN Products p ON pl.ProductId = p.ProductId " +
                                         "WHERE pl.SellerId = @UserId AND pl.IsDeleted = FALSE";

                    using (var cmd = new NpgsqlCommand(getListingsSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                listings.Add(new ProductListing
                                {
                                    ListingId = reader.GetInt64(reader.GetOrdinal("ListingId")),
                                    SellerId = reader.GetInt64(reader.GetOrdinal("SellerId")),
                                    ProductId = reader.GetInt64(reader.GetOrdinal("ProductId")),
                                    ProductName = reader.GetString(reader.GetOrdinal("ProductName")),
                                    ProductPrice = reader.GetDecimal(reader.GetOrdinal("ProductPrice")),
                                    ProductImage = reader.GetString(reader.GetOrdinal("ProductImage")),
                                    ListingQuantity = reader.GetDecimal(reader.GetOrdinal("ListingQuantity")),
                                    CreatedAt = reader.GetDateTime(reader.GetOrdinal("CreatedAt"))
                                });
                            }
                        }
                    }

                    return Ok(listings);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = $"Error: {ex.Message}" });
            }
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(long id)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var deleteProductSql = "UPDATE Products SET IsDeleted = TRUE WHERE ProductId = @ProductId";
                    using (var cmd = new NpgsqlCommand(deleteProductSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@ProductId", id);

                        var rowsAffected = await cmd.ExecuteNonQueryAsync();
                        if (rowsAffected > 0)
                        {
                            return Ok(new { message = "Product deleted successfully." });
                        }
                        else
                        {
                            return NotFound(new { message = "Product not found." });
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
