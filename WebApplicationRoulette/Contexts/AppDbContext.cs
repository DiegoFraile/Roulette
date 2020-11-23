using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplicationRoulette.Entities;

namespace WebApplicationRoulette.Contexts
{
    public class AppDbContext:DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options):base(options)
        {
        }

        public DbSet<Roulette> Roulette { get; set; }
        public DbSet<Player> Player { get; set; }
        public DbSet<Credit> Credit { get; set; }
        public DbSet<Bet> Bet { get; set; }
        public DbSet<ResultBet> ResultBet { get; set; }
    }
}
