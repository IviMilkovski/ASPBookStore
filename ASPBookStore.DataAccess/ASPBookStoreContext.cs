using ASPBookStore.DataAccess.Configurations;
using ASPBookStore.Domain;
using Microsoft.EntityFrameworkCore;
using System;

namespace ASPBookStore.DataAccess
{
    public class ASPBookStoreContext : DbContext
    {

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new BookConfiguration());
            modelBuilder.ApplyConfiguration(new UserConfiguration());

            modelBuilder.Entity<Category>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<User>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Book>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Author>().HasQueryFilter(x => !x.IsDeleted);

            modelBuilder.Entity<Order>()
                .HasMany(x => x.OrderLines)
                .WithOne(x => x.Order)
                .HasForeignKey(x => x.OrderId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Author>()
                   .HasMany(x => x.BookAuthors)
                   .WithOne(x => x.Author)
                   .HasForeignKey(x => x.AuthorId)
                   .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<BookAuthor>().HasKey(x => new { x.BookId, x.AuthorId });
            modelBuilder.Entity<Category>().HasIndex(x => x.Name).IsUnique();
            modelBuilder.Entity<Author>().Property(x => x.FirstName).IsRequired().HasMaxLength(30);
            modelBuilder.Entity<Author>().Property(x => x.LastName).IsRequired().HasMaxLength(30);


            modelBuilder.Entity<UserUseCase>().HasKey(x => new { x.UseCaseId, x.UserId });

            base.OnModelCreating(modelBuilder);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-H84IFT9;Initial Catalog=KnjizaraCari;Integrated Security=True");
        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.Now;
                            e.ModifiedAt = null;
                            e.IsDeleted = false;
                            e.DeletedAt = null;
                            break;
                        case EntityState.Modified:
                            e.ModifiedAt = DateTime.Now;
                            break;
                    }
                }
            }

            return base.SaveChanges();
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Author> Authors { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<BookAuthor> BookAuthors { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderLine> OrderLines { get; set; }
        public DbSet<AuditLog> AuditLogs { get; set; }
    }
}