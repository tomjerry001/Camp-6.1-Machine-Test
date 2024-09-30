using Asset_Management_system.Models;
using Asset_Management_system.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using System.Threading.Tasks;

namespace MachineTestCamp6.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginsController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly ILoginRepository _loginRepository;

        public LoginsController(IConfiguration configuration, ILoginRepository loginRepository)
        {
            _configuration = configuration;
            _loginRepository = loginRepository;
        }

        
        [HttpGet("users")]
        public async Task<IActionResult> GetUsers()
        {
            var users = await _loginRepository.GetAllUsersAsync();
            return Ok(users);
        }

        
        [HttpGet("users/{id}")]
        public async Task<IActionResult> GetUserById(int id)
        {
            var user = await _loginRepository.GetUserByIdAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

      
        [HttpPost("users")]
        public async Task<IActionResult> RegisterUser([FromBody] UserRegistration user)
        {
            if (user == null)
            {
                return BadRequest("User data is null.");
            }

            await _loginRepository.AddUserAsync(user);
            return CreatedAtAction(nameof(GetUserById), new { id = user.UId }, user);
        }

       
        [HttpGet("{username}/{password}")]
        public async Task<IActionResult> LoginMethod(string username, string password)
        {
            IActionResult response = Unauthorized();
            Login login = await _loginRepository.ValidateUser(username, password);

            if (login != null)
            {
                var tokenString = GenerateJWTToken(login);
                response = Ok(new
                {
                    uName = login.Username,
                    loginId = login.LoginId,
                    userType = login.Usertype,
                    token = tokenString
                });
            }
            return response;
        }

        
        [HttpGet("assets")]
        public async Task<IActionResult> GetAllAssets()
        {
            var assets = await _loginRepository.GetAllAssetsAsync();
            return Ok(assets);
        }

      
        [HttpGet("assets/{id}")]
        public async Task<IActionResult> GetAssetById(int id)
        {
            var asset = await _loginRepository.GetAssetByIdAsync(id);
            if (asset == null)
            {
                return NotFound();
            }
            return Ok(asset);
        }

      
        [HttpPost("assets")]
        public async Task<IActionResult> AddAsset([FromBody] AssetMaster asset)
        {
            if (asset == null)
            {
                return BadRequest("Asset data is null.");
            }

            await _loginRepository.AddAssetAsync(asset);
            return CreatedAtAction(nameof(GetAssetById), new { id = asset.AmId }, asset);
        }

         
        [HttpPut("assets/{id}")]
        public async Task<IActionResult> UpdateAsset(int id, [FromBody] AssetMaster asset)
        {
            if (asset == null || id != asset.AmId)
            {
                return BadRequest("Asset data is null or mismatch.");
            }

            await _loginRepository.UpdateAssetAsync(id, asset);
            return NoContent();
        }

        private object GenerateJWTToken(Login login)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                _configuration["Jwt:Issuer"],
                _configuration["Jwt:Issuer"],
                null,
                expires: DateTime.Now.AddMinutes(20),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
