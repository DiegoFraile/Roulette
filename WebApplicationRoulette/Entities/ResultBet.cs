using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplicationRoulette.Entities
{
    public class ResultBet
    {
        [Key]
        public int IdBet { get; set; }
        public int IdRoulette { get; set; }
        public int IdPlayer { get; set; }
        public int TypeBet { get; set; }
        public string ValueBet { get; set; }
        public double AmountBet { get; set; }
        public double Win { get; set; }
    }
}
