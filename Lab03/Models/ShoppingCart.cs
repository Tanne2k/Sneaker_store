//using Lab03.Models;

//public class ShoppingCart
//{
//    public List<CartItem> Items { get; set; } = new List<CartItem>();

//    public int TotalPrice => (int)Items.Sum(item => item.Price * item.Quantity);
//    public void AddItem(CartItem item)
//    {
//        var existingItem = Items.FirstOrDefault(i => i.ProductId == item.ProductId);
//        if (existingItem != null)
//        {
//            existingItem.Quantity += item.Quantity;
//        }
//        else
//        {
//            Items.Add(item);
//        }
//    }

//    public void RemoveItem(int productId)
//    {
//        Items.RemoveAll(i => i.ProductId == productId);
//    }

//    public void ClearItems()
//    {
//        Items.Clear();
//    }
//    public void UpdateItemQuantity(int productId, int newQuantity)
//    {
//        var existingItem = Items.FirstOrDefault(i => i.ProductId == productId);
//        if (existingItem != null)
//        {
//            existingItem.Quantity = newQuantity;
//        }
//    }
//    public void UpdateQuantity(int productId, int newQuantity)
//    {
//        var item = Items.FirstOrDefault(i => i.ProductId == productId);
//        if (item != null)
//        {
//            if (newQuantity > 0)
//            {
//                item.Quantity = newQuantity;
//            }
//            else
//            {
//                RemoveItem(productId);
//            }
//        }
//    }
//    // Các phương thức khác...
//}

using Lab03.Models;

public class ShoppingCart
{
    public List<CartItem> Items { get; set; } = new List<CartItem>();

    public int TotalPrice => (int)Items.Sum(item => item.Price * item.Quantity);
    public void AddItem(CartItem item)
    {
        var existingItem = Items.FirstOrDefault(i => i.ProductId == item.ProductId);
        if (existingItem != null)
        {
            existingItem.Quantity += item.Quantity;
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
    public void UpdateItemQuantity(int productId, int newQuantity)
    {
        var existingItem = Items.FirstOrDefault(i => i.ProductId == productId);
        if (existingItem != null)
        {
            existingItem.Quantity = newQuantity;
        }
    }
    public void UpdateQuantity(int productId, int newQuantity)
    {
        var item = Items.FirstOrDefault(i => i.ProductId == productId);
        if (item != null)
        {
            if (newQuantity > 0)
            {
                item.Quantity = newQuantity;
            }
            else
            {
                RemoveItem(productId);
            }
        }
    }
    public void DecQuantity(int productId)
    {
        var item = Items.FirstOrDefault(i => i.ProductId == productId);
        if (item != null)
        {
            if (item.Quantity > 1)
            {
                item.Quantity--;
            }
            else
            {
                RemoveItem(productId);
            }
        }
    }
    public void IncQuantity(int productId)
    {
        var item = Items.FirstOrDefault(i => i.ProductId == productId);
        if (item != null)
        {
            if (item.Quantity >= 1)
            {
                item.Quantity++;
            }
        }
    }
    // Các phương thức khác...
}
