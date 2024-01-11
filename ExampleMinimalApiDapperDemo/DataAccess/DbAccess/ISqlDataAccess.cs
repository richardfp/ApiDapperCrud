
namespace DataAccess.DbAccess
{
    public interface ISqlDataAccess
    {
        Task<IEnumerable<T>> LoadData<T, U>(string storedProcedure, U Parameters, string connectionName = "Default");
        Task SaveData<T>(string storedprocedure, T Parameters, string connectionName = "Default");
    }
}