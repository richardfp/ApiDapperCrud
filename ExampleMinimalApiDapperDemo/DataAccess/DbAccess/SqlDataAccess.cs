using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DbAccess
{
    public class SqlDataAccess : ISqlDataAccess
    {
        private readonly IConfiguration _configuration;

        public SqlDataAccess(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<IEnumerable<T>> LoadData<T, U>(string storedProcedure, U Parameters, string connectionName = "Default")
        {
            using (IDbConnection connectio = new SqlConnection(_configuration.GetConnectionString(connectionName)))
            {
                return await connectio.QueryAsync<T>(storedProcedure, Parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task SaveData<T>(string storedprocedure, T Parameters, string connectionName = "Default")
        {
            using (IDbConnection connectio = new SqlConnection(_configuration.GetConnectionString(connectionName)))
            {
                await connectio.ExecuteAsync(storedprocedure, Parameters, commandType: CommandType.StoredProcedure);

            }
        }
    }
}
