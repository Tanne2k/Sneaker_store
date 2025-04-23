namespace Lab03.Models
{
    public class Wishlist
    {
        public List<WishlistItem> Items { get; set; } = new List<WishlistItem>();


        //public void AddItem(WishlistItem item)
        //{

        //    var existingItem = Items.FirstOrDefault(i => i.ProductId == item.ProductId);
        //    if (existingItem != null)
        //    {
        //       return("Danh sách yêu thích đã được làm trống.");
        //    }
        //    else
        //    {
        //        Items.Add(item);
        //    }
        //}

        public void AddItem(WishlistItem item)
        {
            var existingItem = Items.FirstOrDefault(i => i.ProductId == item.ProductId);
            if (existingItem != null)
            {
                // Có thể ném một ngoại lệ hoặc log thông báo lỗi
                throw new InvalidOperationException("Sản phẩm đã thêm vào mục yêu thích của bạn trước đó 🥰");
            }
            else
            {
                Items.Add(item);
            }
        }


        public void RemoveItem(int productId)
        {
            Items.RemoveAll(i => i.ProductId == productId);
        }

        public void ClearItems()
        {
            Items.Clear();
        }
    }
}
