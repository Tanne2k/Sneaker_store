using Lab03.Models;
using Microsoft.EntityFrameworkCore;

namespace Lab03.Repositories
{
    public class EFSizeRepository : ISizeRepository
    {
        private readonly ApplicationDbContext _context;
        public EFSizeRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<Size>> GetAllAsync()
        {
            // return await _context.Products.ToListAsync();
            return await _context.Sizes.ToListAsync();
        }

        public async Task<Size> GetByIdAsync(int id)
        {
            // return await _context.Products.FindAsync(id);
            // lấy thông tin kèm theo category
            return await _context.Sizes.FirstOrDefaultAsync(p => p.Id == id);
        }
    }
}
