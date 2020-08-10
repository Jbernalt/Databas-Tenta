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
    class Spots
    {
        public static void ShowSpots()
        {
            string querystring =
                "SELECT Spot, Usedsize, size " +
                "FROM Spots";

            using (SqlConnection connection = new SqlConnection(Program.connectionString))
            {
                using (SqlCommand command = new SqlCommand(querystring, connection))
                {
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        Console.WriteLine();
                        Console.WriteLine("Spot \tUsed Size \tMax size");
                        Console.WriteLine("--------------------------------");
                        while (reader.Read())
                        {
                            Console.WriteLine("{0},\t{1},\t\t{2}", reader[0], reader[1], reader[2]);
                        }
                        reader.Close();
                    }
                    catch (Exception exp)
                    {
                        Console.WriteLine(exp);
                    }
                }
            }
            Console.WriteLine();

        }
    }
}
