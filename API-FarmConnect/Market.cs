namespace API_FarmConnect
{
    public class Market
    {
        public long MarketId { get; set; }
        public string MarketName { get; set; }
        public string MarketDescription { get; set; }
        public decimal MarketLatitude { get; set; }
        public decimal MarketLongitude { get; set; }
        public string MarketAddress { get; set; }
        public string MarketImageUrl { get; set; } // New property for image URL
        public TimeSpan? MarketOpeningTime { get; set; }
        public TimeSpan? MarketClosingTime { get; set; }
        public DateTime CreatedAt { get; set; }
        public bool IsDeleted { get; set; }
    }
}
