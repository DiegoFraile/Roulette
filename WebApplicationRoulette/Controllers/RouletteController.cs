using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplicationRoulette.Constant;
using WebApplicationRoulette.Contexts;
using WebApplicationRoulette.Entities;

namespace WebApplicationRoulette.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RouletteController : ControllerBase
    {
        private readonly AppDbContext context;

        public RouletteController(AppDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Roulette>> GetListRoulette()
        {
            return context.Roulette.ToList();
        }

        [HttpGet("{id}")]
        public ActionResult OpenRoulette(int id)
        {
            try
            {
                var roulette = context.Roulette.FirstOrDefault(r => r.IdRoulette == id);
                roulette.Status = true;
                context.Entry(roulette).State = EntityState.Modified;
                context.SaveChanges();
                return Ok(Message.Successful);
            }
            catch (Exception ex)
            {
                return BadRequest(String.Concat(Message.Denied,ex.Message));
            }
        }
        
        [HttpPost]
        public ActionResult CreateRoulette([FromBody] Roulette roulette)
        {
            try
            {
                context.Roulette.Add(roulette);
                context.SaveChanges();
                return Created(nameof(OpenRoulette), new {id = roulette.IdRoulette });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("bet")]
        public ActionResult CreateBet([FromBody] Bet bet)
        {
            try
            {
                var message = this.CreateParamater(Procedure.Message, System.Data.DbType.String, Procedure.Number100,
                                        System.Data.ParameterDirection.Output);
                List<SqlParameter> parametersCreateBet = this.GetParamatersCreateBet(bet).ToList();
                parametersCreateBet.Add(message);
                context.Database.ExecuteSqlCommand(Procedure.ProcedureCreateBet,parameters: parametersCreateBet);
                string responseMessage = Convert.ToString(message.Value);
                if (responseMessage == Procedure.MessageCreateBet)
                {
                    return Ok(responseMessage);
                }
                else
                {
                    return BadRequest(responseMessage);
                }           
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("bet/{id}")]
        public ActionResult<IEnumerable<ResultBet>> ClosedBet(int id)
        {
            try
            {
                var idRoulette = this.CreateParamater(Procedure.IdRoulette, System.Data.DbType.Int32, id);
                var message = this.CreateParamater(Procedure.Message, System.Data.DbType.String,
                                                    Procedure.Number100, System.Data.ParameterDirection.Output);
                IEnumerable<ResultBet> resultBet = context.ResultBet.FromSql(Procedure.ProcedureClosedBet,parameters: new[] {idRoulette, message }).ToList();
                string responseMessagge = Convert.ToString(message.Value);
                if (responseMessagge != Procedure.MessageErrorBet)
                {
                    return Ok(resultBet);
                }
                else
                {
                    return BadRequest(responseMessagge);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IEnumerable<SqlParameter> GetParamatersCreateBet(Bet bet)
        {
            List<SqlParameter> parametersCreateBet = new List<SqlParameter>();
            var idRoulette = this.CreateParamater(Procedure.IdRoulette, System.Data.DbType.Int32, bet.IdRoulette);
            var idPlayer = this.CreateParamater(Procedure.IdPlayer, System.Data.DbType.Int32, bet.IdPlayer);
            var typeBet = this.CreateParamater(Procedure.TypeBet, System.Data.DbType.Int32, bet.TypeBet);
            var valueBet = this.CreateParamater(Procedure.ValueBet, System.Data.DbType.String, bet.ValueBet);
            var amountBet = this.CreateParamater(Procedure.AmountBet, System.Data.DbType.Single, bet.AmountBet);
            parametersCreateBet.Add(idRoulette);
            parametersCreateBet.Add(idPlayer);
            parametersCreateBet.Add(typeBet);
            parametersCreateBet.Add(valueBet);
            parametersCreateBet.Add(amountBet);

            return parametersCreateBet;
        }

        public SqlParameter CreateParamater(string name, System.Data.DbType type, object value)
        {
            return new SqlParameter
            {
                ParameterName = name,
                DbType = type,
                Value = value
            };
        }

        public SqlParameter CreateParamater(string name, System.Data.DbType type,int size, System.Data.ParameterDirection direction)
        {
            return new SqlParameter
            {
                ParameterName = name,
                DbType = type,
                Size = size,
                Direction = direction
            };
        }
    }
}