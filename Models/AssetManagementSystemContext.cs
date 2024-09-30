﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Asset_Management_system.Models;

public partial class AssetManagementSystemContext : DbContext
{
    public AssetManagementSystemContext()
    {
    }

    public AssetManagementSystemContext(DbContextOptions<AssetManagementSystemContext> options)
        : base(options)
    {
    }

    public virtual DbSet<AssetDefinition> AssetDefinitions { get; set; }

    public virtual DbSet<AssetMaster> AssetMasters { get; set; }

    public virtual DbSet<AssetType> AssetTypes { get; set; }

    public virtual DbSet<Login> Logins { get; set; }

    public virtual DbSet<PurchaseOrder> PurchaseOrders { get; set; }

    public virtual DbSet<UserRegistration> UserRegistrations { get; set; }

    public virtual DbSet<Vendor> Vendors { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source =.; Initial Catalog =Asset Management System; Integrated Security = True; \nTrusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<AssetDefinition>(entity =>
        {
            entity.HasKey(e => e.AdId).HasName("PK__AssetDef__CAA4A6273CDE274B");

            entity.ToTable("AssetDefinition");

            entity.Property(e => e.AdId).HasColumnName("ad_id");
            entity.Property(e => e.AdClass)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ad_class");
            entity.Property(e => e.AdName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("ad_name");
            entity.Property(e => e.AdTypeId).HasColumnName("ad_type_id");

            entity.HasOne(d => d.AdType).WithMany(p => p.AssetDefinitions)
                .HasForeignKey(d => d.AdTypeId)
                .HasConstraintName("FK__AssetDefi__ad_ty__656C112C");
        });

        modelBuilder.Entity<AssetMaster>(entity =>
        {
            entity.HasKey(e => e.AmId).HasName("PK__AssetMas__B95A8ED00E727E23");

            entity.ToTable("AssetMaster");

            entity.Property(e => e.AmId).HasColumnName("am_id");
            entity.Property(e => e.AmAdId).HasColumnName("am_ad_id");
            entity.Property(e => e.AmAtypeid).HasColumnName("am_atypeid");
            entity.Property(e => e.AmFromDate).HasColumnName("am_from_date");
            entity.Property(e => e.AmMakeid).HasColumnName("am_makeid");
            entity.Property(e => e.AmModel)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("am_model");
            entity.Property(e => e.AmMyyear)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("am_myyear");
            entity.Property(e => e.AmPdate).HasColumnName("am_pdate");
            entity.Property(e => e.AmSnnumber)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("am_snnumber");
            entity.Property(e => e.AmToDate).HasColumnName("am_to_date");
            entity.Property(e => e.AmWarranty)
                .HasMaxLength(1)
                .IsUnicode(false)
                .HasColumnName("am_warranty");

            entity.HasOne(d => d.AmAd).WithMany(p => p.AssetMasters)
                .HasForeignKey(d => d.AmAdId)
                .HasConstraintName("FK__AssetMast__am_ad__71D1E811");

            entity.HasOne(d => d.AmAtype).WithMany(p => p.AssetMasters)
                .HasForeignKey(d => d.AmAtypeid)
                .HasConstraintName("FK__AssetMast__am_at__6FE99F9F");

            entity.HasOne(d => d.AmMake).WithMany(p => p.AssetMasters)
                .HasForeignKey(d => d.AmMakeid)
                .HasConstraintName("FK__AssetMast__am_ma__70DDC3D8");
        });

        modelBuilder.Entity<AssetType>(entity =>
        {
            entity.HasKey(e => e.AtId).HasName("PK__AssetTyp__61F8598847A2CE52");

            entity.ToTable("AssetType");

            entity.Property(e => e.AtId).HasColumnName("at_id");
            entity.Property(e => e.AtName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("at_name");
        });

        modelBuilder.Entity<Login>(entity =>
        {
            entity.HasKey(e => e.LoginId).HasName("PK__login__C2C971DB52D074E1");

            entity.ToTable("login");

            entity.HasIndex(e => e.Username, "UQ__login__F3DBC5723F7C7CBF").IsUnique();

            entity.Property(e => e.LoginId).HasColumnName("login_id");
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("username");
            entity.Property(e => e.Usertype)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("usertype");
        });

        modelBuilder.Entity<PurchaseOrder>(entity =>
        {
            entity.HasKey(e => e.PdId).HasName("PK__Purchase__F7562CCF76BFE297");

            entity.ToTable("PurchaseOrder");

            entity.Property(e => e.PdId).HasColumnName("pd_id");
            entity.Property(e => e.PdAdId).HasColumnName("pd_ad_id");
            entity.Property(e => e.PdDate).HasColumnName("pd_date");
            entity.Property(e => e.PdDdate).HasColumnName("pd_ddate");
            entity.Property(e => e.PdOrderNo)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("pd_order_no");
            entity.Property(e => e.PdQty).HasColumnName("pd_qty");
            entity.Property(e => e.PdStatus)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("pd_status");
            entity.Property(e => e.PdTypeId).HasColumnName("pd_type_id");
            entity.Property(e => e.PdVendorId).HasColumnName("pd_vendor_id");

            entity.HasOne(d => d.PdAd).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.PdAdId)
                .HasConstraintName("FK__PurchaseO__pd_ad__6B24EA82");

            entity.HasOne(d => d.PdType).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.PdTypeId)
                .HasConstraintName("FK__PurchaseO__pd_ty__6C190EBB");

            entity.HasOne(d => d.PdVendor).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.PdVendorId)
                .HasConstraintName("FK__PurchaseO__pd_ve__6D0D32F4");
        });

        modelBuilder.Entity<UserRegistration>(entity =>
        {
            entity.HasKey(e => e.UId).HasName("PK__user_reg__B51D3DEA88652977");

            entity.ToTable("user_registration");

            entity.Property(e => e.UId).HasColumnName("u_id");
            entity.Property(e => e.Address)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("address");
            entity.Property(e => e.Age).HasColumnName("age");
            entity.Property(e => e.FirstName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("first_name");
            entity.Property(e => e.Gender)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("gender");
            entity.Property(e => e.LastName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("last_name");
            entity.Property(e => e.LoginId).HasColumnName("login_id");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("phone_number");

            entity.HasOne(d => d.Login).WithMany(p => p.UserRegistrations)
                .HasForeignKey(d => d.LoginId)
                .HasConstraintName("FK__user_regi__login__5FB337D6");
        });

        modelBuilder.Entity<Vendor>(entity =>
        {
            entity.HasKey(e => e.VdId).HasName("PK__Vendor__277BC6C09EC556A1");

            entity.ToTable("Vendor");

            entity.Property(e => e.VdId).HasColumnName("vd_id");
            entity.Property(e => e.VdAddr)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("vd_addr");
            entity.Property(e => e.VdAtypeId).HasColumnName("vd_atype_id");
            entity.Property(e => e.VdFromDate).HasColumnName("vd_from_date");
            entity.Property(e => e.VdName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("vd_name");
            entity.Property(e => e.VdToDate).HasColumnName("vd_to_date");
            entity.Property(e => e.VdType)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("vd_type");

            entity.HasOne(d => d.VdAtype).WithMany(p => p.Vendors)
                .HasForeignKey(d => d.VdAtypeId)
                .HasConstraintName("FK__Vendor__vd_atype__68487DD7");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
