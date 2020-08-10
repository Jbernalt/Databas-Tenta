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
    class MC
    {
        public static void AddMC(string getregnumMC)
        {
            string queryString =
                    "INSERT INTO Vehicle(Vehicle.VehicleTypeID, Vehicle.Regnum, Vehicle.StartTime) " +
                    "VALUES (1, UPPER(@regnum), GETDATE()) " +

                    "Update top(1) Spots " +
                    "set Spots.UsedSize = Spots.UsedSize + 50, Spots.Regnum = @regnum " +
                    "WHERE (Spots.UsedSize = 50) OR Spots.UsedSize = 0 " +

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
                using (SqlCommand sqlCommand = new SqlCommand(queryString))
                {
                    try
                    {
                        sqlCommand.Connection = connection;

                        sqlCommand.Parameters.Add("@regnum", SqlDbType.NVarChar).Value = getregnumMC;

                        connection.Open();
                        sqlCommand.ExecuteNonQuery();
                    }
                    catch(Exception)
                    {
                        Console.WriteLine("An Vehicle with {0} is already parked", getregnumMC);
                        Console.WriteLine();
                    }
                }
            }
        }

    }
}
