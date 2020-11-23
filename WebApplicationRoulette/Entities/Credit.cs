using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplicationRoulette.Entities
{
    public class Credit
    {
        [Key]
        public int IdCredit { get; set; }
        public int IdPlayer { get; set; }
        public float ValueCredit { get; set; }
    }
}
