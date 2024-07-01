using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Npgsql;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace API_FarmConnect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly string? _connectionString;
        private readonly JwtOption _options;

        public UsersController(IConfiguration configuration, IOptions<JwtOption> options)
        {
            _connectionString = configuration.GetConnectionString("con");
            _options = options.Value;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] Users user)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Check if email already exists
                    var checkUserSql = "SELECT COUNT(1) FROM Users WHERE Email = @Email";
                    using (var checkUserCmd = new NpgsqlCommand(checkUserSql, connection))
                    {
                        checkUserCmd.Parameters.AddWithValue("@Email", user.Email);
                        int userCount = Convert.ToInt32(await checkUserCmd.ExecuteScalarAsync());
                        if (userCount > 0)
                        {
                            return BadRequest("Email already exists.");
                        }
                    }

                    // Insert new user
                    var insertUserSql = "INSERT INTO Users (FirstName, LastName, Email, Password, RoleId) " +
                                        "VALUES (@FirstName, @LastName, @Email, @Password, @RoleId)";
                    using (var cmd = new NpgsqlCommand(insertUserSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", user.FirstName);
                        cmd.Parameters.AddWithValue("@LastName", user.LastName);
                        cmd.Parameters.AddWithValue("@Email", user.Email);
                        cmd.Parameters.AddWithValue("@Password", user.Password);
                        cmd.Parameters.AddWithValue("@RoleId", user.RoleId);
                        await cmd.ExecuteNonQueryAsync();

                        return Ok(new { message = "Registration successful." });
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Error: {ex.Message}");
            }
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] Users loginDetails)
        {
            try
            {
                using (var connection = new NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Get the user by email
                    var getUserSql = "SELECT Userid, Email, Password, RoleId FROM Users WHERE Email = @Email";
                    using (var cmd = new NpgsqlCommand(getUserSql, connection))
                    {
                        cmd.Parameters.AddWithValue("@Email", loginDetails.Email);

                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            if (await reader.ReadAsync())
                            {
                                var user = new Users
                                {
                                    UserId = reader.GetInt64(reader.GetOrdinal("UserId")),
                                    Email = reader.GetString(reader.GetOrdinal("Email")),
                                    Password = reader.GetString(reader.GetOrdinal("Password")),
                                    RoleId = reader.GetInt64(reader.GetOrdinal("RoleId"))
                                };

                                // Verify the password
                                if (loginDetails.Password == user.Password)
                                {
                                    // Generate JWT token
                                    var jwtKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_options.Key));
                                    var credential = new SigningCredentials(jwtKey, SecurityAlgorithms.HmacSha256);

                                    List<Claim> claims = new List<Claim>()
                                    {
                                        new Claim("Email", loginDetails.Email),
                                        //new Claim(ClaimTypes.Role, user.RoleId.ToString())  // Include role in claims
                                        new Claim("RoleId", user.RoleId.ToString()),  // Include role in claims
                                        new Claim("UserId",user.UserId.ToString())
                                    };

                                    var sToken = new JwtSecurityToken(_options.Issuer, _options.Issuer, claims, expires: DateTime.Now.AddHours(1), signingCredentials: credential);
                                    var token = new JwtSecurityTokenHandler().WriteToken(sToken);

                                    return Ok(new { token });
                                }
                                else
                                {
                                    return Unauthorized(new { message = "Invalid email or password." });
                                }
                            }
                            else
                            {
                                return Unauthorized(new { message = "Invalid email or password." });
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
