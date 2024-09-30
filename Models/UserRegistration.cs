using System;
using System.Collections.Generic;

namespace Asset_Management_system.Models;

public partial class UserRegistration
{
    public int UId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public int? Age { get; set; }

    public string Gender { get; set; } = null!;

    public string? Address { get; set; }

    public string? PhoneNumber { get; set; }

    public int? LoginId { get; set; }

    public virtual Login? Login { get; set; }
}
