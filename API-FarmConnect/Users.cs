﻿namespace API_FarmConnect
{
    public class Users
    {
        public long UserId { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public long RoleId { get; set; }
    }
}
