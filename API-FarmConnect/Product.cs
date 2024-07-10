namespace API_FarmConnect
{
    public class Product
    {
        public long? ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public decimal BuyingPrice { get; set; }
        public decimal SellingPrice { get; set; }
        public long ProductTypeId { get; set; }
        public string ProductMeasureType { get; set; }
        public string ProductImage { get; set; }
        public decimal? SelectedQuantity { get; set; }
        public decimal? MaxQuantity { get; set; }
        public decimal? AvailableQuantity { get; set; }
        public bool? IsNeeded { get; set; }
        public bool? IsAvailable { get; set; }
        public DateTime? CreatedAt { get; set; }
        public bool? IsDeleted { get; set; }
    }
}
