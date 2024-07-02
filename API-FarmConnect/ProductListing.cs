namespace API_FarmConnect
{
    public class ProductListing
    {
        public long ListingId { get; set; }
        public long SellerId { get; set; }
        public long ProductId { get; set; }
        public string ProductName { get; set; }
        public decimal ProductPrice { get; set; }
        public string ProductImage { get; set; }
        public decimal ListingQuantity { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
