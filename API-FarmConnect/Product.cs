namespace API_FarmConnect
{
    public class Product
    {
        public long ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public decimal ProductPrice { get; set; }
        public long ProductTypeId { get; set; }
        public string ProductMeasureType { get; set; }
        public string ProductImage { get; set; }
        public int SelectedQuantity { get; set; }
        public int MaxQuantity { get; set; }
        public bool IsAvailable { get; set; }
        public DateTime CreatedAt { get; set; }
        public bool IsDeleted { get; set; }
    }
}
