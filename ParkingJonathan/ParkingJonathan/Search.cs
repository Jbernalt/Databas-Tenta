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
    class Search
    {
        public static void SearchVehicle(string Regnum)
        {
            string querystring =
                "SELECT v.VehicleID,  s.Spot, vt.VehicleType, v.Regnum, v.StartTime, " +
                "DATEDIFF(MINUTE, StartTime, GETDATE()) as Minutes," +

                "CASE " +
                    "WHEN DATEDIFF(MINUTE, StartTime, GETDATE()) <= 5 THEN 0 " +
                    "WHEN DATEDIFF(MINUTE, StartTime, GETDATE()) < 120 THEN Cost * 2 " +
                    "ELSE((DATEDIFF(MINUTE, StartTime, GETDATE()) / 60) + 1) * Cost " +
                    "END AS CostNow " +

                    "FROM Vehicle v " +
                    "join VehicleType vt " +
                    "on v.VehicleTypeID = vt.VehicleTypeID " +
                    "join Spots s " +
                    "on v.SpotsID = s.SpotsID " +
                    "Where v.Regnum = @regnum ";

            using (SqlConnection connection = new SqlConnection(Program.connectionString))
            {
                using (SqlCommand command = new SqlCommand(querystring, connection))
                {
                    command.Parameters.AddWithValue("@regnum", Regnum);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        Console.WriteLine();
                        Console.WriteLine("VehicleID  \tSpot \tVehicleType \tRegnum \t\tStartTime \t\tMinutes \tCostNow");
                        Console.WriteLine("---------------------------------------------------------------------------------------------------------");
                        while (reader.Read())
                        {
                            Console.WriteLine("{0}\t\t{1}\t{2}\t\t{3}\t\t{4}\t{5} \t\t{6}Kr", reader[0], reader[1], reader[2], reader[3], reader[4], reader[5], reader[6]);
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
