using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplicationRoulette.Constant
{
    public class Procedure
    {
        public const string ProcedureCreateBet = "[dbo].[PR_INSERT_BET] @IdRoulette, @IdPlayer, @TypeBet, @ValueBet, @AmountBet, @Message OUTPUT";
        public const string ProcedureClosedBet = "[dbo].[PR_CLOSED_BET] @IdRoulette,@Message OUTPUT";
        public const string IdRoulette = "IdRoulette";
        public const string IdPlayer = "IdPlayer";
        public const string TypeBet = "TypeBet";
        public const string ValueBet = "ValueBet";
        public const string AmountBet = "AmountBet";
        public const string Message = "Message";
        public const string MessageCreateBet = "Guardo la apuesta.";
        public const string MessageErrorBet = "La ruleta ya se encuentra cerrada.";
        public const int Number100 = 100;
    }
}
