using Lab03.Models;

namespace Lab03.Repositories
{
    public interface IColorRepository
    {
        Task<IEnumerable<Color>> GetAllAsync();
        Task<Color> GetByIdAsync(int id);
    }
}
