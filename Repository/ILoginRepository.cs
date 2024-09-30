using Asset_Management_system.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Asset_Management_system.Repository
{
    public interface ILoginRepository
    {
       
        Task<Login> ValidateUser(string username, string password);
        Task<IEnumerable<UserRegistration>> GetAllUsersAsync();
        Task<UserRegistration> GetUserByIdAsync(int id);
        Task AddUserAsync(UserRegistration user);

      
        Task<IEnumerable<AssetMaster>> GetAllAssetsAsync();
        Task<AssetMaster> GetAssetByIdAsync(int id);
        Task AddAssetAsync(AssetMaster asset);
        Task UpdateAssetAsync(int id, AssetMaster asset);
    }
}
