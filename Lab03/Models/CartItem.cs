﻿namespace Lab03.Models
{
    public class CartItem
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; } 
        public string ImageUrl {  get; set; }
        public string size { get; set; }
        public string color { get; set; }
        //public string Hinh { get; set; }
    }
}
