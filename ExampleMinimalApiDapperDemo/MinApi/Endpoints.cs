using DataAccess.Data;
using DataAccess.Models;

namespace MinApi
{
    public static class Endpoints
    {
        public static void AddEndpoints(this WebApplication app)
        {
            app.MapGet("/Users", GetUsers);
            app.MapGet("/Users/{id}", GetUser);
            app.MapPost("/Users", InsertUser);
            app.MapPut("/Users", UpdateUser);
            app.MapDelete("/Users", DeleteUser);
        }

        private static async Task<IResult> GetUsers(ICustomerData data)
        {
            try
            {
                return Results.Ok(await data.GetCustomers());
            }
            catch (Exception ex)
            {

                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> GetUser(int id, ICustomerData data)
        {
            try
            {
                var user = await data.GetCustomer(id);
                if (user == null) return Results.NotFound();

                return Results.Ok(user);
            }
            catch (Exception ex)
            {

                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> InsertUser(Customer user, ICustomerData data)
        {
            try
            {
                await data.InsertCustomer(user);

                return Results.Ok("Usuário foi inserido com sucesso!");
            }
            catch (Exception ex)
            {

                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> UpdateUser(Customer user, ICustomerData data)
        {
            try
            {
                await data.UpdateCustomer(user);

                return Results.Ok("Usuário foi atulizado com sucesso!");
            }
            catch (Exception ex)
            {

                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> DeleteUser(int id, ICustomerData data)
        {
            try
            {
                await data.DeleteCustomer(id);

                return Results.Ok("Usuário foi deletado com sucesso!");
            }
            catch (Exception ex)
            {

                return Results.Problem(ex.Message);
            }
        }
    }
}
