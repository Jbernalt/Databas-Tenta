using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ParkingJonathan
{
    class Car
    {
        public static void AddCar(string getregnumCar)
        {
            string querystring =
                    "INSERT INTO Vehicle(Vehicle.VehicleTypeID, Vehicle.Regnum, Vehicle.StartTime) " +
                    "VALUES (2, UPPER(@regnum), GETDATE()) " +

                    "Update top(1) Spots " +
                    "set Spots.UsedSize = 100, Spots.Regnum = @regnum " +
                    "WHERE Spots.UsedSize = 0 " +

                    "update Vehicle " +
                    "set Vehicle.SpotsID = Spots.SpotsID " +
                    "from Vehicle " +
                    "join Spots " +
                    "ON Vehicle.Regnum = Spots.Regnum " +
                    "WHERE Spots.Regnum = Vehicle.Regnum " +

                    "update Spots " +
                    "set Regnum = NULL " +
                    "where Regnum = @regnum";

            using (SqlConnection connection = new SqlConnection(Program.connectionString))
            {
                using (SqlCommand sqlCommand = new SqlCommand(querystring))
                {
                    try
                    {
                        sqlCommand.Connection = connection;

                        sqlCommand.Parameters.Add("@regnum", SqlDbType.NVarChar).Value = getregnumCar;

                        connection.Open();
                        sqlCommand.ExecuteNonQuery();
                    }
                    catch (Exception)
                    {
                        Console.WriteLine("An Vehicle with {0} is already parked", getregnumCar);
                        Console.WriteLine();
                    }
                }
            }

        }
    }
}
