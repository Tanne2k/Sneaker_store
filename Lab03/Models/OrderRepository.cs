
using Lab03.Models;
using Microsoft.EntityFrameworkCore;

namespace Lab03.Repository
{
    public class OrderRepository : IOrderRepository
    {
        private readonly ApplicationDbContext _context;

        public OrderRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Order>> GetAllOrdersAsync()
        {
            return await _context.Orders
                           .Include(o => o.OrderDetails)
                           .ThenInclude(od => od.Product)
                           .OrderByDescending(o => o.OrderDate)
                           .ToListAsync();
                    
        }

        public async Task<IEnumerable<Order>> GetOrderByIdUserAsync(string id)
        {

            return await _context.Orders
                            .Include(o => o.OrderDetails)
                            .ThenInclude(od => od.Product)
                            .Where(o => o.UserId == id)
                            .OrderByDescending(o => o.OrderDate)
                            .ToListAsync();

        }

        //Phương thức xóa Order
        public async Task<Order> GetOrderByIdAsync(int id)
        {
            return await _context.Orders.FindAsync(id);
        }
        public async Task DeleteOrderAsync(Order order)
        {
            _context.Orders.Remove(order);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Order>> SearchAsync(int searchTerm)
        {
            var orders = await _context.Orders
                .Include(o => o.OrderDetails)
                .ThenInclude(od => od.Product)
                .Where(p => p.Id == searchTerm)
                .OrderByDescending(o => o.OrderDate)
                .ToListAsync();

            return orders;
        }
    }
}
