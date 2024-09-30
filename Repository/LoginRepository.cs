using Asset_Management_system.Models;
using Asset_Management_system.Repository;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MachineTestCamp6.Repository
{
    public class LoginRepositoryImpl : ILoginRepository
    {
        private readonly AssetManagementSystemContext _context;

        public LoginRepositoryImpl(AssetManagementSystemContext context)
        {
            _context = context;
        }

         
        public async Task<Login> ValidateUser(string username, string password)
        {
            if (_context != null)
            {
                Login login = await _context.Logins
                    .FirstOrDefaultAsync(u => u.Username == username && u.Password == password);
                return login;
            }
            return null;
        }

      
        public async Task<IEnumerable<UserRegistration>> GetAllUsersAsync()
        {
            return await _context.UserRegistrations.ToListAsync();
        }

     
        public async Task<UserRegistration> GetUserByIdAsync(int id)
        {
            return await _context.UserRegistrations.FindAsync(id);
        }

        
        public async Task AddUserAsync(UserRegistration user)
        {
            await _context.UserRegistrations.AddAsync(user);
            await _context.SaveChangesAsync();
        }

        
        public async Task<IEnumerable<AssetMaster>> GetAllAssetsAsync()
        {
            return await _context.AssetMasters.ToListAsync();
        }

        
        public async Task<AssetMaster> GetAssetByIdAsync(int id)
        {
            return await _context.AssetMasters.FindAsync(id);
        }

        
        public async Task AddAssetAsync(AssetMaster asset)
        {
            await _context.AssetMasters.AddAsync(asset);
            await _context.SaveChangesAsync();
        }

        
        public async Task UpdateAssetAsync(int id, AssetMaster asset)
        {
            var existingAsset = await _context.AssetMasters.FindAsync(id);
            if (existingAsset != null)
            {
                existingAsset.AmAtypeid = asset.AmAtypeid;
                existingAsset.AmMakeid = asset.AmMakeid;
                existingAsset.AmAdId = asset.AmAdId;
                existingAsset.AmModel = asset.AmModel;
                existingAsset.AmSnnumber = asset.AmSnnumber;
                existingAsset.AmMyyear = asset.AmMyyear;
                existingAsset.AmPdate = asset.AmPdate;
                existingAsset.AmWarranty = asset.AmWarranty;
                existingAsset.AmFromDate = asset.AmFromDate;
                existingAsset.AmToDate = asset.AmToDate;

                _context.AssetMasters.Update(existingAsset);
                await _context.SaveChangesAsync();
            }
        }
    }
}
