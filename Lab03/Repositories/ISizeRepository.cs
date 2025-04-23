using Lab03.Models;

namespace Lab03.Repositories
{
    public interface ISizeRepository
    {
        Task<IEnumerable<Size>> GetAllAsync();
        Task<Size> GetByIdAsync(int id);
    }
}
