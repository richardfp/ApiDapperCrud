using DataAccess.DbAccess;
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Data
{
    public class CustomerData : ICustomerData
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public CustomerData(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<IEnumerable<Customer>> GetCustomers() =>
            _sqlDataAccess.LoadData<Customer, dynamic>("dbo.sp_Customer_GetAll", new { });

        public async Task<Customer?> GetCustomer(int id)
        {
            var customers = await _sqlDataAccess.LoadData<Customer, dynamic>("dbo.sp_Customer_Get", new { Id = id });
            return customers.FirstOrDefault();
        }

        public Task InsertCustomer(Customer customer) =>
            _sqlDataAccess.SaveData("dbo.sp_Customer_Insert", new { customer.FirstName, customer.LastName });

        public Task UpdateCustomer(Customer user) =>
            _sqlDataAccess.SaveData("dbo.sp_Customer_Update", user);

        public Task DeleteCustomer(int id) =>
            _sqlDataAccess.SaveData("dbo.sp_Customer_Delete", new { Id = id });
    }
}
