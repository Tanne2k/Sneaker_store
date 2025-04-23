using Lab03.Models;

//namespace Lab03.Models
namespace Lab03.Repository
{
    public interface IOrderRepository
    {
        Task<IEnumerable<Order>> GetAllOrdersAsync();

        Task<IEnumerable<Order>> GetOrderByIdUserAsync(string id);
        Task<Order> GetOrderByIdAsync(int id);
        Task DeleteOrderAsync(Order order);

        Task<IEnumerable<Order>> SearchAsync(int searchTerm);
    }
}
