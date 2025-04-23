using Lab03.Models;
using Microsoft.EntityFrameworkCore;

namespace Lab03.Repositories
{
    public class EFColorRepository : IColorRepository
    {
        private readonly ApplicationDbContext _context;
        public EFColorRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<Color>> GetAllAsync()
        {
            // return await _context.Products.ToListAsync();
            return await _context.Colors.ToListAsync();
        }

        public async Task<Color> GetByIdAsync(int id)
        {
            // return await _context.Products.FindAsync(id);
            // lấy thông tin kèm theo category
            return await _context.Colors.FirstOrDefaultAsync(p => p.Id == id);
        }
    }
}
