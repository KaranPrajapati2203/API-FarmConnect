namespace API_FarmConnect
{
    public class ProductListingRequest
    {
        public long SellerId { get; set; }
        public long ProductId { get; set; }
        public decimal ListingQuantity { get; set; }
        public string ProductMeasureType { get; set; }

    }
}
