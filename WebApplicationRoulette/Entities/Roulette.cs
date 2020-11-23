using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplicationRoulette.Entities
{
    public class Roulette
    {
        [Key]
        public int IdRoulette { get; set; }
        public bool Status { get; set; }
        public string Name { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? ChangeDate { get; set; }
    }
}
